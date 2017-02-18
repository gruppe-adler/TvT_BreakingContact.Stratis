params ["_position", "_radius", "_count"];

private ["_objType", "_spawnPos"];

for "_i" from 0 to _count do {

	_spawnPos = [_position, [0,_radius], random 360, 0, [1,_radius]] call SHK_pos;

	_randomizedSpawnPos = [(_spawnPos select 0) + 10 - random 20, (_spawnPos select 1) + 10 - random 20, 0];

	if (isOnRoad _randomizedSpawnPos) then {
		_objType = selectRandom grad_roadTrash_onRoad;
	} else {
		_objType = selectRandom grad_roadTrash_nextToRoad;
	};


	_obj = createSimpleObject [_objType, AGLToASL _randomizedSpawnPos];
	_obj setDir (random 360);

	_obj enableSimulationGlobal false;

	sleep 0.001;
	// diag_log format ["spawning shit no %1", _i];

	if (!isMultiplayer) then {
		[_spawnPos] call grad_roadtrash_fnc_createDebugMarker;
	} else {
		if (DEBUG_MODE) then {
			[_spawnPos] call grad_roadtrash_fnc_createDebugMarker;
		};
	};	
};

