addFleeingBehaviour = {
	(_this select 0) addEventHandler ["FiredNear", {

		if ((_this select 0) getVariable "fleeing" == "true") exitWith {};

		if (count (weapons (_this select 0)) == 0) then {
		 	[_this select 0, _this select 1] spawn {

		 	_thisUnit = _this select 0;		 	
		 	_thisShooter = _this select 1;

		 	deleteWaypoint [group _thisUnit, all];
		 	_thisUnit leaveVehicle (vehicle _thisUnit);

		 	// hintSilent format ["%1",_thisShooter];

			 	sleep ((random 0.5) + 0.25);

			 	_relDir = [_thisUnit,_thisShooter] call BIS_fnc_relativeDirTo;
				_bla = ((nearestBuilding _thisUnit) call BIS_fnc_buildingPositions);

			 	_rand = random 2;
			 	if (_rand <= 1) exitWith {
			 		
					//hintSilent format ["%1",_bla select 0];
					if (count _bla > 1) then {
						_thisUnit setBehaviour "SAFE";
						_pos = _bla select 1;
						_thisUnit doMove _pos;
						_thisUnit setSpeedMode "FULL";
						_thisUnit forceSpeed 25;
						_thisUnit playMove "AmovPercMevaSnonWnonDf";				
						_thisUnit setVariable ["fleeing", "true"];
						waitUntil {
						  _thisUnit distance _pos < 2
						};
						_thisUnit setVariable ["fleeing", "false"];
						_thisUnit playMoveNow 'AinvPknlMstpSnonWnonDnon_1'; 
					 	_thisUnit stop true;
					 	_thisUnit removeEventHandler ["firedNear", 0];
					};
					
					if (count _bla < 1) then {
						_pos = [_thisUnit,[5,20],_relDir-180] call SHK_pos;
						_thisUnit doMove _pos;
						_thisUnit setSpeedMode "FULL";
						_thisUnit forceSpeed 20;
						_thisUnit playMove "AmovPercMevaSnonWnonDf";				
						_thisUnit setVariable ["fleeing", "true"];
						waitUntil {
						  _thisUnit distance _pos < 2
						};
						_thisUnit setVariable ["fleeing", "false"];
						
					};
				};
				
			 	if (_rand > 1) exitWith
			 	{
			 		_thisUnit setBehaviour "SAFE";
			 		_thisUnit setSpeedMode "FULL";
			 		_thisUnit setVariable ["fleeing", "true"];

			 		_newPos = [((getPos _thisShooter) select 0)-(random 10)*sin(_relDir - 180),((getPos _thisShooter) select 1)-(random 10)*cos(_relDir - 180),0];
			 		_thisUnit doMove _newPos;
			 		_thisUnit playMove "AmovPercMevaSnonWnonDf";
						sleep 0.6;
			 		waitUntil {
			 		  _thisUnit distance _newPos < 2 		   
			 		};
				 	_thisUnit playMoveNow 'AinvPknlMstpSnonWnonDnon_1'; 
				 	_thisUnit stop true;
				 	_thisUnit removeEventHandler ["firedNear", 0];
			 	};
				


				
			 	/*
				_this playMoveNow "AinvPknlMstpSnonWnonDnon_healed_2";
				sleep 5.882;
				doStop _this;
				_movePos = [_this,[500,1000],random 360] call SHK_pos;
				_this doMove _movePos;
				_this forceSpeed 6;
				*/
			};
		} else {
			(_this select 0) spawn {
				_this setBehaviour "AWARE";
			};
		};

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
		[_crewCargo] call addFleeingBehaviour;

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