#include "\z\ace\addons\main\script_component.hpp"


_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");

["Suche Startpositionen..."] call EFUNC(common,displayTextStructured);


// northwest = [270,0]
// southeast = [90,180]
// northeast = [0,90]
// southwest = [180,270]
/*
_vector = [0,0];
if (CRASH_SITE select 0 > _size/2 && CRASH_SITE select 1 > _size/2) then { _vector = [270,0]; };
if (CRASH_SITE select 0 < _size/2 && CRASH_SITE select 1 > _size/2) then { _vector = [0,90]; };
if (CRASH_SITE select 0 < _size/2 && CRASH_SITE select 1 < _size/2) then { _vector = [90,180]; };
if (CRASH_SITE select 0 > _size/2 && CRASH_SITE select 1 < _size/2) then { _vector = [180,270]; };
*/




findRussianSpawnPos = {

	westSpawnPosition = [] call selectSpawnMarkerRussian;
	["westSpawnPosition gefunden."] call EFUNC(common,displayTextStructured);

	if (DEBUG) then { diag_log format ["westSpawnPosition is %1",westSpawnPosition]; };

	[west, westSpawnPosition] call BIS_fnc_addRespawnPosition;
	[westSpawnPosition] call findRussianHQPos;

	// fallback
	"respawn_west" setMarkerPos [westSpawnPosition select 0, westSpawnPosition select 1];
	
};


findRussianHQPos = {
	
	_center = _this select 0;

	westHQSpawnPos = [_center,2,40] call findSpawnPos;

	if (DEBUG) then { diag_log format ["westHQSpawnPos %1 found", westHQSpawnPos]; };

	["westHQSpawnPos gefunden."] call EFUNC(common,displayTextStructured);

	if (DEBUG) then { diag_log format ["West Spawn position %1 found", westHQSpawnPos]; };


	// trigger for pilot rescue area moved to right position
	trg_pilots_rescued setPos westHQSpawnPos;

	_barracks = createVehicle ["TK_WarfareBBarracks_Base_EP1", westHQSpawnPos, [], 0, "NONE"];
	_veh2 = createVehicle ["FLAG_RED_F",  [westHQSpawnPos select 0, (westHQSpawnPos select 1) + 5,0], [], 0, "CAN_COLLIDE"];

	_rusActionHelper = createVehicle ["Land_SatellitePhone_F", [getPos _barracks select 0, getPos _barracks select 1, 1.5], [], 0, "NONE"];
	_rusActionHelper attachTo [_barracks, [-1,0,1.5]];
	_rusActionHelper setVectorDirAndUp [[1,0,0],[0,0,1]];
	sleep 0.01;
	_rusActionHelper setVectorDirAndUp [[1,0,0],[0,0,1]];

	 _rusGrasscutter = createVehicle ["Land_ClutterCutter_large_F", westHQSpawnPos, [], 0, "CAN_COLLIDE"];

	[[_rusActionHelper,"<t color=""#93E352"">Nachschub anfordern</t>",{0 = createDialog "russianSupplyGUI"; [russianSupplies, false, 0, "","",""] call refreshRussianUI;}],"addactionMP",nil,false] spawn BIS_fnc_MP;

	russianSpawnPos = [westHQSpawnPos,2,50] call findSpawnPos;

	waitUntil {
	  count russianSpawnPos > 0
	};

	["russianSpawnPos gefunden."] call EFUNC(common,displayTextStructured);


	publicVariable "russianSpawnPos";

	_helipad = createVehicle ["Land_HelipadCivil_F", russianSpawnPos, [], 0, "NONE"];

	if (DEBUG) then { diag_log format ["findRussianHQPos done, russianSpawnPos is %1", russianSpawnPos]; };

	eastSpawnPosition = [westHQSpawnPos] call selectSpawnMarkerMudschahedin;

};




findMudschahedinSpawnPos = {


	["eastSpawnPosition gefunden."] call EFUNC(common,displayTextStructured);
	[east, eastSpawnPosition] call BIS_fnc_addRespawnPosition;

	if (DEBUG) then { diag_log format ["eastSpawnPosition is %1",eastSpawnPosition]; };

	[eastSpawnPosition] call findMudschahedinHQPos;

	// fallback
	"respawn_east" setMarkerPos [eastSpawnPosition select 0, eastSpawnPosition select 1];	
};


//_necessaryRadius = [["TK_WarfareBBarracks_Base_EP1","FLAG_RED_F","Bunker_PMC"], true] call spf_createRelPos;

// add HQ objects
// find a random position in circle

findMudschahedinHQPos = {

	_centerEast = _this select 0;	
	// find a random position in circle
	_randomNearPosition = [_centerEast,[5,40], random 360] call SHK_pos;

	// find a free spot
	eastHQSpawnPos = [_randomNearPosition,2,50] call findSpawnPos;


	_muhaActionHelper = createVehicle ["Land_SatellitePhone_F", [eastHQSpawnPos select 0, (eastHQSpawnPos select 1) + 0.5, 0], [], 0, "NONE"];
	[[_muhaActionHelper,"<t color=""#93E352"">Nachschub anfordern</t>",{0 = createDialog "mudschahedinSupplyGUI"; [mudschahedinSupplies, false, 0, "","",""] call refreshMudschahedinUI;}],"addactionMP",nil,false] spawn BIS_fnc_MP;
	//_muhaSupplyAction = _muhaActionHelper addAction["<t color=""#93E352"">Nachschub anfordern</t>",{0 = createDialog "mudschahedinSupplyGUI"; [mudschahedinSupplies, false, 0, "","",""] call refreshMudschahedinUI; }, _Args, 1, true, true, "","_target distance _this < 6"];

	mudschahedinSpawnPos = eastHQSpawnPos;
	publicVariable "mudschahedinSpawnPos";

	_muhaGrasscutter = createVehicle ["Land_ClutterCutter_large_F", eastHQSpawnPos, [], 0, "CAN_COLLIDE"];

	["eastHQSpawnPos gefunden."] call EFUNC(common,displayTextStructured);
	if (DEBUG) then { diag_log format ["east spawn position %1 found", eastHQSpawnPos]; };

	publicVariable "eastHQSpawnPos";


	_fire = createVehicle ["Land_Campfire_F", eastHQSpawnPos, [], 5, "NONE"];
	_fire setPos (getPos _fire);
	_tent1 = createVehicle ["Land_TentA_F", eastHQSpawnPos, [], 15, "NONE"];
	_tent1 setPos (getPos _tent1);
	_tent1 setDir (([_tent1, _fire] call BIS_fnc_relativeDirTo)-180);
	_tent2 = createVehicle ["Land_TentA_F", eastHQSpawnPos, [], 15, "NONE"];
	_tent2 setPos (getPos _tent2);
	_tent2 setDir (([_tent2, _fire] call BIS_fnc_relativeDirTo)-180);
	_tent3 = createVehicle ["Land_TentA_F", eastHQSpawnPos, [], 15, "NONE"];
	_tent3 setPos (getPos _tent3);
	_tent3 setDir (([_tent3, _fire] call BIS_fnc_relativeDirTo)-180);
	_tent4 = createVehicle ["Land_TentA_F", eastHQSpawnPos, [], 15, "NONE"];
	_tent4 setPos (getPos _tent4);
	_tent4 setDir (([_tent4, _fire] call BIS_fnc_relativeDirTo)-180);
};





[] call findRussianSpawnPos;
[] call findMudschahedinSpawnPos;



null = [{[westHQSpawnPos,eastHQSpawnPos] execVM "helpers\createDebugMarker.sqf";}, "BIS_fnc_spawn", true, true] spawn BIS_fnc_MP;

["Missions-Setup abgeschlossen."] call EFUNC(common,displayTextStructured);

SETUP_DONE = true;
publicVariable "SETUP_DONE";


// create more positions just to show its working
/*
if (DEBUG) then {

	0 = [] execVM "spawn\addRespawnPositions.sqf";
	sleep 5;
};
*/