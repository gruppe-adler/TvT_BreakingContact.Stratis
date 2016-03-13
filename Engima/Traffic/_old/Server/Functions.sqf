if (!isNil "ENGIMA_TRAFFIC_functionsInitialized") exitWith {};

ENGIMA_TRAFFIC_FindEdgeRoads = {
	private ["_minTopLeftDistance", "_minTopRightDistance", "_minBottomRightDistance", "_minBottomLeftDistance"];
	private ["_worldTrigger", "_worldSize", "_mapTopLeftPos", "_mapTopRightPos", "_mapBottomRightPos", "_mapBottomLeftPos"];
	
	if (!isNil "ENGIMA_TRAFFIC_edgeRoadsInitializing") exitWith {};
	ENGIMA_TRAFFIC_edgeRoadsInitializing = true;
	
	_worldTrigger = call BIS_fnc_worldArea;
	_worldSize = triggerArea _worldTrigger;
	deleteVehicle _worldTrigger;
	_mapTopLeftPos = [0, 2 * (_worldSize select 1)];
	_mapTopRightPos = [2 * (_worldSize select 0), 2 * (_worldSize select 1)];
	_mapBottomRightPos = [2 * (_worldSize select 0), 0];
	_mapBottomLeftPos = [0, 0];
	
	_minTopLeftDistance = 1000000;
	_minTopRightDistance = 1000000;
	_minBottomRightDistance = 1000000;
	_minBottomLeftDistance = 1000000;
	
	ENGIMA_TRAFFIC_allRoadSegments = [0,0,0] nearRoads 1000000;
	
	// Find all edge road segments
	{
		private "_roadPos";
		
		_roadPos = getPos _x;
		
		// Top left
		if (_roadPos distance _mapTopLeftPos < _minTopLeftDistance) then {
			_minTopLeftDistance = _roadPos distance _mapTopLeftPos;
			ENGIMA_TRAFFIC_topLeftRoad = _x;
		};
		
		// Top right
		if (_roadPos distance _mapTopRightPos < _minTopRightDistance) then {
			_minTopRightDistance = _roadPos distance _mapTopRightPos;
			ENGIMA_TRAFFIC_topRightRoad = _x;
		};
		
		// Top left
		if (_roadPos distance _mapBottomRightPos < _minBottomRightDistance) then {
			_minBottomRightDistance = _roadPos distance _mapBottomRightPos;
			ENGIMA_TRAFFIC_bottomRightRoad = _x;
		};
		
		// Top left
		if (_roadPos distance _mapBottomLeftPos < _minBottomLeftDistance) then {
			_minBottomLeftDistance = _roadPos distance _mapBottomLeftPos;
			ENGIMA_TRAFFIC_bottomLeftRoad = _x;
		};
		
		ENGIMA_TRAFFIC_edgeRoadsUseful = true;
		
		sleep 0.01;
	} foreach (ENGIMA_TRAFFIC_allRoadSegments);
	
	ENGIMA_TRAFFIC_edgeRoadsInitialized = true;
};

ENGIMA_TRAFFIC_MoveVehicle = {
	private ["_vehicle", "_firstDestinationPos", "_debug"];
    private ["_speed", "_roadSegments", "_destinationSegment"];
    private ["_destinationPos"];
    private ["_waypoint", "_fuel"];
    
    _vehicle = _this select 0;
    if (count _this > 1) then {_firstDestinationPos = _this select 1;} else {_firstDestinationPos = [];};
    if (count _this > 2) then {_debug = _this select 2;} else {_debug = false;};
    
    // Set fuel to something in between 0.2 and 0.9.
    _fuel = 0.2 + random (0.9 - 0.2);
    _vehicle setFuel _fuel;
    
    if (count _firstDestinationPos > 0) then {
        _destinationPos = + _firstDestinationPos;
    }
    else {
        _roadSegments = _vehicle nearRoads 1000000;
        _destinationSegment = _roadSegments select floor random count _roadSegments;
        _destinationPos = getPos _destinationSegment;
    };
    
    _speed = "NORMAL";
    if (_vehicle distance _destinationSegment < 500) then {
        _speed = "LIMITED";
    };
    
    _waypoint = group _vehicle addWaypoint [_destinationPos, 10];
    _waypoint setWaypointBehaviour "SAFE";
    _waypoint setWaypointSpeed _speed;
    _waypoint setWaypointCompletionRadius 10;
    _waypoint setWaypointStatements ["true", "_nil = [" + vehicleVarName _vehicle + ", [], " + str _debug + "] spawn ENGIMA_TRAFFIC_MoveVehicle;"];
};

ENGIMA_TRAFFIC_StartTraffic = {
	if (!isServer) exitWith {};
	
//	if (isNil "dre_var_commonLibInitialized") then { call compile preprocessFileLineNumbers "Engima\CommonLib\CommonLib.sqf"; };
//	if (isNil "ENGIMA_TRAFFIC_functionsInitialized") then { call compile preprocessFileLineNumbers "Engima\Traffic\Functions.sqf"; };
	
	private ["_side", "_vehicleCount", "_minSpawnDistance", "_maxSpawnDistance", "_minSkill", "_maxSkill", "_debug"];
	private ["_allPlayerPositions", "_allPlayerPositionsTemp", "_activeVehiclesAndGroup", "_vehiclesGroup", "_spawnSegment", "_vehicle", "_group", "_result", "_possibleVehicles", "_vehicleType", "_vehiclesCrew", "_skill", "_minDistance", "_tries", "_trafficLocation"];
	private ["_currentEntityNo", "_vehicleVarName", "_tempVehiclesAndGroup", "_deletedVehiclesCount", "_firstIteration", "_roadSegments", "_destinationSegment", "_destinationPos", "_direction"];
	private ["_roadSegmentDirection", "_testDirection", "_facingAway", "_posX", "_posY", "_pos"];
	private ["_fnc_OnSpawnVehicle", "_fnc_CreateVehicleCrew","_fnc_OnRemoveVehicle", "_fnc_FindSpawnSegment"];
	private ["_debugMarkerName"];

	_side = [_this, "SIDE", civilian] call ENGIMA_TRAFFIC_GetParamValue;
	_possibleVehicles = [_this, "VEHICLES", ["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F"]] call ENGIMA_TRAFFIC_GetParamValue;
	_vehicleCount = [_this, "VEHICLES_COUNT", 10] call ENGIMA_TRAFFIC_GetParamValue;
	_minSpawnDistance = [_this, "MIN_SPAWN_DISTANCE", 800] call ENGIMA_TRAFFIC_GetParamValue;
	_maxSpawnDistance = [_this, "MAX_SPAWN_DISTANCE", 1200] call ENGIMA_TRAFFIC_GetParamValue;
	_minSkill = [_this, "MIN_SKILL", 0.3] call ENGIMA_TRAFFIC_GetParamValue;
	_maxSkill = [_this, "MAX_SKILL", 0.7] call ENGIMA_TRAFFIC_GetParamValue;
	_fnc_CreateVehicleCrew = [_this, "CREATE_VEHICLE_CREW", {}] call ENGIMA_TRAFFIC_GetParamValue;
	_fnc_OnSpawnVehicle = [_this, "ON_SPAWN_CALLBACK", {}] call ENGIMA_TRAFFIC_GetParamValue;
	_fnc_OnRemoveVehicle = [_this, "ON_REMOVE_CALLBACK", {}] call ENGIMA_TRAFFIC_GetParamValue;
	_debug = [_this, "DEBUG", false] call ENGIMA_TRAFFIC_GetParamValue;
	
	if (_debug) then {
	    ["Starting Military Traffic " + str _side + "..."] call ENGIMA_TRAFFIC_ShowDebugTextAllClients;
	};
	
	_activeVehiclesAndGroup = [];
	
	_fnc_FindSpawnSegment = {
	    private ["_allPlayerPositions", "_minSpawnDistance", "_maxSpawnDistance", "_activeVehiclesAndGroup"];
	    private ["_refPlayerPos", "_roadSegments", "_roadSegment", "_isOk", "_tries", "_result", "_spawnDistanceDiff", "_refPosX", "_refPosY", "_dir", "_tooFarAwayFromAll", "_tooClose", "_tooCloseToAnotherVehicle"];
	
	    _allPlayerPositions = _this select 0;
	    _minSpawnDistance = _this select 1;
	    _maxSpawnDistance = _this select 2;
	    _activeVehiclesAndGroup = _this select 3;
	    
	    _spawnDistanceDiff = _maxSpawnDistance - _minSpawnDistance;
	    _roadSegment = "NULL";
	    _refPlayerPos = (_allPlayerPositions select floor random count _allPlayerPositions);
	    
	    _isOk = false;
	    _tries = 0;
	    while {!_isOk && _tries < 5} do {
	        _isOk = true;
	        
	        _dir = random 360;
	
	        _refPosX = (_refPlayerPos select 0) + (_minSpawnDistance + _spawnDistanceDiff) * sin _dir;
	        _refPosY = (_refPlayerPos select 1) + (_minSpawnDistance + _spawnDistanceDiff) * cos _dir;
	        
	        _roadSegments = [_refPosX, _refPosY] nearRoads (_spawnDistanceDiff);
	        
	        if (count _roadSegments > 0) then {
	            _roadSegment = _roadSegments select floor random count _roadSegments;
	            
	            // Check if road segment is at spawn distance
	            _tooFarAwayFromAll = true;
	            _tooClose = false;
	            {
	                private ["_tooFarAway"];
	                
	                _tooFarAway = false;
	                
	                if (_x distance (getPos _roadSegment) < _minSpawnDistance) then {
	                    _tooClose = true;
	                };
	                if (_x distance (getPos _roadSegment) > _maxSpawnDistance) then {
	                    _tooFarAway = true;
	                };
	                if (!_tooFarAway) then {
	                    _tooFarAwayFromAll = false;
	                };
	                
	                _tooCloseToAnotherVehicle = false;
	                {
	                    private ["_vehicle"];
	                    _vehicle = _x select 0;
	                    
	                    if ((getPos _roadSegment) distance _vehicle < 100) then {
	                        _tooCloseToAnotherVehicle = true;
	                    };                
	                } foreach _activeVehiclesAndGroup;
	            } foreach _allPlayerPositions;
	            
	            _isOk = true;
	            
	            if (_tooClose || _tooFarAwayFromAll || _tooCloseToAnotherVehicle) then {
	                _isOk = false;
	                _tries = _tries + 1;
	            };
	        }
	        else {
	            _isOk = false;
	            _tries = _tries + 1;
	        };
	    };
	
	    if (!_isOk) then {
	        _result = "NULL";
	    }
	    else {
	        _result = _roadSegment;
	    };
	
	    _result
	};
	
	//_iterationNo = 0;
	_firstIteration = true;
	
	[] spawn ENGIMA_TRAFFIC_FindEdgeRoads;
	waitUntil { !isNil "ENGIMA_TRAFFIC_edgeRoadsUseful" };
	
	while {true} do {
	    scopeName "mainScope";
	
		_allPlayerPositionsTemp = [];
		if (isMultiplayer) then {
			{
				if (isPlayer _x) then {
					_allPlayerPositionsTemp = _allPlayerPositionsTemp + [position vehicle _x];
				};
			} foreach (playableUnits);
		}
		else {
			_allPlayerPositionsTemp = [position vehicle player];
		};
	
		if (count _allPlayerPositionsTemp > 0) then {
			_allPlayerPositions = _allPlayerPositionsTemp;
		};
	
	    // If there are few vehicles, add a vehicle
	
	    _tries = 0;
	    while {count _activeVehiclesAndGroup < _vehicleCount && _tries < 1} do {
			sleep 1;
			
	        // Get all spawn positions within range
	        if (_firstIteration) then {
	            _minDistance = 300;
	            
	            if (_minDistance > _maxSpawnDistance) then {
	                _minDistance = 0;
	            };
	        }
	        else {
	            _minDistance = _minSpawnDistance;
	        };
	        
	        _spawnSegment = [_allPlayerPositions, _minDistance, _maxSpawnDistance, _activeVehiclesAndGroup] call _fnc_FindSpawnSegment;
	        
	        // If there were spawn positions
	        if (str _spawnSegment != """NULL""") then {
	            _tries = 0;
	            
	            // Get first destination
	            _trafficLocation = floor random 5;
	            switch (_trafficLocation) do {
	                case 0: { _roadSegments = (getPos ENGIMA_TRAFFIC_bottomLeftRoad) nearRoads 300; };
	                case 1: { _roadSegments = (getPos ENGIMA_TRAFFIC_topLeftRoad) nearRoads 300; };
	                case 2: { _roadSegments = (getPos ENGIMA_TRAFFIC_topRightRoad) nearRoads 300; };
	                case 3: { _roadSegments = (getPos ENGIMA_TRAFFIC_bottomRightRoad) nearRoads 300; };
	                default { _roadSegments = ENGIMA_TRAFFIC_allRoadSegments };
	            };
	            
	            _destinationSegment = _roadSegments select floor random count _roadSegments;
	            _destinationPos = getPos _destinationSegment;
	            
	            _direction = ((_destinationPos select 0) - (getPos _spawnSegment select 0)) atan2 ((_destinationPos select 1) - (getpos _spawnSegment select 1));
	            _roadSegmentDirection = getDir _spawnSegment;
	            
	            while {_roadSegmentDirection < 0} do {
	                _roadSegmentDirection = _roadSegmentDirection + 360;
	            };
	            while {_roadSegmentDirection > 360} do {
	                _roadSegmentDirection = _roadSegmentDirection - 360;
	            };
	            
	            while {_direction < 0} do {
	                _direction = _direction + 360;
	            };
	            while {_direction > 360} do {
	                _direction = _direction - 360;
	            };
	
	            _testDirection = _direction - _roadSegmentDirection;
	            
	            while {_testDirection < 0} do {
	                _testDirection = _testDirection + 360;
	            };
	            while {_testDirection > 360} do {
	                _testDirection = _testDirection - 360;
	            };
	            
	            _facingAway = false;
	            if (_testDirection > 90 && _testDirection < 270) then {
	                _facingAway = true;
	            };
	            
	            if (_facingAway) then {
	                _direction = _roadSegmentDirection + 180;
	            }
	            else {
	                _direction = _roadSegmentDirection;
	            };            
	            
	            _posX = (getPos _spawnSegment) select 0;
	            _posY = (getPos _spawnSegment) select 1;
	            
	            _posX = _posX + 2.5 * sin (_direction + 90);
	            _posY = _posY + 2.5 * cos (_direction + 90);
	            _pos = [_posX, _posY, 0];
	            
	            // Create vehicle
	            _vehicleType = _possibleVehicles select floor (random count _possibleVehicles);
	            //_result = [_pos, _direction, _vehicleType, _side] call BIS_fnc_spawnVehicle;

	            _vehicleGroup = createGroup _side;
	            // Run spawn script and attach handle to vehicle
	            [_vehicleType,_vehicleGroup] call _fnc_CreateVehicleCrew;

	            _result = [_pos, _direction, _vehicleType, _vehicleGroup] call BIS_fnc_spawnVehicle;
	            _vehicle = _result select 0;
	            _vehiclesCrew = _result select 1;
	            _vehiclesGroup = _result select 2;
	            
	            // Name vehicle
	            sleep random 0.05;
	            if (isNil "dre_MilitaryTraffic_CurrentEntityNo") then {
	                dre_MilitaryTraffic_CurrentEntityNo = 0
	            };
	            
	            _currentEntityNo = dre_MilitaryTraffic_CurrentEntityNo;
	            dre_MilitaryTraffic_CurrentEntityNo = dre_MilitaryTraffic_CurrentEntityNo + 1;
	            
	            _vehicleVarName = "dre_MilitaryTraffic_Entity_" + str _currentEntityNo;
	            _vehicle setVehicleVarName _vehicleVarName;
	            _vehicle call compile format ["%1=_this;", _vehicleVarName];
	            
	            // Set crew skill
	            {
	                _skill = _minSkill + random (_maxSkill - _minSkill);
	                _x setSkill _skill;
	            } foreach _vehiclesCrew;
	            
	            _debugMarkerName = "dre_MilitaryTraffic_DebugMarker" + str _currentEntityNo;
	            
	            //_vehicle setDir _direction;
	            
	            // Start vehicle
	            [_vehicle, _destinationPos, _debug] spawn ENGIMA_TRAFFIC_MoveVehicle;
	            _activeVehiclesAndGroup set [count _activeVehiclesAndGroup, [_vehicle, _vehiclesGroup, _vehiclesCrew, _debugMarkerName]];
	            
	            // Run spawn script and attach handle to vehicle
	            _vehicle setVariable ["dre_scriptHandle2", _result spawn _fnc_OnSpawnVehicle];
	            
	            if (_debug) then {
	                ["Vehicle '" + vehicleVarName _vehicle + "' created! Total vehicles = " + str count _activeVehiclesAndGroup] call ENGIMA_TRAFFIC_ShowDebugTextAllClients;
	            };
	        }
	        else {
	            _tries = _tries + 1;
	        };
	    };
	    
	    _firstIteration = false;
	
	    if (_debug) then {
	        {
	            private ["_debugMarkerColor"];
	            
	            _vehicle = _x select 0;
	            _group = _x select 1;
	            _debugMarkerName = _x select 3;
	            _side = side _group;
	            
	            _debugMarkerColor = "Default";
	            if (_side == west) then {
	                _debugMarkerColor = "ColorBlue";
	            };
	            if (_side == east) then {
	                _debugMarkerColor = "ColorRed";
	            };
	            if (_side == civilian) then {
	                _debugMarkerColor = "ColorYellow";
	            };
	            if (_side == resistance) then {
	                _debugMarkerColor = "ColorGreen";
	            };
	            
	            [_debugMarkerName, getPos (_vehicle), "mil_dot", _debugMarkerColor, "Traffic"] call ENGIMA_TRAFFIC_SetDebugMarkerAllClients;
	            
	        } foreach _activeVehiclesAndGroup;
	    };
	    
		// If any vehicle is too far away, delete it
	    _tempVehiclesAndGroup = [];
	    _deletedVehiclesCount = 0;
		{
	        private ["_closestUnitDistance", "_distance", "_crewUnits"];
	        private ["_scriptHandle"];
	        
	        _vehicle = _x select 0;
	        _group = _x select 1;
	        _crewUnits = _x select 2;
	        _debugMarkerName = _x select 3;
	        
	        _closestUnitDistance = 1000000;
	        
	        {
	            _distance = (_x distance _vehicle);
	            if (_distance < _closestUnitDistance) then {
	                _closestUnitDistance = _distance;
	            };
	        } foreach _allPlayerPositions;
	        
	        if (_closestUnitDistance < _maxSpawnDistance) then {
	            _tempVehiclesAndGroup set [count _tempVehiclesAndGroup, _x];
	        }
	        else {
	            // Run callback before deleting
	            _vehicle call _fnc_OnRemoveVehicle;
	            
	            // Delete crew
	            {
	                deleteVehicle _x;
	            } foreach _crewUnits;
	
	            // Terminate script before deleting the vehicle
	            _scriptHandle = _vehicle getVariable "dre_scriptHandle";
	            if (!(scriptDone _scriptHandle)) then {
	                terminate _scriptHandle;
	            };

	            
	            deleteVehicle _vehicle;
	            deleteGroup _group;
	
	            [_debugMarkerName] call ENGIMA_TRAFFIC_DeleteDebugMarkerAllClients;
	            _deletedVehiclesCount = _deletedVehiclesCount + 1;
	            
	            if (_debug) then {
	                ["Vehicle deleted! Total vehicles = " + str (count _activeVehiclesAndGroup - _deletedVehiclesCount)] call ENGIMA_TRAFFIC_ShowDebugTextAllClients
	            };
	        };
		} foreach _activeVehiclesAndGroup;
	    
	    _activeVehiclesAndGroup = _tempVehiclesAndGroup;
	    
	    sleep 1;
	};
};

ENGIMA_TRAFFIC_functionsInitialized = true;
