/*createBluforDebugSpawnMarker = {
	_n = format["_tempmarker_%1", _this select 0];
	_tempmarker_blufor = createMarker [_n, _this select 0];
	_tempmarker_blufor setMarkerType "mil_dot";
	_tempmarker_blufor setMarkerColor "ColorWEST";
	//diag_log format ["created debug marker at %1", _this select 0];
};

checkInsideMap = {
	_maximumX = _this select 0;
	_maximumY = _this select 0;
	_positionX = (_this select 1) select 0;
	_positionY = (_this select 1) select 1;
	_resultInsideMap = true;

	diag_log format ["MapsizeX: %1, MapsizeY: %2, PositionX: %3, PositionY: %4",_maximumX,_maximumY,_positionX,_positionY];

	if (_positionX < 0 || _positionX > _maximumX) then {_resultInsideMap = false;};
	if (_positionY < 0 || _positionY > _maximumY) then {_resultInsideMap = false;};

	_resultInsideMap
};

findBluforPos = {

	_nearestPosition = [];
	_center = _this select 0;
	_unitType = _this select 1;
	_count = 0;
	_mapSize = getNumber(configFile >> "CfgWorlds" >> worldName >> "MapSize");

	_distanceToSearch = BLUFOR_SPAWN_DISTANCE + 100;
	

	while {count _nearestPosition < 1} do {
		_tempPosition = [_center,[BLUFOR_SPAWN_DISTANCE, _distanceToSearch], random 360,0,[2,200],[200,_unitType]] call SHK_pos;
		//_distanceToSearch = _distanceToSearch + 10;
		_count = _count + 1;
		if (_count > 20) then {
		_tempPosition = [_center,[BLUFOR_SPAWN_DISTANCE, _distanceToSearch], random 360,0,[1,500],[500,_unitType]] call SHK_pos;
		};

		diag_log format ["%1",_count];
		if (count _tempPosition > 0) then {
		// [_tempPosition] call createBluforDebugSpawnMarker;
		if ([_mapSize, _tempPosition] call checkInsideMap) then {
			_nearestPosition = _tempPosition; diag_log format ["Inside Map: %1",_tempPosition];
			} else {
			_tempPosition = []; diag_log format ["Outside Map: %1",_tempPosition];
			};
		};
	};


	//_returnValue = [_nearestPosition select 0, _nearestPosition select 1, 0];

	// found Position
	//_returnValue = _nearestPosition;

	//if (DEBUG) then { diag_log format ["findSpawnPos found: %1",_nearestPosition]; };

	// return
	_nearestPosition
};*/