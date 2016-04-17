_boat = "B_Boat_Transport_01_F" createVehicle [position player select 0,position player select 1,100];
_count = ((_this select 0) getVariable ["detachableBoat", 0]);
((_this select 0) setVariable ["detachableBoat", _count - 1]);

0 = [_boat] execVM "player\carry\pickupBoat.sqf";

