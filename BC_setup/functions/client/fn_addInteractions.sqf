// FLAGS
if (!hasInterface) exitWith {};

// diag_log "added CBA eh";

["startVehicle", {

      params ["_startVehicle", "_cone", "_side"];

      if (missionNamespace getVariable ["BC_interactionsAdded", false]) exitWith {};
      missionNamespace setVariable ["BC_interactionsAdded", true];

      private _type = typeOf _startVehicle;
      
      // fnc is executed twice so we need to exit once
      
        {
         _flagActionRaise = ["ACE_MainActions", (localize "str_GRAD_flag_raise"), "",
         {[(_this select 0), true] call BC_flagsOnVehicles_fnc_toggleFlag;},
          {(side player == east) && isNull ((_this select 0) getVariable ["GRAD_flagObject",objNull])}] call ace_interact_menu_fnc_createAction;

        [_x, 0, ["ACE_MainActions"], _flagActionRaise] call ace_interact_menu_fnc_addActionToClass;

        } forEach ["rhs_gaz66_r142_vv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_nat_uaz_dshkm","rhs_gaz66_repair_vdv","gaz_funk","rhs_bmp1_msv","rhs_btr70_msv"];

        {
         _flagActionRemove = ["ACE_MainActions", (localize "str_GRAD_flag_remove"), "",
         {[(_this select 0), false] call BC_flagsOnVehicles_fnc_toggleFlag;},
          {(side player == east) && !isNull ((_this select 0) getVariable ["GRAD_flagObject",objNull])}] call ace_interact_menu_fnc_createAction;

        [_x, 0, ["ACE_MainActions"], _flagActionRemove] call ace_interact_menu_fnc_addActionToClass;

        } forEach ["rhs_gaz66_r142_vv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_nat_uaz_dshkm","rhs_gaz66_repair_vdv","gaz_funk","rhs_bmp1_msv","rhs_btr70_msv"];
      



      // REMOVE SPAWN

      _removeSpawn = ["ACE_MainActions", (localize "str_GRAD_buy_disable"), "",
       {
          private _thisThing = _this select 0;
          [_thisThing] call BC_setup_fnc_disableSpawn;
        },
        {true}] call ace_interact_menu_fnc_createAction;

      [typeOf _cone, 0, ["ACE_MainActions"], _removeSpawn] call ace_interact_menu_fnc_addActionToClass;




      // RADIO TRUCK DEPLOY


      _deployAction = [
          "RusRadioDeploy",
          (localize "str_GRAD_radio_deploy"),
          "",
          {
              params ["_radiotruck"];
              [_radiotruck] remoteExec ["GRAD_tracking_fnc_radioTruckDeploy", 2];
          },
          {
              params ["_radiotruck"];
              _isRetracted = ! (_radiotruck getVariable ["GRAD_isDeployed", false]);
              _isStationary = (speed _radiotruck) == 0;
              _isNotAnimated = ! (_radiotruck getVariable ["GRAD_isAnimating", false]);

              (side player == east) && _isStationary && _isRetracted && _isNotAnimated;
          }
      ] call ace_interact_menu_fnc_createAction;
      [_type, 0, ["ACE_MainActions"], _deployAction] call ace_interact_menu_fnc_addActionToClass;

      _retractAction = [
          "RusRadioRetract",
          (localize "str_GRAD_radio_retract"),
          "",
          {
              params ["_radiotruck"];
              [_radiotruck] remoteExec ["GRAD_tracking_fnc_radioTruckRetract", 2];
          },
          {
              params ["_radiotruck"];
              _isDeployed = _radiotruck getVariable ["GRAD_isDeployed", false];
              _isStationary = (speed _radiotruck) == 0;
              _isNotAnimated = ! (_radiotruck getVariable ["GRAD_isAnimating", false]);

              (side player == east) && _isStationary && _isDeployed && _isNotAnimated;
          }
      ] call ace_interact_menu_fnc_createAction;
      [_type, 0, ["ACE_MainActions"], _retractAction] call ace_interact_menu_fnc_addActionToClass;



      // RADIO TRUCK/BOX DESTROY

      _destroyAction = ["usDestroyMenu", (localize "str_GRAD_disable_vehicle"), "",
       {
       [60, [_this select 0], { BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";}, {hint "Cancelled action"}, (localize "str_GRAD_disabling_radio")] call ace_common_fnc_progressBar;
       },
        {(side player == west) && !GRAD_TERMINAL}] call ace_interact_menu_fnc_createAction;
      [_type, 0, ["ACE_MainActions"],_destroyAction] call ace_interact_menu_fnc_addActionToClass;

      _destroyActionPortableRadio = ["usDestroyMenuPortable", (localize "str_GRAD_disable_vehicle"), "",
       {
       [60, [_this select 0], { BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";}, {hint "Cancelled action"}, (localize "str_GRAD_disabling_radio")] call ace_common_fnc_progressBar;
       },
        {(side player == west) && GRAD_TERMINAL}] call ace_interact_menu_fnc_createAction;
      ["Land_DataTerminal_01_F", 0, ["ACE_MainActions"],_destroyActionPortableRadio] call ace_interact_menu_fnc_addActionToClass;



      // TERMINAL ATTACH/DETACH

       _detachRadioAction = ["RusDetachMenu", (localize "str_GRAD_detach_radio"), "",
       {
       [4, [_this select 0], {
          ((_this select 0) select 0) setVariable ["detachableRadio", 2, true];

            _terminal = missionNamespace getVariable ["GRAD_tracking_terminalObj", objNull];
            _radioVeh = missionNamespace getVariable ["GRAD_tracking_radioVehObj", objNull];

            detach _terminal;
            _terminal setPos [getPos _terminal select 0, getPos _terminal select 1, 0];
            GRAD_TERMINAL = true; publicVariable "GRAD_TERMINAL";

            [[_terminal, true, [0,1.4,0], 270], "ace_dragging_fnc_setdraggable", true, true] call BIS_fnc_MP;
       }, {hint "Cancelled action"}, (localize "str_GRAD_detaching_radio")] call ace_common_fnc_progressBar;
       },
        {(side player == east) && ((_this select 0) getVariable ["detachableRadio", 0] == 1)}] call ace_interact_menu_fnc_createAction;
      [_type, 0, ["ACE_MainActions"],_detachRadioAction] call ace_interact_menu_fnc_addActionToClass;



      // transmission progress check
      _transmissionProgressAction = ["TransmissionProgress", "Check Transmission Progress", "",
       {[side player] remoteExec ["GRAD_tracking_fnc_showTicksInstant", 0, false];},
        {(side player == east)}] call ace_interact_menu_fnc_createAction;

      [_type, 0, ["ACE_MainActions"],_transmissionProgressAction] call ace_interact_menu_fnc_addActionToClass;


       _attachRadioAction = ["RusAttachMenu", (localize "str_GRAD_attach_radio"), "",
       {
       [4, [_this select 0], {
          ((_this select 0) select 0) setVariable ["detachableRadio", 1, true];

          _terminal = missionNamespace getVariable ["GRAD_tracking_terminalObj", objNull];
          _radioVeh = missionNamespace getVariable ["GRAD_tracking_radioVehObj", objNull];

          [[(_terminal), false, [0,1,0], 180], "ace_dragging_fnc_setdraggable", true, true] call BIS_fnc_MP;
          GRAD_TERMINAL = false; publicVariable "GRAD_TERMINAL";

          private _offset = _radioVeh getVariable ["BC_terminalOffset", [0,-2,0]];
          private _vectorDirAndUp = _radioVeh getVariable ["BC_terminalVectorDirAndUp", [0,0,0]];
          (_terminal) attachTo [_radioVeh ,_offset];
          (_terminal) setVectorDirAndUp _vectorDirAndUp;

       }, {hint "Cancelled action"}, (localize "str_GRAD_attaching_radio")] call ace_common_fnc_progressBar;
       },
        {

          (side player == east) && ((_this select 0) getVariable ["detachableRadio", 0] == 2) &&
          (missionNamespace getVariable ["GRAD_tracking_terminalObj", objNull]) distance (_this select 0) < 8

        }] call ace_interact_menu_fnc_createAction;
      [_type, 0, ["ACE_MainActions"],_attachRadioAction] call ace_interact_menu_fnc_addActionToClass;

}] call CBA_fnc_addEventHandler;
