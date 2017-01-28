// buy actions
_usAction1 = ["ACE_MainActions", (localize "str_GRAD_buy_vehicles"), "",
 {0 = execVM "grad_buymenu\openMenu.sqf";},
  {side player == west}] call ace_interact_menu_fnc_createAction;

["rhsusf_m998_w_4dr", 0, ["ACE_MainActions"], _usAction1] call ace_interact_menu_fnc_addActionToClass;

_usAction2 = ["ACE_MainActions", (localize "str_GRAD_buy_vehicles"), "",
 {0 = execVM "grad_buymenu\openMenu.sqf";},
  {side player == west}] call ace_interact_menu_fnc_createAction;

["rhsusf_m998_d_4dr", 0, ["ACE_MainActions"], _usAction2] call ace_interact_menu_fnc_addActionToClass;



_rusAction = ["RusBuyMenu", (localize "str_GRAD_buy_vehicles"), "",
{0 = execVM "grad_buymenu\openMenu.sqf";},
  {side player == east}] call ace_interact_menu_fnc_createAction;
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_rusAction] call ace_interact_menu_fnc_addActionToClass;


_deployAction = [
    "RusRadioDeploy",
    (localize "str_GRAD_radio_deploy"),
    "",
    {
        params ["_radiotruck"];
        [_radiotruck] remoteExec ["fnc_radiotruck_deploy", 2];
    },
    {
        params ["_radiotruck"];
        _isRetracted = ! (_radiotruck getVariable ["GRAD_isDeployed", false]);
        _isStationary = (speed _radiotruck) == 0;
        _isNotAnimated = ! (_radiotruck getVariable ["GRAD_isAnimating", false]);

        side player == east && _isStationary && _isRetracted && _isNotAnimated;
    }
] call ace_interact_menu_fnc_createAction;
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"], _deployAction] call ace_interact_menu_fnc_addActionToClass;

_retractAction = [
    "RusRadioRetract",
    (localize "str_GRAD_radio_retract"),
    "",
    {
        params ["_radiotruck"];
        [_radiotruck] remoteExec ["fnc_radiotruck_retract", 2];
    },
    {
        params ["_radiotruck"];
        _isDeployed = _radiotruck getVariable ["GRAD_isDeployed", false];
        _isStationary = (speed _radiotruck) == 0;
        _isNotAnimated = ! (_radiotruck getVariable ["GRAD_isAnimating", false]);

        side player == east && _isStationary && _isDeployed && _isNotAnimated;
    }
] call ace_interact_menu_fnc_createAction;
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"], _retractAction] call ace_interact_menu_fnc_addActionToClass;


_destroyAction = ["usDestroyMenu", (localize "str_GRAD_destroy_vehicle"), "",
 {
 [60, [_this select 0], {((_this select 0) select 0) setdamage 1;}, {hint "Cancelled action"}, (localize "str_GRAD_destroying_radio")] call ace_common_fnc_progressBar;
 },
  {side player == west}] call ace_interact_menu_fnc_createAction;
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_destroyAction] call ace_interact_menu_fnc_addActionToClass;

_destroyActionPortableRadio = ["usDestroyMenuPortable", (localize "str_GRAD_destroy_vehicle"), "",
 {
 [60, [_this select 0], {((_this select 0) select 0) setdamage 1; BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";}, {hint "Cancelled action"}, (localize "str_GRAD_destroying_radio")] call ace_common_fnc_progressBar;
 },
  {side player == west}] call ace_interact_menu_fnc_createAction;
["Land_DataTerminal_01_F", 0, ["ACE_MainActions"],_destroyActionPortableRadio] call ace_interact_menu_fnc_addActionToClass;


 _detachRadioAction = ["RusDetachMenu", (localize "str_GRAD_detach_radio"), "",
 {
 [4, [_this select 0], {
    ((_this select 0) select 0) setVariable ["detachableRadio", 2, true];


      detach portableRadioBox;
      portableRadioBox setPos [getPos portableRadioBox select 0, getPos portableRadioBox select 1, 0];
      RADIO_BOX = true; publicVariable "RADIO_BOX";

      [[portableRadioBox, true, [0,1.4,0], 270], "ace_dragging_fnc_setdraggable", true, true] call BIS_fnc_MP;
 }, {hint "Cancelled action"}, (localize "str_GRAD_detaching_radio")] call ace_common_fnc_progressBar;
 },
  {side player == east && ((_this select 0) getVariable ["detachableRadio", 0] == 1)}] call ace_interact_menu_fnc_createAction;
["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_detachRadioAction] call ace_interact_menu_fnc_addActionToClass;



// transmission progress check
_transmissionProgressAction = ["TransmissionProgress", "Check Transmission Progress", "",
 {[{[] call showPointsInstant;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;},
  {side player == east}] call ace_interact_menu_fnc_createAction;

["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_transmissionProgressAction] call ace_interact_menu_fnc_addActionToClass;



// boat carrying
_carryAssaultBoat = ["CarryBoatAction", "Carry Boat", "",
  {0 = [_this select 0] execVM 'player\carry\pickupBoat.sqf';},
  {((count (crew (_this select 0))) == 0)}] call ace_interact_menu_fnc_createAction;

["B_Boat_Transport_01_F", 0, ["ACE_MainActions"],_carryAssaultBoat] call ace_interact_menu_fnc_addActionToClass;



// GRAD fortification for OPFOR

GRAD_fortification_isAvailable = {
    params ["_item", "_container"];

    _return = false;
    _requestString = "GRAD_fortifications_available_" + _item;
    _countAvailable = _container getVariable [_requestString,0];
    if (_countAvailable > 0) then {
        _return = true;
    };
    _return
};

GRAD_fortifications_giveFeedback = {
    params ["_item", "_container"];
     _requestString = "GRAD_fortifications_available_" + _item;
    _countAvailable = _container getVariable [_requestString,0];
     if (_countAvailable > 0) then {
        _container setVariable [_requestString,_countAvailable - 1];
    };
    hintsilent format ["Noch %1 verfügbar", _countAvailable];
};

// bagfence long
_Land_BagFence_Long_F = ["Fortifications", "Sandsackwall Lang", "",
  {[player, "Land_BagFence_Long_F", 1] call grad_fortifications_fnc_addFort;
  ["Land_BagFence_Long_F", (_this select 0)] call GRAD_fortifications_giveFeedback;},
  {
    (side player == east) && 
    ([player, "Land_BagFence_Long_F", 1, true] call grad_fortifications_fnc_canTake) &&
    (["Land_BagFence_Long_F", (_this select 0)] call GRAD_fortification_isAvailable)
  }] call ace_interact_menu_fnc_createAction;

_Land_BagFence_End_F = ["Fortifications", "Sandsackwall Kurz", "",
  {[player, "Land_BagFence_End_F", 1] call grad_fortifications_fnc_addFort;
  ["Land_BagFence_End_F", (_this select 0)] call GRAD_fortifications_giveFeedback;},
  {
    (side player == east) && 
    ([player, "Land_BagFence_End_F", 1, true] call grad_fortifications_fnc_canTake) &&
    (["Land_BagFence_End_F", (_this select 0)] call GRAD_fortification_isAvailable)
  }] call ace_interact_menu_fnc_createAction;

_rhs_Flag_DNR_F = ["Fortifications", "Flagge der DNR", "",
  {[player, "rhs_Flag_DNR_F", 1] call grad_fortifications_fnc_addFort;
  ["rhs_Flag_DNR_F", (_this select 0)] call GRAD_fortifications_giveFeedback;},
  {
    (side player == east) && 
    ([player, "rhs_Flag_DNR_F", 1, true] call grad_fortifications_fnc_canTake) &&
    (["rhs_Flag_DNR_F", (_this select 0)] call GRAD_fortification_isAvailable)
  }] call ace_interact_menu_fnc_createAction;

["rhs_gaz66_repair_vdv", 0, ["ACE_MainActions"],_Land_BagFence_Long_F] call ace_interact_menu_fnc_addActionToClass;
["rhs_gaz66_repair_vdv", 0, ["ACE_MainActions"],_Land_BagFence_End_F] call ace_interact_menu_fnc_addActionToClass;
["rhs_gaz66_repair_vdv", 0, ["ACE_MainActions"],_rhs_Flag_DNR_F] call ace_interact_menu_fnc_addActionToClass;


[] spawn {
waitUntil {!isNil "portableRadioBox"};

   _attachRadioAction = ["RusAttachMenu", (localize "str_GRAD_attach_radio"), "",
   {
   [4, [_this select 0], {
      ((_this select 0) select 0) setVariable ["detachableRadio", 1, true];

      [[portableRadioBox, false, [0,1,0], 180], "ace_dragging_fnc_setdraggable", true, true] call BIS_fnc_MP;
      RADIO_BOX = false; publicVariable "RADIO_BOX";
      portableRadioBox attachTo [funkwagen,[0.3,-2.85,0.7]];
      portableRadioBox setVectorDirAndUp [[0,1,0.3],[0,0,0.7]];

   }, {hint "Cancelled action"}, (localize "str_GRAD_attaching_radio")] call ace_common_fnc_progressBar;
   },
    {side player == east && ((_this select 0) getVariable ["detachableRadio", 0] == 2) && portableRadioBox distance (_this select 0) < 8}] call ace_interact_menu_fnc_createAction;
  ["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_attachRadioAction] call ace_interact_menu_fnc_addActionToClass;
};
