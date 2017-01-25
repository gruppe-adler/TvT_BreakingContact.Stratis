spawnSlingLoad = {

		_classname = _this select 1;
		_init = _this select 2;
		_call = _this select 3;
		_selector = _this select 4;
		_side = _this select 5;

		_drop_pos = [0,0];
		_spawnVehicleClass = spawnSlingLoadVehicleClassBlufor;


		switch (_side) do {
			case west: {
				_spawnVehicleClass = spawnSlingLoadVehicleClassBlufor;
				_drop_pos = getMarkerPos spawnMarkerBluforHelicopter; // _this select 0;
			};
			case east: {
				_spawnVehicleClass = spawnSlingLoadVehicleClassOpfor;
				_drop_pos = getMarkerPos spawnMarkerOpforHelicopter; // _this select 0;
			};
			default {diag_log "fnc_spawnSlingLoad ERROR in slingloading, no side set";};
		};

		_chopperPos0 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
		_chopperPos1 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
		_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
		_chopperPos3 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
		_chopperPos4 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;

		if (_side == west) then {
					switch (SPAWN_APPROACH_BLUFOR) do {
						case "NORTH": {
							_chopperPos0 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
							_chopperPos1 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
							_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_chopperPos3 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
							_chopperPos4 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
						};
						case "WEST": {
							_chopperPos0 = [0, _drop_pos select 1,0];
							_chopperPos1 = [_drop_pos, 1000, 270] call BIS_fnc_relPos;
							_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_chopperPos3 = [_drop_pos, 1000, 270] call BIS_fnc_relPos;
							_chopperPos4 = [_drop_pos, 3000, 270] call BIS_fnc_relPos;
						};
						case "SOUTH": {
							_chopperPos0 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
							_chopperPos1 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_chopperPos3 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_chopperPos4 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
						};
						case "EAST": {
							_chopperPos0 = [_drop_pos, 3000, 90] call BIS_fnc_relPos;
							_chopperPos1 = [_drop_pos, 1000, 90] call BIS_fnc_relPos;
							_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_chopperPos3 = [_drop_pos, 1000, 90] call BIS_fnc_relPos;
							_chopperPos4 = [_drop_pos, 3000, 90] call BIS_fnc_relPos;
						};
						default {
							hintsilent "error: spawn direction not set!";
							_chopperPos0 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
							_chopperPos1 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_chopperPos3 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_chopperPos4 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
						};
					};
		} else {
					switch (SPAWN_APPROACH_OPFOR) do {
						case "NORTH": {
							_chopperPos0 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
							_chopperPos1 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
							_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_chopperPos3 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
							_chopperPos4 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
						};
						case "WEST": {
							_chopperPos0 = [_drop_pos, 3000, 270] call BIS_fnc_relPos;
							_chopperPos1 = [_drop_pos, 1000, 270] call BIS_fnc_relPos;
							_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_chopperPos3 = [_drop_pos, 1000, 270] call BIS_fnc_relPos;
							_chopperPos4 = [_drop_pos, 3000, 270] call BIS_fnc_relPos;
						};
						case "SOUTH": {
							_chopperPos0 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
							_chopperPos1 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_chopperPos3 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_chopperPos4 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
						};
						case "EAST": {
							_chopperPos0 = [worldSize, _drop_pos select 1,0];
							_chopperPos1 = [_drop_pos, 1000, 90] call BIS_fnc_relPos;
							_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_chopperPos3 = [_drop_pos, 1000, 90] call BIS_fnc_relPos;
							_chopperPos4 = [_drop_pos, 3000, 90] call BIS_fnc_relPos;
						};
						default {
							hintsilent "error: spawn direction not set!";
							_chopperPos0 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
							_chopperPos1 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_chopperPos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_chopperPos3 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_chopperPos4 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
						};
					};
		};


		_chopperArray = [[0, 0 , 3000 + (random 500)], 0, _spawnVehicleClass, civilian] call BIS_fnc_spawnVehicle;
		_chopper = _chopperArray select 0;
		createVehicleCrew _chopper;
		chopperGroup = group _chopper;
		_chopper allowDamage false;

		// diag_log format ["c130 created"];

		_relDir = [_chopper, _drop_pos] call BIS_fnc_relativeDirTo;
		_chopper setDir _relDir;
		_chopper setCombatMode "BLUE";
		_chopper setBehaviour "CARELESS";
		_chopper disableAI "TARGET";
		_chopper disableAI "AUTOTARGET";
		_chopper setPilotLight true;
		leader group _chopper action ["lightOn", _chopper];


		_vehicle = createVehicle [_classname, [0,0,2000 + (random 500)], [], 0, "NONE"];
		_vehicle allowDamage false;
		_vehicle disableCollisionWith _chopper;

		_dummyVehicle = createVehicle ["I_Quadbike_01_F", [0, 0, 1000 + (random 500)], [], 0, "NONE"];
		_dummyVehicle allowDamage false;
		_dummyVehicle disableCollisionWith _chopper;
		_dummyVehicle disableCollisionWith _vehicle;

		[_vehicle] call _call;
		sleep 0.1;

		// adjust vehicle (remove lamp covers and stuff)
		if (count _init > 0) then {
				[_vehicle, nil, _init] call BIS_fnc_initVehicle;
		};
		_ropecount = [];
		if (count getArray (configfile >> "CfgVehicles" >> _classname >> "slingLoadCargoMemoryPoints") > 0) then {
			_ropecount = getArray (configfile >> "CfgVehicles" >> _classname >> "slingLoadCargoMemoryPoints");
		};

		_origVehicleMass = getMass _vehicle;

		_bbr = boundingBoxReal _vehicle;
		_p1 = _bbr select 0;
		_p2 = _bbr select 1;
		_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
		_maxLength = abs ((_p2 select 1) - (_p1 select 1));
		_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

		_chopper setPosATL [_chopperPos0 select 0, _chopperPos0 select 1, 750];


		_isloaded = false;

		if (count _ropecount > 0) then {
			_vehicle setMass 1000;
			_vehicle disableCollisionWith _chopper;
			_vehicle setPosATL [_chopperPos0 select 0, _chopperPos0 select 1, 735];


			_isloaded = _chopper setSlingLoad _vehicle;
			deleteVehicle _dummyVehicle;
		} else {
			_dummyVehicle setPosATL [_chopperPos0 select 0, _chopperPos0 select 1, 735];
			_dummyVehicle disableCollisionWith _chopper;
			_dummyVehicle disableCollisionWith _vehicle;


			_isloaded = _chopper setSlingLoad _dummyVehicle;
			// hintsilent format ["ropecount is %1",_isloaded];
			_vehicle attachTo [_dummyVehicle,[0,_maxLength/4,-_maxHeight/3]];
		};

		sleep 0.5;
		if (!_isloaded) exitWith {
			deleteVehicle _vehicle;
			deleteVehicle _chopper;
			deleteVehicle _dummyVehicle;
			[_classname,_init,_call,_selector,_side] call spawnSlingLoad;
			diag_log format ["exiting slingloading because of error, retrying..."];
		};

		//hintSilent format ["1%",_isloaded];

		_wp0 = chopperGroup addWaypoint [[_chopperPos1 select 0, _chopperPos1 select 1], 0];
		_wp0 setWaypointStatements ["true", "this flyInHeight 70;"];
		_wp0 setWaypointCompletionRadius 100;
		_wp0 setWaypointType "MOVE";

		_wp1 = chopperGroup addWaypoint [[_chopperPos2 select 0, _chopperPos2 select 1], 1];
		_wp1 setWaypointStatements ["true", "this flyInHeight 10;"];
		_wp1 setWaypointCompletionRadius 100;
		_wp1 setWaypointForceBehaviour true;
		_wp1 setWaypointType "UNHOOK";

		_wp2 = chopperGroup addWaypoint [[_chopperPos3 select 0, _chopperPos3 select 1], 2];
		_wp2 setWaypointStatements ["true", "this flyInHeight 70;"];
		_wp2 setWaypointCompletionRadius 100;
		_wp2 setWaypointType "MOVE";

		_wp3 = chopperGroup addWaypoint [[_chopperPos4 select 0, _chopperPos4 select 1], 3];
		_wp3 setWaypointStatements ["true", "{ deleteVehicle _x }foreach thislist + [vehicle this]"];
		_wp3 setWaypointCompletionRadius 200;
		_wp3 setWaypointType "MOVE";

		[chopperGroup, 0] setWaypointSpeed "FULL";
		[chopperGroup, 1] setWaypointSpeed "NORMAL";
		[chopperGroup, 2] setWaypointSpeed "FULL";
		if (count _ropecount > 0) then {
				waitUntil {isTouchingGround _vehicle};
		} else {
				waitUntil {getPosATL _dummyVehicle select 2 < _maxHeight/2};
		};

		_vehicle setMass _origVehicleMass;


		_vehicle setVehicleLock "UNLOCKED";

		if (count _ropecount > 0) then {} else {
				detach _vehicle;
				deleteVehicle _dummyVehicle;
		};
		sleep 0.5;
		_chopper flyInHeight 100;

		sleep 0.5;
		_vehicle setDamage 0;
		_vehicle allowDamage true;
		_vehicle setFuel 1;

		[_side, _selector] call fnc_prepareAfterBuyRefresh;

};
