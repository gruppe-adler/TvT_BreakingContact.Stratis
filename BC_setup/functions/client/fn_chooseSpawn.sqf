#include "\z\ace\addons\main\script_component.hpp"
#include "..\..\..\missionMacros.h"

if (player getVariable ["BC_choosingSpawn", false]) exitWith {
	diag_log "BC: preventing double execution of chooseSpawn";
};

player linkitem 'itemMap';
player setVariable ["BC_choosingSpawn", true];

private _handle = addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];

	if ([_pos] call BC_setup_fnc_isOnWater) exitWith {};
		[_pos] remoteExec ["BC_setup_fnc_publishOpforTeleportTarget", 2];
		playSound ['click', true];
		["Preparing Spawn..."] call EFUNC(common,displayTextStructured);

		removeMissionEventhandler ["MapSingleClick", _thisEventHandler];
		player setVariable ["BC_choosingSpawn", false];
}];


if (DEBUG_MODE) then {
	private _road = [[worldSize/2, worldSize/2], 500, []] call BIS_fnc_nearestRoad;
	if (!isNull _road) then {
		_pos = getPos _road;
		[_pos] remoteExec ["BC_setup_fnc_publishOpforTeleportTarget", 2];
		["teleportClickOpf", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	};
};


/*
	
	addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];

	if (_pos call BC_setup_fnc_isOnWater) exitWith {};
			["teleportClickOpf", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
			[_pos] remoteExec ["BC_setup_fnc_publishOpforTeleportTarget", [0,-2] select isDedicated];
			playSound ['click', true];
			["Preparing Spawn..."] call EFUNC(common,displayTextStructured);


	}];

*/