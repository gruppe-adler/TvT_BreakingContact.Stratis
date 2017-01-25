spawnSimple = {
	_spawn_pos = _this select 0;
	_classname = _this select 1;
	_init = _this select 2;
	_call = _this select 3;
	_selector = _this select 4;
	_side = _this select 5;

	_vehicle = createVehicle [_classname, _spawn_pos, [], 0, "NONE"];

	_road = [getPos _vehicle] call BIS_fnc_nearestRoad;
	if (!isNull _road) then {
		_roadConnectedTo = roadsConnectedTo _road;
	 	_connectedRoad = _roadConnectedTo select 0;
	 	_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
	 	_vehicle setDir _direction;
	};

	[_vehicle] call _call;
	sleep 0.1;

	// adjust vehicle (remove lamp covers and stuff)
	if (count _init > 0) then {
			[_vehicle, nil, _init] call BIS_fnc_initVehicle;
	};

	_vehicle setVehicleLock "UNLOCKED";
	
	[_side, _selector] call fnc_prepareAfterBuyRefresh;
};
