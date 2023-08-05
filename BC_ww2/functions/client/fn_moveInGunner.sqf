params ["_gunner", "_plane"];

moveOut _gunner;

[{
	params ["_gunner", "_plane"];

	_gunner assignAsGunner _plane;
	_gunner moveInGunner _plane;

	[{
		params ["_gunner"];

		[_gunner, false] call ace_medical_fnc_setUnconscious;
		_gunner allowDamage true;
	}, _this, 1] call CBA_fnc_waitAndExecute;
}, _this] call CBA_fnc_execNextFrame;