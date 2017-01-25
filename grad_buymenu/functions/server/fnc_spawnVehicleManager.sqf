/*
		air drop script by nomisum
		dependency: RHS
*/



fnc_spawnVehicleManager = {
	 // if (!isServer) exitWith {}; // runs only on server
	 // parachute for blufor, for opfor and greenfor replace the 'B' with 'O' or 'G' respectively

	_pos = _this select 0; 				// position or marker
	_spawnObjectType = _this select 1; 	// classname of object to be spawned
	_postinit = _this select 2; 		// vehicle init
	_calls = _this select 3; 			// extra calls made after spawn
	_spawnMethod = _this select 4;
	// 0 spawn at ground,
	// 1 spawn with chute,
	// 2 spawn with heli carrier,
	// 3 spawn with civilian driving it
	// 4 spawn at water marker
	_selector = _this select 5;
	_side = _this select 6;


	// convert vehicle array to vehicle (if more than one is possible)
	_spawnObjectType = _spawnObjectType select 0;
	diag_log format ["spawnVehicleManager received order for %1",_spawnObjectType];



	switch (_spawnMethod) do {

		case 0: { [_pos, _spawnObjectType, _postinit, _calls, _selector, _side] call spawnSimple; };
		case 1: { [_pos, _spawnObjectType, _postinit, _calls, _selector, _side] call spawnChute; };
		case 2: { [_pos, _spawnObjectType, _postinit, _calls, _selector, _side] call spawnSlingLoad; };
		case 3: { [_pos, _spawnObjectType, _postinit, _calls, _selector, _side] call spawnCiv; };
		case 4: { [_pos, _spawnObjectType, _postinit, _calls, _selector, _side] call spawnWater; };
		default { diag_log format ["FATAL ERROR , no spawn method"];};

	};

};
