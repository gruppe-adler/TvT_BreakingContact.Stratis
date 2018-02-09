params ["_parentObj"];

private _boat = "B_Boat_Transport_01_F" createVehicle [0,0,0];
private _count = (_parentObj getVariable ["grad_carryBoatCargo", 1]);
(_parentObj setVariable ["grad_carryBoatCargo", _count - 1]);
_boat allowDamage false;

player setVariable ["GRAD_carryBoat_boatObj", _boat];

[_boat] spawn GRAD_carryBoat_fnc_pickupBoat;
