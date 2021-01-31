// FLAGS
if (!hasInterface) exitWith {};

// diag_log "added CBA eh";

["startVehicle", {

      params ["_startVehicle", "_side"];

      if (_side == west) exitWith {};

      // fnc is executed twice so we need to exit once to be super safe
      if (missionNamespace getVariable ["BC_interactionsAdded", false]) exitWith {};
      missionNamespace setVariable ["BC_interactionsAdded", true];


      private _type = typeOf _startVehicle;
     
      
      if (_side == east) then {
              {
               private _flagActionRaise = ["ACE_MainActions", (localize "str_GRAD_flag_raise"), "",
               {[(_this select 0), true] call BC_flagsOnVehicles_fnc_toggleFlag;},
                {(side player == east) && isNull ((_this select 0) getVariable ["GRAD_flagObject",objNull])}] call ace_interact_menu_fnc_createAction;

              [_x, 0, ["ACE_MainActions"], _flagActionRaise] call ace_interact_menu_fnc_addActionToClass;

              } forEach ["rhs_gaz66_r142_vv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_nat_uaz_dshkm","rhs_gaz66_repair_vdv","gaz_funk","rhs_bmp1_msv","rhs_btr70_msv"];

              {
               private _flagActionRemove = ["ACE_MainActions", (localize "str_GRAD_flag_remove"), "",
               {[(_this select 0), false] call BC_flagsOnVehicles_fnc_toggleFlag;},
                {(side player == east) && !isNull ((_this select 0) getVariable ["GRAD_flagObject",objNull])}] call ace_interact_menu_fnc_createAction;

              [_x, 0, ["ACE_MainActions"], _flagActionRemove] call ace_interact_menu_fnc_addActionToClass;

              } forEach ["rhs_gaz66_r142_vv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_nat_uaz_dshkm","rhs_gaz66_repair_vdv","gaz_funk","rhs_bmp1_msv","rhs_btr70_msv"];
            
            


            // RADIO TRUCK DEPLOY
            // rhs gaz has native deploy actions
            if (_type != "rhs_gaz66_r142_vv" && 
                _type != "gm_gc_army_btr60pu12_ols" &&
                _type != "gm_gc_army_btr60pu12_oli"
                ) then {
                  private _deployAction = [
                      "RusRadioDeploy",
                      (localize "str_GRAD_radio_deploy"),
                      "",
                      {
                          params ["_radiotruck"];

                          if (!MISSION_STARTED) exitWith {
                              hint "Please wait until Preparation Time is over.";
                          };

                          [_radiotruck] remoteExec ["GRAD_tracking_fnc_radioTruckDeploy", 2];
                      },
                      {
                          params ["_radiotruck"];
                          _isRetracted = ! (_radiotruck getVariable ["GRAD_isDeployed", false]);
                          _isStationary = (speed _radiotruck) == 0;
                          _isNotAnimated = ! (_radiotruck getVariable ["GRAD_isAnimating", false]);

                          (side player == east) && _isStationary && _isRetracted && _isNotAnimated
                      }
                  ] call ace_interact_menu_fnc_createAction;
                  [_type, 0, ["ACE_MainActions"], _deployAction] call ace_interact_menu_fnc_addActionToClass;

                  private _retractAction = [
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

                          (side player == east) && _isStationary && _isDeployed && _isNotAnimated
                      }
                  ] call ace_interact_menu_fnc_createAction;
                  [_type, 0, ["ACE_MainActions"], _retractAction] call ace_interact_menu_fnc_addActionToClass;

            };


            // hacky GM SUPPORT for antenna retracting
            if (_type == "gm_gc_army_btr60pu12_ols" ||
                _type == "gm_gc_army_btr60pu12_oli") then {

                _startVehicle addAction[
                    "<t color='#339933'>Deploy Antenna</t>", 
                    {
                        params ["_target", "_caller", "_actionId", "_arguments"];

                        _target animateSource ["antennaMast_1_1_source", 1];
                        private _cache = fuel _target;
                        _target setVariable ["BC_currentFuelCache", _cache, true];
                        _target setFuel 0;

                        [{
                            params ["_target"];
                            (_target animationSourcePhase "antennaMast_1_1_source" == 1)
                        }, {
                            params ["_target"];
                            _target setVariable ["tf_range", 50000, true];
                            _target setVariable ["grad_replay_color", {GRAD_FUNKWAGEN_RED}, true];
                        }, [_target]] call CBA_fnc_waitUntilAndExecute;
                    },
                    [],
                    1.5, 
                    true, 
                    true, 
                    "",
                    "_this == (driver _target) && _target animationSourcePhase 'antennaMast_1_1_source' == 0", // _target, _this, _originalTarget
                    50,
                    false,
                    "",
                    ""
                ];

                _startVehicle addAction[
                    "<t color='#993333'>Retract Antenna</t>", 
                    {
                        params ["_target", "_caller", "_actionId", "_arguments"];

                        _target animateSource ["antennaMast_1_1_source", 0];
                        _target setVariable ["tf_range", 0, true];
                        _target setVariable ["grad_replay_color", nil, true];

                        [{
                            params ["_target"];
                            (_target animationSourcePhase "antennaMast_1_1_source" == 0)
                        }, {
                            params ["_target"];
                            private _cache = _target getVariable ["BC_currentFuelCache", 0];
                            _target setFuel _cache;
                        }, [_target]] call CBA_fnc_waitUntilAndExecute;
                    },
                    [],
                    1.5, 
                    true, 
                    true, 
                    "",
                    "_this == (driver _target) && _target animationSourcePhase 'antennaMast_1_1_source' == 1", // _target, _this, _originalTarget
                    50,
                    false,
                    "",
                    ""
                ];

            };



            // RADIO TRUCK/BOX DESTROY

              private _destroyAction = ["usDestroyMenu", (localize "str_GRAD_disable_vehicle"), "",
               {
               [60, [_this select 0], { BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";}, {hint "Cancelled action"}, (localize "str_GRAD_disabling_radio")] call ace_common_fnc_progressBar;
               },
                {(side player == west) && !GRAD_TERMINAL}] call ace_interact_menu_fnc_createAction;
              [_type, 0, ["ACE_MainActions"],_destroyAction] call ace_interact_menu_fnc_addActionToClass;

              private _destroyActionPortableRadio = ["usDestroyMenuPortable", (localize "str_GRAD_disable_vehicle"), "",
               {
               [60, [_this select 0], { BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";}, {hint "Cancelled action"}, (localize "str_GRAD_disabling_radio")] call ace_common_fnc_progressBar;
               },
                {(side player == west) && GRAD_TERMINAL}] call ace_interact_menu_fnc_createAction;
              ["Land_DataTerminal_01_F", 0, ["ACE_MainActions"],_destroyActionPortableRadio] call ace_interact_menu_fnc_addActionToClass;

              
              private _destroyActionAntenna = ["usDestroyMenuPortable", (localize "str_GRAD_disable_vehicle"), "",
               {
               [60, [_this select 0], { GRAD_ANTENNA_DISABLED = TRUE; publicVariable "GRAD_ANTENNA_DISABLED";}, {hint "Cancelled action"}, (localize "str_GRAD_disabling_radio")] call ace_common_fnc_progressBar;
               },
                {(side player == west) && GRAD_ANTENNA}] call ace_interact_menu_fnc_createAction;
              ["Item_muzzle_antenna_02_f", 0, ["ACE_MainActions"],_destroyActionAntenna] call ace_interact_menu_fnc_addActionToClass;

            // TERMINAL ATTACH/DETACH

             private _detachRadioAction = ["RusDetachMenu", (localize "str_GRAD_detach_radio"), "",
             {
             [4, [_this select 0], {
                ((_this select 0) select 0) setVariable ["detachableRadio", 2, true];
                  private _radioVeh = missionNamespace getVariable ["GRAD_tracking_radioVehObj", objNull];
                  [] remoteExec ["GRAD_tracking_fnc_terminalDetach", _radioVeh];
                  
             }, {hint "Cancelled action"}, (localize "str_GRAD_detaching_radio")] call ace_common_fnc_progressBar;
             },
              {(side player == east) && ((_this select 0) getVariable ["detachableRadio", 0] == 1)}] call ace_interact_menu_fnc_createAction;
            [_type, 0, ["ACE_MainActions"],_detachRadioAction] call ace_interact_menu_fnc_addActionToClass;


            // TERMINAL TRANSMISSION
            private _openAction = ["terminalActionOpen", "Start transmission", "",
            {
              [_target] spawn GRAD_tracking_fnc_terminalOpen;
            },
            {_target getVariable ['TerminalStatus',-1] == 0}] call ace_interact_menu_fnc_createAction;

            ["Land_DataTerminal_01_F", 0, ["ACE_MainActions"],_openAction] call ace_interact_menu_fnc_addActionToClass;


            private _closeAction = ["terminalActionClose", "End transmission", "",
            {
              [_target] spawn GRAD_tracking_fnc_terminalClose;
            },
            {_target getVariable ['TerminalStatus',-1] == 2}] call ace_interact_menu_fnc_createAction;

            ["Land_DataTerminal_01_F", 0, ["ACE_MainActions"],_closeAction] call ace_interact_menu_fnc_addActionToClass;



            // ANTENNA ACTIONS
            private _antennaStartAction = ["terminalActionOpen", "Start transmission", "",
            {
              private _antenna = missionNamespace getVariable ["GRAD_tracking_antennaObj", objNull];
              [_antenna] spawn GRAD_tracking_fnc_antennaStart;
            },
            {_target getVariable ["BC_hasAntenna", false] && { private _antenna = missionNamespace getVariable ["GRAD_tracking_antennaObj", objNull]; (_antenna getVariable ["antennaStatus", 0] == 1) }}] call ace_interact_menu_fnc_createAction;

            [player, 1, ["ACE_SelfActions"],_antennaStartAction] call ace_interact_menu_fnc_addActionToObject;


            private _antennaStopAction = ["terminalActionClose", "End transmission", "",
            { 
              private _antenna = missionNamespace getVariable ["GRAD_tracking_antennaObj", objNull];
              [_antenna] spawn GRAD_tracking_fnc_antennaStop;
            },
            {_target getVariable ["BC_hasAntenna", false] && { private _antenna = missionNamespace getVariable ["GRAD_tracking_antennaObj", objNull]; (_antenna getVariable ["antennaStatus", 0] == 2) }}] call ace_interact_menu_fnc_createAction;

            [player, 1, ["ACE_SelfActions"],_antennaStopAction] call ace_interact_menu_fnc_addActionToObject;



            // transmission progress check
            private _transmissionProgressAction = ["TransmissionProgress", "Check Transmission Progress", "",
             {[side player] remoteExec ["GRAD_tracking_fnc_showTicksInstant", 0, false];},
              {(side player == east)}] call ace_interact_menu_fnc_createAction;

            [_type, 0, ["ACE_MainActions"],_transmissionProgressAction] call ace_interact_menu_fnc_addActionToClass;


             private _attachRadioAction = ["RusAttachMenu", (localize "str_GRAD_attach_radio"), "",
             {
             [4, [_this select 0], {
                ((_this select 0) select 0) setVariable ["detachableRadio", 1, true];

                _terminal = missionNamespace getVariable ["GRAD_tracking_terminalObj", objNull];
                _radioVeh = missionNamespace getVariable ["GRAD_tracking_radioVehObj", objNull];

                GRAD_TERMINAL = false; publicVariable "GRAD_TERMINAL";

                [_terminal, _radioVeh] call GRAD_tracking_fnc_terminalAttachToVeh;

             }, {hint "Cancelled action"}, (localize "str_GRAD_attaching_radio")] call ace_common_fnc_progressBar;
             },
              {

                (side player == east) && ((_this select 0) getVariable ["detachableRadio", 0] == 2) &&
                (missionNamespace getVariable ["GRAD_tracking_terminalObj", objNull]) distance (_this select 0) < 8

              }] call ace_interact_menu_fnc_createAction;
            [_type, 0, ["ACE_MainActions"],_attachRadioAction] call ace_interact_menu_fnc_addActionToClass;

      };

}] call CBA_fnc_addEventHandler;
