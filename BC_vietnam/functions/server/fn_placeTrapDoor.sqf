params ["_position"];


private _trapDoor = "Land_vn_o_trapdoor_02" createVehicle [0,0,0];

_trapDoor setDir random 360;
_trapDoor setPos _position;