findBluforPos = {

	_nearestPosition = [];
	_center = _this select 0;
	_unitType = _this select 1;


	_distanceToSearch = 10;

	while {count _nearestPosition < 1} do {
		_nearestPosition = [[_center,[MINIMAL_BLUFOR_SPAWN_DISTANCE,MAXIMAL_BLUFOR_SPAWN_DISTANCE], random 360,0,[1,400],[_distanceToSearch,_unitType]] call SHK_pos];
		_distanceToSearch = _distanceToSearch + 10;
		_tempPos = _nearestPosition select 0;

		_nobs = nearestObjects [_tempPos,["Static","House","Tank","Car","StaticWeapon","Truck_F"],15];
		if (count _nobs > 0) then {_nearestPosition = []};
	};


	//_returnValue = [_nearestPosition select 0, _nearestPosition select 1, 0];

	// found Position
	//_returnValue = _nearestPosition;

	//if (DEBUG) then { diag_log format ["findSpawnPos found: %1",_nearestPosition]; };

	// return
	_nearestPosition select 0
};