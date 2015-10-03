// ripped from fry
get_slope = {
	private ["_position", "_radius", "_slopeObject", "_centerHeight", "_height", "_direction", "_count"];
	_position = _this select 0;_radius = _this select 1;
	_slopeObject = "Logic" createVehicleLocal _position;
	_slopeObject setPos _position;
	_centerHeight = getPosASL _slopeObject select 2;
	_height = 0;_direction = 0;
	for "_count" from 0 to 7 do {
		_slopeObject setPos [(_position select 0)+((sin _direction)*_radius),(_position select 1)+((cos _direction)*_radius),0];
		_direction = _direction + 45;
		_height = _height + abs (_centerHeight - (getPosASL _slopeObject select 2));
	};
	deleteVehicle _slopeObject;
	_height / 8
};

testSpawnPositions = {
	_center = _this select 0;
	_items = _this select 1;
	_distance = _this select 2;
	_result = [1,nil,nil];

	// put something very big in there, just to be sure there is enough room
	_testPos1 = [_center,[_distance,_distance], random 360,0,[1,500]] call SHK_pos;
	if (count _testPos1 < 1) exitWith {_result = [0,nil,nil];};	
	if ([_testPos1, 10] call get_slope > 0.3) exitWith {_result = [0,nil,nil]; debugLog("Calculating Spawnposis: Not flat enough."); _result };

	_testVehicle1 = (_items select 0) createVehicle _testPos1;


	_testPos2 = [_testPos1,[30,50], random 360,0,[1,500]] call SHK_pos;
	if (count _testPos2 < 1) exitWith {_result = [0,nil,nil]; debugLog("Calculating Spawnposis: No matching second pos."); };	
	if (_testPos1 distance _testPos2 < 10) exitWith {deleteVehicle _testVehicle1; _result = [0,nil,nil]; debugLog("Calculating Spawnposis: HQ too close on marker."); _result};
	if ([_testPos2, 10] call get_slope > 0.3) exitWith {deleteVehicle _testVehicle1;_result = [0,nil,nil]; debugLog("Calculating Spawnposis: Not flat enough."); _result};

	_testVehicle2 = (_items select 1) createVehicle _testPos2;

	_result = [1, _testVehicle1, _testVehicle2];

	_result
};


spawnBluforHQ = {
	_centerPosition = _this select 0;
	_distance = _this select 1;
	_waitingForSpawn = true;
	_bluforSpawnSuccess = [0,nil,nil];

	while {_waitingForSpawn} do {
		
		_bluforSpawnSuccess = [_centerPosition, ["US_WarfareBUAVterminal_Base_EP1","Land_HelipadCivil_F"], _distance] call testSpawnPositions;

		if ((_bluforSpawnSuccess select 0) > 0) exitWith {
			_waitingForSpawn = false;

			US_VEHICLE_SPAWN = getPos (_bluforSpawnSuccess select 2);
			publicVariable "US_VEHICLE_SPAWN";

			BLUFOR_TELEPORT_TARGET = getPos (_bluforSpawnSuccess select 2);
			publicVariableServer "BLUFOR_TELEPORT_TARGET";

			debugLog("blufor published target");
			diag_log format ["creating blufor stuff on position: %1",US_VEHICLE_SPAWN];
		};

		sleep 0.01;
	};
};

spawnOpforHQ = {
	_centerPosition = _this select 0;
	_distance = _this select 1;
	_waitingForSpawn = true;
	_opforSpawnSuccess = [0,nil,nil];

	while {_waitingForSpawn} do {

		_opforSpawnSuccess = [_centerPosition, ["TK_WarfareBUAVterminal_Base_EP1","Land_HelipadCivil_F"], _distance] call testSpawnPositions;
		
		if ((_opforSpawnSuccess select 0) > 0) exitWith {
			_waitingForSpawn = false;

			RUS_VEHICLE_SPAWN = getPos (_opforSpawnSuccess select 2);
			publicVariable "RUS_VEHICLE_SPAWN";

			OPFOR_TELEPORT_TARGET = getPos (_opforSpawnSuccess select 2);
			publicVariableServer "OPFOR_TELEPORT_TARGET";

			debugLog("opfor published target");
			diag_log format ["creating blufor stuff on position: %1",RUS_VEHICLE_SPAWN];
		};

		sleep 0.01;
	};
};