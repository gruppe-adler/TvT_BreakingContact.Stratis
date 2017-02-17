params ["_position", "_radius", "_count"];

for "_i" from 0 to _count do {

	_spawnPos = [_position, [0,_radius], random 360, 0, [1,_radius]] call SHK_pos;

	_objType = "";

	if (isOnRoad _spawnPos) then {
		_objType = selectRandom grad_roadTrash_onRoad;
	} else {
		_objType = selectRandom grad_roadTrash_nextToRoad;
	};

	_obj = [_objType] call BIS_fnc_createSimpleObject;

	_data = [_objType] call BIS_fnc_simpleObjectData;

	_randomizedSpawnPos = [(_spawnPos select 0) + 5 - random 10, (_spawnPos select 1) + 5 - random 10, 0];

	_obj = [_data, AGLToASL _randomizedSpawnPos, random 360, true] call bis_fnc_createSimpleObject;

	sleep 0.001;
	diag_log format ["spawning shit no %1", _i];

	if (!isMultiplayer) then {
		[_spawnPos] call grad_roadtrash_fnc_createDebugMarker;
	};
};

