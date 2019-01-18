params ["_object"];

// boat carrying
private _carryAssaultBoat = ["CarryBoatAction", "Carry Boat", "",
  {[_target] spawn GRAD_carryBoat_fnc_pickupBoat;},
  {(count (crew _target) == 0)}] call ace_interact_menu_fnc_createAction;

["B_Boat_Transport_01_F", 0, ["ACE_MainActions"],_carryAssaultBoat] call ace_interact_menu_fnc_addActionToClass;

// boat picking from container
private _createAssaultBoat = ["CreateBoatAction", "Take Boat", "",
  {[_target] call GRAD_carryBoat_fnc_createBoat;},
  {(_target getVariable ["grad_carryBoatCargo", 0] > 0)}
] call ace_interact_menu_fnc_createAction;

[typeOf _object, 0, ["ACE_MainActions"],_createAssaultBoat] call ace_interact_menu_fnc_addActionToClass;
