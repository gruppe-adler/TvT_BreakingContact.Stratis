spawnCiv = {
		_civPos = _this select 0;
		_civClassname = _this select 1;
		_civInit = _this select 2;
		_civCall = _this select 3;
		_selector = _this select 4;
		_civSide = _this select 5;

		// diag_log format ["civilian side: %1",_civSide];
		_spawnLocationVehicle = [0,0,0];



		if (_civSide == west) then {
			_spawnLocationVehicle = getMarkerPos spawnMarkerCivilianBlufor;
		} else {
			_spawnLocationVehicle = getMarkerPos spawnMarkerCivilianOpfor;
		};


		diag_log format ["%1, %2, %3, %4", _civPos, _civClassname, _civSide, _spawnLocationVehicle];
		_vehicle = createVehicle [_civClassname, _spawnLocationVehicle, [], 0, "NONE"];

		_civGroup = createGroup civilian;
		_civilian = _civGroup createUnit [civilianCarSupplier, _spawnLocationVehicle, [], 0, "NONE"];

		sleep 0.1;

		_civilian moveInDriver _vehicle;
		_vehicle allowDamage false;

		_civilian setCombatMode "BLUE";
		_civilian setBehaviour "CARELESS";
		_civilian disableAI "TARGET";
		_civilian disableAI "AUTOTARGET";
		_civilian action ["lightOn", _vehicle];

		[_vehicle] call _civCall;
		sleep 0.1;

		// adjust vehicle (remove lamp covers and stuff)
		if (count _civInit > 0) then {
				[_vehicle, nil, _civInit] call BIS_fnc_initVehicle;
		};
		_vehicle setVehicleLock "UNLOCKED";

		_wp0 = _civGroup addWaypoint [_civPos, 0];
		_wp0 setWaypointStatements ["true", "(vehicle (leader group this)) allowDamage true; group this leaveVehicle (vehicle (leader group this));"];
		_wp0 setWaypointCompletionRadius 20;
		[_civGroup, 0] setWaypointForceBehaviour true;


		_wp1 = _civGroup addWaypoint [_spawnLocationVehicle, 1];
		_wp1 setWaypointType "MOVE";
		[_civGroup, 1] setWaypointForceBehaviour true;
		_wp1 setWaypointStatements ["true", "{ deleteVehicle _x }foreach thislist + [vehicle this]"];

		[_civGroup, 0] setWaypointSpeed "LIMITED";
		[_civGroup, 1] setWaypointSpeed "LIMITED";

		[_side, _selector] call fnc_prepareAfterBuyRefresh;
};
