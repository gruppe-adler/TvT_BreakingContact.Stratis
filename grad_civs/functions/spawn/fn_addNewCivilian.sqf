params ["_playerPositions"];

[_playerPositions] spawn {
	params ["_playerPositions"];

	_position = [
		_playerPositions, 
		GRAD_CIV_MIN_SPAWN_DISTANCE, 
		GRAD_CIV_MAX_SPAWN_DISTANCE, 
		GRAD_CIV_ONFOOT_GROUPS
	] call GRAD_civs_fnc_findSpawnSegment;


	diag_log format ["%1", _position];

	_group = createGroup civilian; // todo: adapt to 1.67 [civilian, true]
	_unit = _group createUnit ["C_man_1", _position, [], 0, "NONE"];

	[_unit] call GRAD_civs_fnc_dressAndBehave;

	[_group, _position, 400 - (random 300), [3,6], [0,2,10]] call GRAD_civs_fnc_taskPatrol;

	if (GRAD_CIV_DEBUG) then {
		[_position] call GRAD_civs_fnc_createDebugMarker; 
	};

	GRAD_CIV_ONFOOT_COUNT = GRAD_CIV_ONFOOT_COUNT + 1;
	GRAD_CIV_ONFOOT_GROUPS = GRAD_CIV_ONFOOT_GROUPS + [group _unit];

	diag_log format ["added civilian on foot, now %1", GRAD_CIV_ONFOOT_COUNT];

};