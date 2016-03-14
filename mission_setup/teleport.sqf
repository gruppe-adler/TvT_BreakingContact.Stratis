#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"

checkWater = {
	if (surfaceIsWater _this) then {
		_string = localize "str_GRAD_spawn_on_water";
		[_string] call EFUNC(common,displayTextStructured); // 
	};
};

if (str player == "opfor_teamlead") then {
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
};

if (str player == "blufor_teamlead") then {
	[
		"teleportClickBlu",
		"onMapSingleClick",
		{
			try {
				if (OPFOR_TELEPORT_TARGET select 0 == 0) then { throw "opfor not yet teleported" };

				["teleportClickBlu", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

				//_pos call bluforTeleporting;
			} catch {
				hint str _exception;
			};
		}
	] call BIS_fnc_addStackedEventHandler;
};

opforTeleporting = {
	OPFOR_TELEPORT_TARGET = _this;
	publicVariableServer "OPFOR_TELEPORT_TARGET";
	debugLog("opfor published target");

	OPFOR_TELEPORTED = true;
	publicVariable "OPFOR_TELEPORTED";
};

bluforTeleporting = {

	BLUFOR_TELEPORT_TARGET = _this;
	publicVariableServer "BLUFOR_TELEPORT_TARGET";

	BLUFOR_TELEPORTED = true;
	publicVariable "BLUFOR_TELEPORTED";
};


