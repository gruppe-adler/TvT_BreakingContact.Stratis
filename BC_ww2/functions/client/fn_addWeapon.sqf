params ["_vehicle", "_args"];

{
	_x params ["_weapon", "_munitions", "_turretPath"];

	_vehicle addWeaponTurret [_weapon, _turretPath];

	{
		_vehicle addMagazineTurret [_x, _turretPath];
	} forEach _munitions;
} ForEach _args;
