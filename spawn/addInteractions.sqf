// FLAGS

{
 _flagActionRaise = ["ACE_MainActions", (localize "str_GRAD_flag_raise"), "",
 {0 = [(_this select 0), true] execVM "spawn\flagsOnVehicles.sqf";},
  {(side player == east) && isNull ((_this select 0) getVariable ["GRAD_flagObject",objNull])}] call ace_interact_menu_fnc_createAction;

[_x, 0, ["ACE_MainActions"], _flagActionRaise] call ace_interact_menu_fnc_addActionToClass;

} forEach ["rhs_gaz66_r142_vv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_nat_uaz_dshkm","rhs_gaz66_repair_vdv","gaz_funk","rhs_bmp1_msv","rhs_btr70_msv"];

{
 _flagActionRemove = ["ACE_MainActions", (localize "str_GRAD_flag_remove"), "",
 {0 = [(_this select 0), false] execVM "spawn\flagsOnVehicles.sqf";},
  {(side player == east) && !isNull ((_this select 0) getVariable ["GRAD_flagObject",objNull])}] call ace_interact_menu_fnc_createAction;

[_x, 0, ["ACE_MainActions"], _flagActionRemove] call ace_interact_menu_fnc_addActionToClass;

} forEach ["rhs_gaz66_r142_vv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_nat_uaz_dshkm","rhs_gaz66_repair_vdv","gaz_funk","rhs_bmp1_msv","rhs_btr70_msv"];




// REMOVE SPAWN

_removeSpawn = ["ACE_MainActions", (localize "str_GRAD_buy_disable"), "",
 {
    [_this select 0] execVM "spawn\disableSpawn.sqf";
  },
  {true}] call ace_interact_menu_fnc_createAction;

["RoadCone_L_F", 0, ["ACE_MainActions"], _removeSpawn] call ace_interact_menu_fnc_addActionToClass;



// BUY

_usAction = ["ACE_MainActions", (localize "str_GRAD_buy_vehicles"), "",
 {0 = execVM "grad_buymenu\openMenu.sqf";},
  {(side player == west)}] call ace_interact_menu_fnc_createAction;

["rhsusf_m998_w_4dr", 0, ["ACE_MainActions"], _usAction] call ace_interact_menu_fnc_addActionToClass;
["rhsusf_m998_d_4dr", 0, ["ACE_MainActions"], _usAction] call ace_interact_menu_fnc_addActionToClass;
["LOP_AM_Landrover_M2", 0, ["ACE_MainActions"],_usAction] call ace_interact_menu_fnc_addActionToClass;

_rusAction = ["RusBuyMenu", (localize "str_GRAD_buy_vehicles"), "",
{0 = execVM "grad_buymenu\openMenu.sqf";},
  {(side player == east)}] call ace_interact_menu_fnc_createAction;
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_rusAction] call ace_interact_menu_fnc_addActionToClass;
["rhsgref_BRDM2_HQ_msv", 0, ["ACE_MainActions"],_rusAction] call ace_interact_menu_fnc_addActionToClass;




// SOVIET MODE SELF RADIO

_selfRadioStart = ["ACE_SelfActions", "Start calling US agents", "",
 {player setVariable ["tf_range", 50000, true];},
  {(player getVariable ["GRAD_isVIP",false]) && (player getVariable ["tf_range",0] == 0)}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _selfRadioStart] call ace_interact_menu_fnc_addActionToClass;

_selfRadioStop = ["ACE_SelfActions", "Stop calling US agents", "",
 {player setVariable ["tf_range", 0, true];},
  {(player getVariable ["GRAD_isVIP",false]) && (player getVariable ["tf_range",0] > 0)}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _selfRadioStop] call ace_interact_menu_fnc_addActionToClass;




// RADIO TRUCK DEPLOY

/*
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
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"], _deployAction] call ace_interact_menu_fnc_addActionToClass;

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
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"], _retractAction] call ace_interact_menu_fnc_addActionToClass;
*/


// RADIO TRUCK/BOX DESTROY

_destroyAction = ["usDestroyMenu", (localize "str_GRAD_disable_vehicle"), "",
 {
 [60, [_this select 0], { BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";}, {hint "Cancelled action"}, (localize "str_GRAD_disabling_radio")] call ace_common_fnc_progressBar;
 },
  {(side player == west) && !GRAD_TERMINAL}] call ace_interact_menu_fnc_createAction;
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_destroyAction] call ace_interact_menu_fnc_addActionToClass;

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
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_detachRadioAction] call ace_interact_menu_fnc_addActionToClass;



// transmission progress check
_transmissionProgressAction = ["TransmissionProgress", "Check Transmission Progress", "",
 {[side player] remoteExec ["GRAD_tracking_fnc_showTicksInstant", 0, false];},
  {(side player == east)}] call ace_interact_menu_fnc_createAction;

["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_transmissionProgressAction] call ace_interact_menu_fnc_addActionToClass;

_selfRadioProgressCheck = ["TransmissionProgress", "Check Transmission Progress", "",
 {[side player] remoteExec ["GRAD_tracking_fnc_showTicksInstant", 0, false];},
  {player getVariable ["GRAD_isVIP",false]}] call ace_interact_menu_fnc_createAction;

[typeOf player, 1, ["ACE_SelfActions"], _selfRadioProgressCheck] call ace_interact_menu_fnc_addActionToClass;



// boat carrying
_carryAssaultBoat = ["CarryBoatAction", "Carry Boat", "",
  {0 = [_target] spawn GRAD_carryBoat_fnc_pickupBoat;},
  {(count (crew _target) == 0)}] call ace_interact_menu_fnc_createAction;

["B_Boat_Transport_01_F", 0, ["ACE_MainActions"],_carryAssaultBoat] call ace_interact_menu_fnc_addActionToClass;

// boat picking from container
_createAssaultBoat = ["CreateBoatAction", "Take Boat", "",
  {0 = [_target] call GRAD_carryBoat_fnc_createBoat;},
  {(_target getVariable ["grad_carryBoatCargo", 0] > 0)}
] call ace_interact_menu_fnc_createAction;

["rhsusf_mrzr4_d_mud", 0, ["ACE_MainActions"],_createAssaultBoat] call ace_interact_menu_fnc_addActionToClass;
["rhsusf_mrzr4_w_mud", 0, ["ACE_MainActions"],_createAssaultBoat] call ace_interact_menu_fnc_addActionToClass;



 _attachRadioAction = ["RusAttachMenu", (localize "str_GRAD_attach_radio"), "",
 {
 [4, [_this select 0], {
    ((_this select 0) select 0) setVariable ["detachableRadio", 1, true];

    _terminal = missionNamespace getVariable ["GRAD_tracking_terminalObj", objNull];
    _radioVeh = missionNamespace getVariable ["GRAD_tracking_radioVehObj", objNull];

    [[(_terminal), false, [0,1,0], 180], "ace_dragging_fnc_setdraggable", true, true] call BIS_fnc_MP;
    GRAD_TERMINAL = false; publicVariable "GRAD_TERMINAL";
    (_terminal) attachTo [_radioVeh ,[0.3,-2.85,0.7]];
    (_terminal) setVectorDirAndUp [[0,1,0.3],[0,0,0.7]];

 }, {hint "Cancelled action"}, (localize "str_GRAD_attaching_radio")] call ace_common_fnc_progressBar;
 },
  {

    (side player == east) && ((_this select 0) getVariable ["detachableRadio", 0] == 2) &&
    (missionNamespace getVariable ["GRAD_tracking_terminalObj", objNull]) distance (_this select 0) < 8

  }] call ace_interact_menu_fnc_createAction;
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_attachRadioAction] call ace_interact_menu_fnc_addActionToClass;
