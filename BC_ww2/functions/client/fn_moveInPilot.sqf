params ["_pilot", "_plane"];

moveOut _pilot;

[{
	params ["_pilot", "_plane"];

	_pilot assignAsDriver _plane;
	_pilot moveInDriver _plane;

	[{
		params ["_pilot"];

		[_pilot, false] call ace_medical_fnc_setUnconscious;
		_pilot allowDamage true;
	}, _this, 1] call CBA_fnc_waitAndExecute;
}, _this] call CBA_fnc_execNextFrame;