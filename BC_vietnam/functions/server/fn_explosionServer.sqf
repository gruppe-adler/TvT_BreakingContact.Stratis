params ["_vehicle"];

private _position = position _vehicle;

private _explosion = createVehicle ["ammo_ShipCannon_120mm_HE", _position, [], 0, "CAN_COLLIDE"];
_explosion setDamage 1;
_explosion setVelocity [0,0,-100];

private _explosion2 = createVehicle ["Bo_Mk82", _position, [], 0, "CAN_COLLIDE"];
_explosion2 setDamage 1;
_explosion2 setVelocity [0,0,-100];