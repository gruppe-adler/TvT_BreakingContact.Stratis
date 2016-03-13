addFleeingBehaviour = {
	(_this select 0) addEventHandler ["FiredNear", {

		if ((_this select 0) getVariable "fleeing" == "true") exitWith {};

		_thisUnit = _this select 0;		 	
		_thisShooter = _this select 1;

		sleep (random 1);
	 	{[_x,_thisShooter] execVM "Engima\Traffic\Custom_GruppeAdler\fleeYouFool.sqf";} forEach crew (vehicle _thisUnit);
	}];
};

createCivilianVehicle = {
	_pos = _this select 0;
	_vehicleType = _this select 1;
	_side = _this select 2;

	_crewCount = floor (random 2);


	_createDriver = {
		_grp0 = _this select 0;
		_car0 = _this select 1;

		_crewDriver = _grp0 createUnit ["C_man_1", _pos, [], 0, "CARGO"];
		[_crewDriver] call addFleeingBehaviour;

		[_crewDriver] call randomCivilian; // civilian loadout

		_crewDriver assignAsDriver _car0;
		_crewDriver moveInDriver _car0;
		// hintsilent format ["ordered %1 to enter %2", _crewDriver,_car0];
	};

	_createCargo = {
		_grp1 = _this select 0;
		_car1 = _this select 1;

		_crewCargo = _grp1 createUnit ["C_man_1", _pos, [], 0, "CARGO"];
		

		[_crewCargo] call randomCivilian; // civilian loadout

		_crewCargo assignAsCargo _car1;
		_crewCargo moveInCargo _car1;
	};

	_veh = createVehicle [_vehicleType, _pos, [], 0, "NONE"];
	waitUntil {!isNull _veh};
	if ((random 10) > 1) then {
		_veh setVehicleLock "LOCKEDPLAYER";
	};

	_group = createGroup _side;


	[_group,_veh] call _createDriver;

	if (_vehicleType == "RDS_Ikarus_Civ_01" || _vehicleType == "RDS_Ikarus_Civ_02") exitWith {

		_crewCount = floor (random 15);

		for [{_i=0}, {_i<_crewCount}, {_i=_i+1}] do {
		[_group,_veh] call _createCargo;
		};
	};


	if (_crewCount > 0) then {
		for [{_i=0}, {_i<_crewCount}, {_i=_i+1}] do {
		[_group,_veh] call _createCargo;
		};
	};


	[_veh,_group]

};