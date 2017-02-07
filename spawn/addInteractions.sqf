// GET IN / OUT AA
GRAD_addGetInActionAA = {
  params ["_vehicle"];
  _vehicle addAction ["Get In AA", {
    [_this select 0, _this select 1] spawn {
    (_this select 1) switchMove "ACE_Climb";
      sleep 1.2;
    (_this select 1) moveInTurret [(_this select 0) getVariable ['attachedObject',objNull], [0]];
    };

  }, nil, 1, false, true, "", 
  "!isNull (_target getVariable ['attachedObject',objNull]) && 
  alive (_target getVariable ['attachedObject',objNull]) &&
  !(vehicle _this == _target) &&
  {count crew (_target getVariable ['attachedObject',objNull]) < 1}",
  5, false];
};

GRAD_addGetOutActionAA = {
  params ["_manpad"];
  _manpad addAction ["Get Out", {
    moveOut (_this select 1); 
    _dir = getDir (_this select 0);
    (_this select 1) setDir _dir - 180;
    (_this select 1) switchMove "AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutMedium";
    (_this select 1) setPos (((_this select 0) getVariable ['attachedToObject',objNull]) modelToWorld [0.5,-3.5,-1]);
  }, nil, 1, false, true, "vehicle _this == _target", 
  "",
  1, false];
};

// FLAGS

{ 
 _flagActionRaise = ["ACE_MainActions", (localize "str_GRAD_flag_raise"), "",
 {0 = [(_this select 0), true] execVM "spawn\flagsOnVehicles.sqf";},
  {side player == east && isNull ((_this select 0) getVariable ["GRAD_flagObject",objNull])}] call ace_interact_menu_fnc_createAction;

[_x, 0, ["ACE_MainActions"], _flagActionRaise] call ace_interact_menu_fnc_addActionToClass;

} forEach ["rhs_gaz66_r142_vv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","rhs_kamaz5350_flatbed_msv","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_nat_uaz_dshkm","rhs_gaz66_repair_vdv","gaz_funk","rhs_bmp1_msv","rhs_btr70_msv"];

{ 
 _flagActionRemove = ["ACE_MainActions", (localize "str_GRAD_flag_remove"), "",
 {0 = [(_this select 0), false] execVM "spawn\flagsOnVehicles.sqf";},
  {side player == east && !isNull ((_this select 0) getVariable ["GRAD_flagObject",objNull])}] call ace_interact_menu_fnc_createAction;

[_x, 0, ["ACE_MainActions"], _flagActionRemove] call ace_interact_menu_fnc_addActionToClass;

} forEach ["rhs_gaz66_r142_vv","rhs_tigr_m_vdv","rhs_tigr_m_3camo_vdv","rhs_kamaz5350_flatbed_msv","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_nat_uaz_dshkm","rhs_gaz66_repair_vdv","gaz_funk","rhs_bmp1_msv","rhs_btr70_msv"];  




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
  {side player == west}] call ace_interact_menu_fnc_createAction;

["rhsusf_m998_w_4dr", 0, ["ACE_MainActions"], _usAction] call ace_interact_menu_fnc_addActionToClass;
["rhsusf_m998_d_4dr", 0, ["ACE_MainActions"], _usAction] call ace_interact_menu_fnc_addActionToClass;
["LOP_AM_Landrover_M2", 0, ["ACE_MainActions"],_usAction] call ace_interact_menu_fnc_addActionToClass;

_rusAction = ["RusBuyMenu", (localize "str_GRAD_buy_vehicles"), "",
{0 = execVM "grad_buymenu\openMenu.sqf";},
  {side player == east}] call ace_interact_menu_fnc_createAction;
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



// RADIO TRUCK/BOX DESTROY

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



// TERMINAL ATTACH/DETACH

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
/*
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
        _container setVariable [_requestString,_countAvailable - 1, true];
        hintsilent format ["Noch %1 verfügbar", _countAvailable - 1];
    };
};


GRAD_fortification_addToClass = {
  params ["_target", "_item", "_description"];
    _action = 
    [
      "Fortifications", _description, "",
      {
        params ["_target", "_player", "_params"];
        [_player, _this select 2, 1] call grad_fortifications_fnc_addFort;
        [_this select 2, _target] call GRAD_fortifications_giveFeedback;

        diag_log format ["action taken: item %1 + target %2", _this select 2, _target];
      },
      {
        (side player == east) && 
        ([_player, _this select 2, 1, true] call grad_fortifications_fnc_canTake) &&
        ([_this select 2, _target] call GRAD_fortification_isAvailable)
      },
      {},
      _item
    ] call ace_interact_menu_fnc_createAction;

  [_target, 0, ["ACE_MainActions", "GRAD_Fortifications"],_action] call ace_interact_menu_fnc_addActionToClass;
};

_items = [
  ["Land_BagFence_Long_F", "Sandsackwall Lang"],
  ["Land_BagFence_End_F", "Sandsackwall Kurz"],
  ["rhs_Flag_DNR_F", "Flagge der DNR"],
  ["Land_Wreck_Ural_F", "Ural Barrikade"],
  ["Land_Wreck_UAZ_F", "UAZ Barrikade"],
  ["Land_Razorwire_F", "Stacheldraht"],
  ["MetalBarrel_burning_F", "Brennendes Fass"],
  ["Campfire_burning_F", "Lagerfeuer"],
  ["Land_PortableLight_single_F", "Baustrahler"]
];

_fortifications_node = ["GRAD_Fortifications", "Fortifications", "", {}, {true}] call ace_interact_menu_fnc_createAction;
["rhs_gaz66_repair_vdv", 0, ["ACE_MainActions"], _fortifications_node] call ace_interact_menu_fnc_addActionToClass;

{
  [
    "rhs_gaz66_repair_vdv",
    _x select 0,
    _x select 1
  ] call GRAD_fortification_addToClass;
} forEach _items;
*/

[] spawn {
waitUntil {!isNil "portableRadioBox"};

   _attachRadioAction = ["RusAttachMenu", (localize "str_GRAD_attach_radio"), "",
   {
   [4, [_this select 0], {
      ((_this select 0) select 0) setVariable ["detachableRadio", 1, true];

      [[portableRadioBox, false, [0,1,0], 180], "ace_dragging_fnc_setdraggable", true, true] call BIS_fnc_MP;
      RADIO_BOX = false; publicVariable "RADIO_BOX";
      portableRadioBox attachTo [radio_object,[0.3,-2.85,0.7]];
      portableRadioBox setVectorDirAndUp [[0,1,0.3],[0,0,0.7]];

   }, {hint "Cancelled action"}, (localize "str_GRAD_attaching_radio")] call ace_common_fnc_progressBar;
   },
    {side player == east && ((_this select 0) getVariable ["detachableRadio", 0] == 2) && portableRadioBox distance (_this select 0) < 8}] call ace_interact_menu_fnc_createAction;
  ["rhs_gaz66_r142_vv", 0, ["ACE_MainActions"],_attachRadioAction] call ace_interact_menu_fnc_addActionToClass;
};
