#include "\z\ace\addons\main\script_component.hpp"

spawnpoint_mapclick = [];

if (player == opfor_teamlead && !OPFOR_TELEPORTED) then {
if (!IS_VANILLA) then {
	[localize "str_GRAD_choose_spawn_location"] call EFUNC(common,displayTextStructured);
	} else {
	hintSilent format [localize "str_GRAD_choose_spawn_location"];
};
openMap [true,false];

onMapSingleClick "[_pos] call teleportGroup; onMapSingleClick ''; true";
};

if (player == blufor_teamlead && OPFOR_TELEPORTED) then {
if (!IS_VANILLA) then {
	[localize "str_GRAD_choose_spawn_location"] call EFUNC(common,displayTextStructured);
	} else {
	hintSilent format [localize "str_GRAD_choose_spawn_location"];
};
openMap [true,false];

onMapSingleClick "[_pos] call teleportGroup; onMapSingleClick ''; true";
};


teleportGroup = {
openMap [false,false];
	spawnpoint_mapclick = _this select 0;

	if (surfaceIsWater [(spawnpoint_mapclick select 0),(spawnpoint_mapclick select 1)]) exitWith {
       
       if (!IS_VANILLA) then {
		[localize "str_GRAD_spawn_on_water"] call EFUNC(common,displayTextStructured);
		} else {
		hintSilent format [localize "str_GRAD_spawn_on_water"];
		};
   	};

	// doesnt work correctly in SP tests
	[[[spawnpoint_mapclick],"mission_setup\createMarkerBlufor.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

	if (player == opfor_teamlead && !OPFOR_TELEPORTED) then {
		OPFOR_TELEPORTED = TRUE;
		publicVariable "OPFOR_TELEPORTED";

		[[[east,spawnpoint_mapclick],"mission_setup\teleportEffect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

		_opfor_marker = createMarker ["opfor_marker", spawnpoint_mapclick];
		_opfor_marker setMarkerType "hd_objective";
		_opfor_marker setMarkerColor "ColorWEST";
		// with sector module, marker is only needed for getting position
		_opfor_marker setMarkerAlpha 0;

		

		[arsenal_opfor, spawnpoint_mapclick] execVM "mission_setup\teleportUnitToEmptySpot.sqf";
		//[extraweapons_opfor, spawnpoint_mapclick] execVM "mission_setup\teleportUnitToEmptySpot.sqf";

		// move task to new destination
		sector_trigger setPos spawnpoint_mapclick;
		//["sector_moduleWEST", spawnpoint_mapclick] call BIS_fnc_taskSetDestination;

		[[[spawnpoint_mapclick],"mission_setup\respawn_helper.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

		//choose_vehicle_opfor = opfor_teamlead addAction["<t color=""#93E352"">" + localize "str_GRAD_choose_vehicle",{[[[choose_vehicle_opfor], "mission_setup\choose_vehicle.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;  }, _Args, 1, false, false, "","_this == _target && BLUFOR_TELEPORTED && OPFOR_TELEPORTED"];
		choose_vehicle_opfor = opfor_teamlead addAction["<t color=""#93E352"">" + localize "str_GRAD_choose_vehicle",{nul = [choose_vehicle_opfor] execVM "mission_setup\choose_vehicle.sqf"}, _Args, 1, false, false, "","_this == _target && BLUFOR_TELEPORTED && OPFOR_TELEPORTED"];
	};

	if (player == blufor_teamlead && OPFOR_TELEPORTED) then {
		openMap [false,false];
		
		BLUFOR_TELEPORTED = TRUE;
		publicVariable "BLUFOR_TELEPORTED";

		// entfernung marker zu spawnpunkt zu klein oder groß?
		// pos ist hier ein anderes pos als oben!
		_distance = spawnpoint_mapclick distance (getMarkerPos "opfor_marker");
		if (_distance < MINIMAL_BLUFOR_SPAWN_DISTANCE) exitWith {hintSilent format [localize "str_GRAD_spawnTooClose1" + '(%1 m).' + localize "str_GRAD_spawnTooClose2" + ' %2.', floor(_distance), MINIMAL_BLUFOR_SPAWN_DISTANCE];
		player execVM "mission_setup\teleport.sqf";};
		if (_distance > MAXIMAL_BLUFOR_SPAWN_DISTANCE) exitWith {hintSilent format [localize "str_GRAD_spawnTooFar1" + '(%1 m).' + localize "str_GRAD_spawnTooFar2" + ' %2.', floor(_distance), MAXIMAL_BLUFOR_SPAWN_DISTANCE];
		player execVM "mission_setup\teleport.sqf";
		};



		// teleport und gucken, ob posi frei ist
		[[[west,spawnpoint_mapclick],"mission_setup\teleportEffect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

		
		_spawn_area = [spawnpoint_mapclick,40,"Land_Cargo_House_V1_F"] call findSimplePos;

		[arsenal_blufor, spawnpoint_mapclick] execVM "mission_setup\teleportUnitToEmptySpot.sqf";

		switch (OPFORCE) do {
		case 3: {
			
			};
		default {};
		};

		// create base building for blufor
		_baseBuilding = "Land_Cargo_House_V1_F" createVehicle _spawn_area;
		_baseBuilding addAction["<t color=""#ff0000"">" + localize "str_GRAD_declareFailedBlufor",{BLUFOR_SURRENDERED = true; publicVariable "BLUFOR_SURRENDERED";}, _Args, 1, false, false, "","side _this == west && !BLUFOR_SURRENDERED"];

		//choose_vehicle_blufor = blufor_teamlead addAction["<t color=""#93E352"">" + localize "str_GRAD_choose_blufor_vehicle",{[[[choose_vehicle_blufor], "mission_setup\choose_vehicle.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;  }, _Args, 1, false, false, "","_this == _target && BLUFOR_TELEPORTED && OPFOR_TELEPORTED"];
		choose_vehicle_blufor = blufor_teamlead addAction["<t color=""#93E352"">" + localize "str_GRAD_choose_vehicle",{nul = [choose_vehicle_blufor] execVM "mission_setup\choose_vehicle.sqf"}, _Args, 1, false, false, "","_this == _target && BLUFOR_TELEPORTED && OPFOR_TELEPORTED"];

		//[[[],"after_action_reporter_pimped\movement.sqf",nil,false],"BIS_fnc_execVM",true,false] spawn BIS_fnc_MP;
		[[[spawnpoint_mapclick],"mission_setup\blufor_spawn_marker.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
	};
};
