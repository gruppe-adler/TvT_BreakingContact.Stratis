#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"

checkWater = {
	if (surfaceIsWater _this) then {
		_string = localize "str_GRAD_spawn_on_water";
		[_string] call EFUNC(common,displayTextStructured); // 
	};
};

opforTeleporting = {
	OPFOR_TELEPORT_TARGET = _this;
	publicVariableServer "OPFOR_TELEPORT_TARGET";
	debugLog("opfor published target");

	OPFOR_TELEPORTED = true;
	publicVariable "OPFOR_TELEPORTED";
};

// executed on player only anyway?!
// if (player == opfor_teamlead) then {

	[
		"teleportClickOpf",
		"onMapSingleClick",
		{
			debugLog("opfor lead clicked on map");
			try {
				_pos call checkWater;
				["teleportClickOpf", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
				_pos call opforTeleporting;
			} catch {
				hint str _exception;
			};
		}
	] call BIS_fnc_addStackedEventHandler;
// };