params ["_object", "_type"];

// boat carrying
private _carryAssaultBoat = ["CarryBoatAction", "Carry Boat", "",
  {[_target] spawn GRAD_carryBoat_fnc_pickupBoat;},
  {(count (crew _target) == 0)}] call ace_interact_menu_fnc_createAction;

[_type, 0, ["ACE_MainActions"],_carryAssaultBoat] call ace_interact_menu_fnc_addActionToClass;

// boat picking from container
private _createAssaultBoat = ["CreateBoatAction", "Take Boat", "", 
{
    _args = _this select 2;
    _args params ["_object","_type"];
    [_object, _type] call GRAD_carryBoat_fnc_createBoat
},
  {(_target getVariable ["grad_carryBoatCargo", 0] > 0)},{},[_object, _type]
] call ace_interact_menu_fnc_createAction;

[typeOf _object, 0, ["ACE_MainActions"],_createAssaultBoat] call ace_interact_menu_fnc_addActionToClass;
