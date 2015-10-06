/*
		
		This script is based on a script created by [EVO] Dan, with help from [EVO] Curry, with snippets from the BIS module.
			
		modified by nomisum to his needs

*/
		


		
spawnSupplyDrop = {
	_vehicleType = _this select 0;	//ammocrate class for blufor, feel free to change to whichever box you desire
	_pos = _this select 1;
    _chuteType = "B_Parachute_02_F";	//parachute for blufor, for opfor and greenfor replace the 'B' with 'O' or 'G' respectively

    _init = _this select 2;
    _calls = _this select 3;

    _vehicle = createVehicle [_vehicleType, _pos, [], 0, "NONE"];
    _vehicle allowDamage false;
    _road = [getPos _vehicle] call BIS_fnc_nearestRoad;
	if (!isNull _road) then {
		_roadConnectedTo = roadsConnectedTo _road;  
	 	_connectedRoad = _roadConnectedTo select 0;  
	 	_direction = [_road, _connectedRoad] call BIS_fnc_DirTo; 
	 	_vehicle setDir _direction;
	};

	[_vehicle] call _calls;
	
	
	sleep 0.1;
	 _vehicle allowDamage true;
	// adjust vehicle (remove lamp covers and stuff)
	if (count _init > 0) then {
 		[_vehicle, nil, _init] call BIS_fnc_initVehicle;
	};
	sleep 0.1;
};
	        /*
	        _origWind = wind;
	        _origWindForce = windStr;


	        setWind [0, 0, true];
	        0 setWindForce 0;

			//if (DEBUG) then {diag_log format ["%1",_pos]; };

			_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, "FLY"];
			
	        _chute setPos [_pos select 0, _pos select 1, 50];
	        _chute setVelocity [0,0,0];

	        [_chute] spawn {
	        	_chuty = _this select 0;

	        	while {!isNull _chuty} do {
	        		_chuty setVelocity [0,0,velocity _chuty select 2];
	        		sleep 0.1;
	        	};
	    	};

	       
			_vehicle = createVehicle [_vehicleType, position _chute, [], 0, "NONE"];

			[_vehicle] call _calls;
			sleep 0.1;

			// adjust vehicle (remove lamp covers and stuff)
			if (count _init > 0) then {
	     		[_vehicle, nil, _init] call BIS_fnc_initVehicle;
	    	};
	    	sleep 0.1;

	    	
			

	        _vehicle attachTo [_chute, [0, 0, -0.5]];
	        waitUntil {position _vehicle select 2 < 0.6 || isNull _chute};
	        detach _vehicle;
	        _vehicle setPos [position _vehicle select 0, position _vehicle select 1, 0];

	        0 setWindForce _origWindForce;
	        setWind [_origWind select 0, _origWind select 1, true];
		};*/