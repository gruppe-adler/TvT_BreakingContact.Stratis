params ["_parentObj"];

private _boat = "B_Boat_Transport_01_F" createVehicle [0,0,0];
private _count = (_parentObj getVariable ["detachableBoat", 1]);
(_parentObj setVariable ["detachableBoat", _count - 1]);
_boat allowDamage false;

hint "bla";

[_boat] execVM "player\carry\pickupBoat.sqf";