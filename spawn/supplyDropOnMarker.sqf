spawnSupplyDrop = {
	_vehicleType = _this select 0;	//ammocrate class for blufor, feel free to change to whichever box you desire
	_pos = _this select 1;
    _init = _this select 2;
    _calls = _this select 3;

    // if there is nothing to be spawned
    if (_vehicleType == "Land_DataTerminal_01_F") exitWith {
			portableRadioBox = createVehicle ['Land_DataTerminal_01_F', [(getPos funkwagen select 0) + 2, (getPos funkwagen select 1) - 1, 0.5], [], 0, 'NONE'];
            portableRadioBox attachTo [funkwagen,[0.5,-5,0]];  
            portableRadioBox setVectorDirAndUp [[0,1,0.3],[0,0,0.7]];  

            [[portableRadioBox,["Open","dataterminal\OpenTerminal.sqf"]],"addAction",true] call BIS_fnc_MP; 
            [[portableRadioBox, true, [0,1,0], 180], "ace_dragging_fnc_setdraggable", true, true] call BIS_fnc_MP;


            portableRadioBox setObjectTextureGlobal [0, "#(argb,8,8,3)color(0,0,0,0.0,co)"];  
            portableRadioBox setObjectTextureGlobal [1, "#(argb,8,8,3)color(0,0,0,0.0,co)"];  
            portableRadioBox setObjectTextureGlobal [2, "#(argb,8,8,3)color(0,0,0,0.0,co)"];  
            portableRadioBox setObjectTextureGlobal [3, "#(argb,8,8,3)color(0,0,0,0.0,co)"];  
            portableRadioBox setObjectTextureGlobal [4, "#(argb,8,8,3)color(0,0,0,0.0,co)"];

            [campChair, true, 1] call ace_cargo_fnc_makeLoadable;
            
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