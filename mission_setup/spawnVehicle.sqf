#include "\z\ace\addons\main\script_component.hpp"

_position = _this select 0;
_vehicle = _this select 1;
_side = _this select 2;
_centre = [ _position, random 1 , random 360 ] call BIS_fnc_relPos;
_centre2 = [ _position, random 30 , random 360 ] call BIS_fnc_relPos;
_spawn_area = [];
_spawn_area2 = [];
_max_distance = 50;
_min_distance_items = 5;
_max_distance_items = 20;

if (isDedicated) exitWith {};

// BLUFOR SPAWNS
if (_side == west) then {
	
	// SPAWN BLUFOR VEHICLE
	//while{ count _spawn_area < 1} do
	//	{
	//	    _spawn_area = _centre findEmptyPosition[ 10 , _max_distance , _vehicle ];
	//	    _max_distance = _max_distance + 10;
	//	};



	// REMOVE SPAWN ACTIONS
	
	if (_vehicle == "Leopard_2A6_Fleck" || _vehicle == "Leopard_2A6_Tarn" || _vehicle == "B_MBT_01_TUSK_F" || _vehicle == "rhsusf_m113d_usarmy") exitWith {
		player removeAction createVehicleMBT;
		while{ count _spawn_area < 1} do {
	
		_spawn_area = [_centre,_max_distance] call get_vec_spawn_point;
		sleep 0.04;
		_max_distance = _max_distance + 10;
		};
	
		_blufor_vehicle = _vehicle createVehicle (_spawn_area select 0);
		
		if (!IS_VANILLA) then {
			[localize "str_GRAD_vehicleSpawned"] call EFUNC(common,displayTextStructured);
		} else {
			hintSilent format [localize "str_GRAD_vehicleSpawned"];
		};
		sleep 1;
		_blufor_vehicle disableTIEquipment true;
		[blufor_teamlead, _blufor_vehicle, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
		[[[_spawn_area select 0,_side,2],"mission_setup\vehiclespawn_marker.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
		};

	
	
	player removeAction createVehicleHEMTT;
	player removeAction createVehicleLittlebird;
	while{ count _spawn_area < 1} do {
	
		_spawn_area = [_centre,_max_distance] call get_vec_spawn_point;
		sleep 0.04;
		_max_distance = _max_distance + 10;
	};
	
	_blufor_vehicle = _vehicle createVehicle (_spawn_area select 0);

	if (!IS_VANILLA) then {
			[localize "str_GRAD_vehicleSpawned"] call EFUNC(common,displayTextStructured);
		} else {
			hintSilent format [localize "str_GRAD_vehicleSpawned"];
		};

	[[[_spawn_area select 0,_side,1],"mission_setup\vehiclespawn_marker.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
	sleep 1;
	[blufor_teamlead, _blufor_vehicle, true] call ACE_VehicleLock_fnc_addKeyForVehicle;

	
	
};


// OPFOR SPAWNS
if (_side == east) then {
	
	// SPAWN MORTAR
	if (_vehicle == "O_G_Mortar_01_F") exitWith {
		player removeAction createVehicleTransport; 
		player removeAction createVehicleTactical;
		player removeAction createVehicleMortar;
		while{ count _spawn_area2 < 1} do {
		
		_spawn_area2 = [_centre2,_max_distance] call get_vec_spawn_point;
		sleep 0.04;
		_max_distance = _max_distance + 10;
		};
		[[[_spawn_area2 select 0,_side,1],"mission_setup\vehiclespawn_marker.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
		opfor_vehicle = _vehicle createVehicle (_spawn_area2 select 0);
		opfor_vehicle setVehicleAmmo 0.1;
		if (!IS_VANILLA) then {
			[localize "str_GRAD_mortarSpawned"] call EFUNC(common,displayTextStructured);
		} else {
			hintSilent format [localize "str_GRAD_mortarSpawned"];
		};
		
		
	};

	if (_vehicle == "box_nato_wpslaunch_f") exitWith {
		player removeAction createVehicleAt4Box;
		while{ count _spawn_area < 1} do {
		_spawn_area = [_centre,_max_distance] call get_vec_spawn_point;
		sleep 0.04;
		_max_distance = _max_distance + 10;
		};
		
		opfor_box = _vehicle createVehicle (_spawn_area select 0);

		clearWeaponCargoGlobal opfor_box; 
		clearItemCargoGlobal opfor_box; 
		clearMagazineCargoGlobal opfor_box; 
		clearBackpackCargoGlobal opfor_box;
		sleep 0.1;
		
		if (!IS_VANILLA) then {} 
			else {
			opfor_box addweaponcargoglobal ["launch_RPG32_F", 4];
			opfor_box addmagazinecargoglobal ["RPG32_F", 8];
			opfor_box addmagazinecargoglobal ["RPG32_HE_F", 4];
			opfor_box addmagazinecargoglobal ["IEDUrbanSmall_Remote_Mag", 3];
			opfor_box addmagazinecargoglobal ["IEDLandSmall_Remote_Mag", 3];
		};
		
		
		if (!IS_VANILLA) then {
			[localize "str_GRAD_at4Spawned"] call EFUNC(common,displayTextStructured);
		} else {
			hintSilent format [localize "str_GRAD_at4Spawned"];
		};
		
		

		
		

		[[[_spawn_area select 0,_side,2],"mission_setup\vehiclespawn_marker.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
	};

	

	player removeAction createVehicleTransport; 
	player removeAction createVehicleTactical;
	player removeAction createVehicleMortar;
	// SPAWN ANY OTHER OPFOR VEHICLE
	while {count _spawn_area < 1} do {
		
		_spawn_area = [_centre,_max_distance] call get_vec_spawn_point;
		sleep 0.04;
		_max_distance = _max_distance + 10;
		};
		[[[_spawn_area select 0,_side,1],"mission_setup\vehiclespawn_marker.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
		opfor_vehicle = _vehicle createVehicle (_spawn_area select 0);
	sleep 1;
	[opfor_teamlead, opfor_vehicle, true] call ACE_VehicleLock_fnc_addKeyForVehicle;

	// SET FUEL TO ZERO

	

	if (!IS_VANILLA) then {
			[localize "str_GRAD_vehicleSpawned"] call EFUNC(common,displayTextStructured);
		} else {
			hintSilent format [localize "str_GRAD_vehicleSpawned"];
	};
	
};