_boat = "B_Boat_Transport_01_F" createVehicle [0,0,0];
_count = ((_this select 0) getVariable ["detachableBoat", 0]);
((_this select 0) setVariable ["detachableBoat", _count - 1]);
_boat allowDamage false;

0 = [_boat] execVM "player\carry\pickupBoat.sqf";