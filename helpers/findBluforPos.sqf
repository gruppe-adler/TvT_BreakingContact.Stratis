createBluforDebugSpawnMarker = {
	_n = format["_tempmarker_%1", _this select 0];
	_tempmarker_blufor = createMarker [_n, _this select 0];
	_tempmarker_blufor setMarkerType "mil_dot";
	_tempmarker_blufor setMarkerColor "ColorWEST";
	//diag_log format ["created debug marker at %1", _this select 0];
};

findBluforPos = {

	_nearestPosition = [];
	_center = _this select 0;
	_unitType = _this select 1;
	

	_distanceToSearch = BLUFOR_SPAWN_DISTANCE + 100;
	

	while {count _nearestPosition < 1} do {
		_tempPosition = [_center,[BLUFOR_SPAWN_DISTANCE, _distanceToSearch], random 360,0,[2,400],[0,_unitType]] call SHK_pos;
		_distanceToSearch = _distanceToSearch + 10;
		
		diag_log format ["%1",_distanceToSearch];
		if (count _tempPosition > 0) then {
		// [_tempPosition] call createBluforDebugSpawnMarker;
		_nearestPosition = _nearestPosition + _tempPosition;
		};
	};


	//_returnValue = [_nearestPosition select 0, _nearestPosition select 1, 0];

	// found Position
	//_returnValue = _nearestPosition;

	//if (DEBUG) then { diag_log format ["findSpawnPos found: %1",_nearestPosition]; };

	// return
	_nearestPosition
};