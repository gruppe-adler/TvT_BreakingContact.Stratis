/*
		
		This script is based on a script created by [EVO] Dan, with help from [EVO] Curry, with snippets from the BIS module.
			
		modified by nomisum to his needs

*/
		


		
spawnSupplyDrop = {
	_vehicleType = _this select 0;	//ammocrate class for blufor, feel free to change to whichever box you desire
	_pos = _this select 1;
    _init = _this select 2;
    _calls = _this select 3;

    // if there is nothing to be spawned
    if (_vehicleType == "Land_SatellitePhone_F") exitWith {
			radioSuitcaseAttached = createVehicle ['Land_SatellitePhone_F', [(getPos funkwagen select 0) + 2, (getPos funkwagen select 1) - 1, 0.5], [], 0, 'NONE'];
            radioSuitcaseAttached attachTo [funkwagen, [-1.34,-2.26,0.1]];
            radioSuitcaseAttached setVectorDirAndUp [[1,0,0],[0,0,1]];
            funkwagen setVariable ['detachableRadio', 1, true];
    };

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