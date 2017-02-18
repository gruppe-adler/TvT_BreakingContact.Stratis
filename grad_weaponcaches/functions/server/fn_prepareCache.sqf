params ["_position", "_enemySide", "_code", "_minDistance", "_maxDistance"];

private ["_generatedPosCircle", "_settlementPos", "_spawnPos", "_valid"];

_valid = false;

while {!_valid} do {

	_generatedPosCircle = [_position, [_minDistance,_maxDistance], random 360] call SHK_pos;
	_settlement = [_generatedPosCircle, 10000] call GRAD_weaponcaches_fnc_getSettlement;
	diag_log format ["searching at %1", name _settlement];
	_spawnPos = [locationPosition _settlement] call GRAD_weaponcaches_fnc_findPositionInHouse;
	
	if (!([_spawnPos, _enemySide, _minDistance] call GRAD_weaponcaches_fnc_isNearby)) then {
		_valid = true;
	};
};

[_spawnPos, _enemySide, _code] call GRAD_weaponcaches_fnc_spawnCache;