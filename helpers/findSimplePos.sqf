findSimplePos = {

	_nearestPosition = [];
	_center = _this select 0;
	_min_distance = _this select 1;
	_max_distance = _this select 2;
	_unitType = _this select 3;


	_distanceToSearch = _max_distance;

	while {count _nearestPosition < 1} do {
		_tempPosition = [_center,[_min_distance,_distanceToSearch], random 360,0,[1,200],[200,_unitType]] call SHK_pos;
		//_distanceToSearch = _distanceToSearch + 10;
		
		if (count _tempPosition > 0) then { _nearestPosition = _tempPosition;};

		diag_log format ["%1",_distanceToSearch];	
	};


	//_returnValue = [_nearestPosition select 0, _nearestPosition select 1, 0];

	// found Position
	//_returnValue = _nearestPosition;

	//if (DEBUG) then { diag_log format ["findSpawnPos found: %1",_nearestPosition]; };

	// return

	diag_log format ["_simplePos select 0: %1",_nearestPosition];	
	_nearestPosition
};