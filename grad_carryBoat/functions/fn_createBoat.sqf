params ["_parentObj"];

private _boat = "B_Boat_Transport_01_F" createVehicle [0,0,0];

clearBackpackCargoGlobal _boat;
clearItemCargoGlobal _boat;
clearMagazineCargoGlobal _boat;
clearWeaponCargoGlobal _boat;

_boat addItemCargoGlobal ["ItemGPS",1];
_boat addItemCargoGlobal ["U_B_Wetsuit",4];
_boat addItemCargoGlobal ["V_RebreatherB",4];
_boat addItemCargoGlobal ["G_B_Diving",4];

private _count = (_parentObj getVariable ["grad_carryBoatCargo", 1]);
(_parentObj setVariable ["grad_carryBoatCargo", _count - 1]);
_boat allowDamage false;

player setVariable ["GRAD_carryBoat_boatObj", _boat];

[_boat] spawn GRAD_carryBoat_fnc_pickupBoat;

{
    [_boat, _x] remoteExecCall ["disableCollisionWith", 0, _boat];
    [_boat, _x] remoteExecCall ["disableCollisionWith", 0, _x];
} forEach allUnits;