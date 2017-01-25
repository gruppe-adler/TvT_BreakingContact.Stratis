spawnChute = {

		// _drop_pos = _this select 0;
		_classname = _this select 1;
		_init = _this select 2;
		_call = _this select 3;
		_selector = _this select 4;
		_side = _this select 5;

		_drop_pos = [0,0];
		_spawnVehicleClass = spawnSlingLoadVehicleClassBlufor;


		switch (_side) do {
			case west: {
				_spawnVehicleClass = spawnChuteVehicleClassBlufor;
				_drop_pos = getMarkerPos spawnMarkerBluforPlane; // _this select 0;
			};
			case east: {
				_spawnVehicleClass = spawnChuteVehicleClassOpfor;
				_drop_pos = getMarkerPos spawnMarkerOpforPlane; // _this select 0;
			};
			default {};
		};

		_chuteType = "B_Parachute_02_F";
		isDropped = false;
		spawnChuteHeight = 400;

		_airplanePos0 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
		_airplanePos1 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
		_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
		_airplanePos3 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
		_airplanePos4 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;

		if (_side == west) then {
					switch (SPAWN_APPROACH_BLUFOR) do {
						case "NORTH": {
							_airplanePos0 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
							_airplanePos1 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
							_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_airplanePos3 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_airplanePos4 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
						};
						case "WEST": {
							_airplanePos0 = [_drop_pos, 3000, 270] call BIS_fnc_relPos;
							_airplanePos1 = [_drop_pos, 1000, 270] call BIS_fnc_relPos;
							_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_airplanePos3 = [_drop_pos, 1000, 90] call BIS_fnc_relPos;
							_airplanePos4 = [_drop_pos, 3000, 90] call BIS_fnc_relPos;
						};
						case "SOUTH": {
							_airplanePos0 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
							_airplanePos1 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_airplanePos3 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
							_airplanePos4 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
						};
						case "EAST": {
							_airplanePos0 = [_drop_pos, 3000, 90] call BIS_fnc_relPos;
							_airplanePos1 = [_drop_pos, 1000, 90] call BIS_fnc_relPos;
							_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_airplanePos3 = [_drop_pos, 1000, 270] call BIS_fnc_relPos;
							_airplanePos4 = [_drop_pos, 3000, 270] call BIS_fnc_relPos;
						};
						default {
							hintsilent "error: spawn direction not set!";
							_airplanePos0 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
							_airplanePos1 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_airplanePos3 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
							_airplanePos4 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
						};
					};
		} else {
					switch (SPAWN_APPROACH_OPFOR) do {
						case "NORTH": {
							_airplanePos0 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
							_airplanePos1 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
							_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_airplanePos3 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_airplanePos4 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
						};
						case "WEST": {
							_airplanePos0 = [_drop_pos, 3000, 270] call BIS_fnc_relPos;
							_airplanePos1 = [_drop_pos, 1000, 270] call BIS_fnc_relPos;
							_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_airplanePos3 = [_drop_pos, 1000, 90] call BIS_fnc_relPos;
							_airplanePos4 = [_drop_pos, 3000, 90] call BIS_fnc_relPos;
						};
						case "SOUTH": {
							_airplanePos0 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
							_airplanePos1 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_airplanePos3 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
							_airplanePos4 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
						};
						case "EAST": {
							_airplanePos0 = [_drop_pos, 3000, 90] call BIS_fnc_relPos;
							_airplanePos1 = [_drop_pos, 1000, 90] call BIS_fnc_relPos;
							_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_airplanePos3 = [_drop_pos, 1000, 270] call BIS_fnc_relPos;
							_airplanePos4 = [_drop_pos, 3000, 270] call BIS_fnc_relPos;
						};
						default {
							hintsilent "error: spawn direction not set!";
							_airplanePos0 = [_drop_pos, 3000, 180] call BIS_fnc_relPos;
							_airplanePos1 = [_drop_pos, 1000, 180] call BIS_fnc_relPos;
							_airplanePos2 = [_drop_pos, 0, 0] call BIS_fnc_relPos;
							_airplanePos3 = [_drop_pos, 1000, 0] call BIS_fnc_relPos;
							_airplanePos4 = [_drop_pos, 3000, 0] call BIS_fnc_relPos;
						};
					};
		};



		_carrierPlaneArray = [[_airplanePos0 select 0, _airplanePos0 select 1, spawnChuteHeight], 0, _spawnVehicleClass, civilian] call BIS_fnc_spawnVehicle;
		_carrierPlane = _carrierPlaneArray select 0;
		createVehicleCrew _carrierPlane;
		c130group = group _carrierPlane;
		// _carrierPlane setPos [_airplanePos0 select 0, _airplanePos0 select 1, spawnChuteHeight];
		// diag_log format ["c130 created"];

		_relDir = [_carrierPlane, _drop_pos] call BIS_fnc_relativeDirTo;
		_carrierPlane setDir _relDir;
		_carrierPlane setCombatMode "BLUE";
		_carrierPlane setBehaviour "CARELESS";
		_carrierPlane disableAI "TARGET";
		_carrierPlane disableAI "AUTOTARGET";
		_carrierPlane setPilotLight true;
		_carrierPlane flyInHeight spawnChuteHeight;
		_carrierPlane allowDamage false;

		diag_log format ["pos is %1",getPos _carrierPlane];

		_wp0 = c130group addWaypoint [[_airplanePos1 select 0, _airplanePos1 select 1, spawnChuteHeight], 0];
		_wp0 setWaypointStatements ["true", "this flyInHeight spawnChuteHeight;"];
		_wp1 setWaypointCompletionRadius 100;

		_wp1 = c130group addWaypoint [[_airplanePos2 select 0, _airplanePos2 select 1, spawnChuteHeight], 0];
		_wp1 setWaypointStatements ["true", "this flyInHeight spawnChuteHeight;"];
		_wp1 setWaypointCompletionRadius 50;

		_wp2 = c130group addWaypoint [[_airplanePos3 select 0, _airplanePos3 select 1, spawnChuteHeight], 0];
		_wp2 setWaypointStatements ["true", "this flyInHeight spawnChuteHeight;"];

		_wp3 = c130group addWaypoint [[_airplanePos4 select 0, _airplanePos4 select 1, spawnChuteHeight], 0];
		_wp3 setWaypointStatements ["true", "{ deleteVehicle _x }foreach thislist + [vehicle this]"];

		[c130group, 0] setWaypointSpeed "FULL";
		[c130group, 1] setWaypointSpeed "FULL";
		[c130group, 2] setWaypointSpeed "FULL";

		leader c130group animate ["ramp",1];
		leader c130group animate ["door_2_1",1];
		leader c130group animate ["door_2_2",1];
		// not sure this works actually

		waitUntil {currentWaypoint c130group > 2};

		// setting wind against drift
		// _origWind = wind; _origWindForce = windStr; setWind [0, 0, true]; 0 setWindForce 0;

		_vehicle = createVehicle [_classname, [getPos _carrierPlane select 0, getPos _carrierPlane select 1, (getPos _carrierPlane select 2) - 15], [], 0, "NONE"];

		_vehicle disableCollisionWith _carrierPlane;
		_vehicle allowDamage false;

		[_vehicle] call _call;
		sleep 0.1;

		// adjust vehicle (remove lamp covers and stuff)
		if (count _init > 0) then {
				[_vehicle, nil, _init] call BIS_fnc_initVehicle;
		};
		sleep 0.1;

		// waitUntil { getPosATL _vehicle select 2 < 100 };
		_chute = createVehicle [_chuteType, [getPos _vehicle select 0, getPos _vehicle select 1, getPos _vehicle select 2], [], 0, "FLY"];

		_vehicle attachTo [_chute, [0, 0, -0.5]];
		waitUntil {
			_vehicle setVelocity [0,0,velocity _vehicle select 2];
			position _vehicle select 2 < 1.2 || isNull _chute
		};
		detach _vehicle;
		_vehicle setPos [position _vehicle select 0, position _vehicle select 1, 0];
		sleep 1;
		_vehicle setDamage 0;
		_vehicle setFuel 1;
		_vehicle allowDamage true;
		_vehicle setVehicleLock "UNLOCKED";

		// 0 setWindForce _origWindForce;
		// setWind [_origWind select 0, _origWind select 1, true];

		[_side, _selector] call fnc_prepareAfterBuyRefresh;
};
