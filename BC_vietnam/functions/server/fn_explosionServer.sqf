params ["_vehicle"];

private _position = position _vehicle;

private _explosion = createVehicle ["vn_shell_155mm_base_he_ammo", _position, [], 0, "CAN_COLLIDE"];
_explosion setDamage 1;
_explosion setVelocity [0,0,-100];

private _explosion2 = createVehicle ["vn_bomb_2000_mk84_he_ammo", _position, [], 0, "CAN_COLLIDE"];
_explosion2 setDamage 1;
_explosion2 setVelocity [0,0,-100];