#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"

checkWater = {
	_return = false;
	if (surfaceIsWater _this) then {
		_string = localize "str_GRAD_spawn_on_water";
		[_string] call EFUNC(common,displayTextStructured); //
		_return = true;
	};
	_return
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
				if !(_pos call checkWater) exitWith {};
				["teleportClickOpf", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
				_pos call opforTeleporting;
				playSound ['click', true];
				["Preparing Spawn..."] call EFUNC(common,displayTextStructured);
			} catch {
				hint str _exception;
			};
		}
	] call BIS_fnc_addStackedEventHandler;
// };
