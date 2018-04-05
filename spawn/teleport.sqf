#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"

[
	"teleportClickOpf",
	"onMapSingleClick",
	{
		debugLog("opfor lead clicked on map");
		try {
			if (_pos call BC_setup_fnc_isOnWater) exitWith {};
			["teleportClickOpf", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
			[_pos] remoteExec ["BC_setup_fnc_publishOpforTeleportTarget", [0,-2] select isDedicated];
			playSound ['click', true];
			["Preparing Spawn..."] call EFUNC(common,displayTextStructured);
		} catch {
			hint str _exception;
		};
	}
] call BIS_fnc_addStackedEventHandler;


if (DEBUG_MODE) then {
	private _road = [[worldSize/2, worldSize/2], 500, []] call BIS_fnc_nearestRoad;
	if (!isNull _road) then {
		_pos = getPos _road;
		[_pos] remoteExec ["BC_setup_fnc_publishOpforTeleportTarget", [0,-2] select isDedicated];
		["teleportClickOpf", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	};
};
