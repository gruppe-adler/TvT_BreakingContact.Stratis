checkInsideMap = {
	// 0 = mapsize
	// 1 = spawnpos
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


getMapSize = {
	// check for arma3 map size
	_mapSizeDetected = worldSize;
	_mapSizeDetectedKnown = true;

	// check for utes/chernarus
	if (_mapSizeDetected < 2000) then {
	_mapSizeDetected = getNumber (configFile>>"CfgWorlds">>worldName>>"grid">>"zoom1">>"stepX")*(parseNumber mapGridPosition [0,0,0]);
	diag_log format ["Calculating Spawnpos: Map doesnt seem to be Arma3 native. Checking for Chernarus/Utes.",_mapSizeDetected];
	};

	// check for OA terrains / takistan
	if (_mapSizeDetected < 2000) then {
		_mapSizeDetected = getNumber (configFile>>"CfgWorlds">>worldName>>"grid">>"offsety");
		diag_log format ["Calculating Spawnpos: Checking for OA Terrain.",_mapSizeDetected];
	};

	// now im out of functions to get map size correctly
	if (_mapSizeDetected < 2000) then {
		_mapSizeDetectedKnown = false; diag_log format ["Calculating Spawnpos: Map Size < 2000 or unknown."];
	} else {
		_mapSizeDetectedKnown = true; diag_log format ["Calculating Spawnpos: Map Size is  %1.",_mapSizeDetected];
	};
	[_mapSizeDetected,_mapSizeDetectedKnown]
};

testSpawnPositions = {
	_center = _this select 0;
	_items = _this select 1;
	_spawnDistance = _this select 2;
	_searchDistance = _this select 3;
	_result = [2,nil,nil];

	_mapSizeArray = [] call getMapSize;
	_mapSize = _mapSizeArray select 0;
	_mapSizeKnown = _mapSizeArray select 1;



	// put something very big in there, just to be sure there is enough room
	_testPos1 = [_center,[_spawnDistance,_spawnDistance + 10], random 360,0,[2,_searchDistance],[_searchDistance,"Land_HelipadCivil_F"]] call SHK_pos;
	if (count _testPos1 < 1) exitWith {_result = [1,nil,nil]; diag_log format ["Calculating Spawnpos: Found nothing, trying again."];};

	// if map size is known and spawn position is outside map, result is 1
	if (!([_mapSize, _testPos1] call checkInsideMap) && _mapSizeKnown) exitWith {_result = [1,nil,nil]; diag_log format ["Calculating Spawnpos: Outside Map."]; _result };


	if ([_testPos1, 5] call get_slope > 0.4) exitWith {_result = [1,nil,nil]; diag_log format ["Calculating Spawnpos: Not flat enough."]; _result };


	_testVehicle1 = (_items select 0) createVehicleLocal _testPos1;


	_testPos2 = [_testPos1,[20,60], random 360,0,[2,60]] call SHK_pos;
	if (count _testPos2 < 1) exitWith {_result = [1,nil,nil]; diag_log format ["Calculating Spawnpos: No matching second pos."]; _result};
	if (_testPos1 distance _testPos2 < 10) exitWith {deleteVehicle _testVehicle1; _result = [1,nil,nil]; diag_log format ["Calculating Spawnpos: HQ too close on marker."]; _result};

	// if (_testPos1 distance OPFOR_TELEPORT_TARGET < _spawnDistance) exitWith {deleteVehicle _testVehicle1; _result = [1,nil,nil]; diag_log format ["Calculating Spawnpos: HQ too close to OPFOR."]; _result};

	if ([_testPos2, 5] call get_slope > 0.4) exitWith {deleteVehicle _testVehicle1;_result = [1,nil,nil]; diag_log format ["Calculating SpawnposPad: Not flat enough."]; _result};

	_testVehicle2 = (_items select 1) createVehicleLocal _testPos2;

	deleteVehicle _testVehicle1; deleteVehicle _testVehicle2; // delete position dummies
	_vehicle1 = createVehicle [(_items select 0), _testPos1, [], 2, "NONE"];
	_vehicle2 = createVehicle [(_items select 1), _testPos2, [], 0, "NONE"];

	_result = [2, _vehicle1, _vehicle2];

	_result
};


spawnBluforHQ = {
	_bluforCenterPosition = _this select 0;
	_bluforDistance = _this select 1;
	_bluforSearchDistance = 10;
	_waitingForBluforSpawn = true;

	// woodland camo?
    if ((ISLAND_TARGET_POSITIONS select (ISLANDS find worldName)) select 3) then {
       hmmwv_hq = "rhsusf_m998_w_4dr";
    } else {
       hmmwv_hq = "rhsusf_m998_d_4dr";
    };
    _startTime = time;


	while {_waitingForBluforSpawn} do {
		_bluforSpawnSuccess = [0,nil,nil];
		if (time > (_startTime + 30)) then {
			diag_log format ["fatal error : no blufor spawnpad position found. reducing spawn radius..."];
			[{hintSilent "F A T A L   E R R O R:  no blufor spawn position found, adapting...";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
			_bluforDistance = _bluforDistance - 1000;
			_bluforSearchDistance = _bluforSearchDistance + 20;
		};
		if (time > (_startTime + 60)) then {
			diag_log format ["fatal error : no blufor spawnpad position found. reducing spawn radius..."];
			[{hintSilent "F A T A L   E R R O R:  no blufor spawn position found, adapting...";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
			_bluforDistance = _bluforDistance - 1000;
			_bluforSearchDistance = _bluforSearchDistance + 40;
		};
		if (time > (_startTime + 120)) exitWith {
			diag_log format ["fatal error : no blufor spawnpad position found. please restart."];
			[{hintSilent "F A T A L   E R R O R:  no blufor spawnpad position found. please restart.";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};

		_bluforSpawnSuccess = [_bluforCenterPosition, [hmmwv_hq,"Land_HelipadCivil_F"], _bluforDistance, _bluforSearchDistance] call testSpawnPositions;
		waitUntil {(_bluforSpawnSuccess select 0) > 0};

		if ((_bluforSpawnSuccess select 0) > 1) exitWith {
			_waitingForBluforSpawn = false;

			_vehicle1 = (_bluforSpawnSuccess select 1);
			_vehicle2 = (_bluforSpawnSuccess select 2);

			[_vehicle1, _vehicle2] call setSpawnedDirection;
			[_vehicle1,	nil, ["hide_middleTop",1]] call BIS_fnc_initVehicle;
			[_vehicle1] call clearInventory;

			US_SPAWN_PAD = (_bluforSpawnSuccess select 2);
			publicVariable "US_SPAWN_PAD";

			US_VEHICLE_SPAWN = getPos (_bluforSpawnSuccess select 2);
			publicVariable "US_VEHICLE_SPAWN";

			BLUFOR_TELEPORT_TARGET = getPos (_bluforSpawnSuccess select 2);
			publicVariableServer "BLUFOR_TELEPORT_TARGET";



			usActionHelper = createVehicle ["Land_SatellitePhone_F", [(getPos _vehicle1 select 0) + 2, (getPos _vehicle1 select 1) - 1, 0.5], [], 0, "NONE"];
			usActionHelper attachTo [_vehicle1, [0,-0.3,1.1]];

			/* listener to remove spawn pad and actionhelper, when its time */
			BUY_OPTION_BLUFOR = {
				if (BUY_OPTION_BLUFOR) exitWith {};
				detach usActionHelper;
				deleteVehicle usActionHelper;
				hideObjectGlobal US_SPAWN_PAD;
			};
			"BUY_OPTION_BLUFOR" addPublicVariableEventHandler BUY_OPTION_BLUFOR;


			debugLog("blufor published target");
			diag_log format ["creating blufor stuff on position: %1",US_VEHICLE_SPAWN];

		};


		sleep 0.01;
	};
};


spawnOpforHQ = {
	_opforCenterPosition = _this select 0;
	_opforDistance = _this select 1;
	_opforSearchDistance = 10;
	_waitingForOpforSpawn = true;
	_startTime = time;

	while {_waitingForOpforSpawn} do {
		_opforSpawnSuccess = [0,nil,nil];

		if (time > (_startTime + 30)) then {
			diag_log format ["fatal error : no blufor spawnpad position found. reducing spawn radius..."];
			[{hintSilent "F A T A L   E R R O R:  no blufor spawn position found, adapting...";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
			_opforSearchDistance = _opforSearchDistance + 20;
		};

		if (time > (_startTime + 240)) exitWith {
			diag_log format ["fatal error : no opfor spawnpad position found. please restart."];
			[{hintSilent "F A T A L   E R R O R:  no opfor spawnpad position found. please restart.";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};

		// landclutter instead of building - dummy object
		_opforSpawnSuccess = [_opforCenterPosition, ["Land_ClutterCutter_small_F","Land_HelipadCivil_F"], _opforDistance, _opforSearchDistance] call testSpawnPositions;
		waitUntil {(_opforSpawnSuccess select 0) > 0};


		if ((_opforSpawnSuccess select 0) > 1) exitWith {
			_waitingForOpforSpawn = false;

			_vehicle1 = (_opforSpawnSuccess select 1);
			_vehicle2 = (_opforSpawnSuccess select 2);

			[_vehicle1, _vehicle2] call setSpawnedDirection;

			RUS_SPAWN_PAD = (_opforSpawnSuccess select 2);
			publicVariable "RUS_SPAWN_PAD";

			RUS_VEHICLE_SPAWN = getPos (_opforSpawnSuccess select 2);
			publicVariable "RUS_VEHICLE_SPAWN";

			/* listener to remove spawn pad and actionhelper, when its time */
			BUY_OPTION_OPFOR = {
				if (BUY_OPTION_OPFOR) exitWith {};
				hideObjectGlobal RUS_SPAWN_PAD;
			};
			"BUY_OPTION_OPFOR" addPublicVariableEventHandler BUY_OPTION_OPFOR;

			/* OPFOR_TELEPORT_TARGET = getPos (_opforSpawnSuccess select 2);
			publicVariableServer "OPFOR_TELEPORT_TARGET"; */

			diag_log format ["creating opfor stuff on position: %1",RUS_VEHICLE_SPAWN];
		};

		sleep 0.01;
	};
};
