findBluforPos = {

	_nearestPosition = [];
	_center = _this select 0;
	_unitType = _this select 1;


	_distanceToSearch = BLUFOR_SPAWN_DISTANCE + 15;


	while {count _nearestPosition < 1} do {
		_nearestPosition = [[_center,[BLUFOR_SPAWN_DISTANCE, _distanceToSearch], random 360,0,[1,200],[0,_unitType]] call SHK_pos];
		_distanceToSearch = _distanceToSearch + 10;
		
		diag_log format ["%1",_distanceToSearch];
	};


	//_returnValue = [_nearestPosition select 0, _nearestPosition select 1, 0];

	// found Position
	//_returnValue = _nearestPosition;

	//if (DEBUG) then { diag_log format ["findSpawnPos found: %1",_nearestPosition]; };

	// return
	_nearestPosition select 0
};