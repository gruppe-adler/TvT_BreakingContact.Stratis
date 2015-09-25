#include "\z\ace\addons\main\script_component.hpp"
#include "..\missionMacros.h"

cutText ["", "PLAIN", 0];

if (player == opfor_teamlead) then {
	[
		"teleportClickOpf",
		"onMapSingleClick",
		{
			debugLog("opfor lead clicked on map");
			try {
				_pos call checkWater;
				["teleportClickOpf", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
				_pos call opforTeleporting;
				openMap [false,false];
			} catch {
				hint str _exception;
			};
		}
	] call BIS_fnc_addStackedEventHandler ;
};

if (player == blufor_teamlead) then {
	[
		"teleportClickBlu",
		"onMapSingleClick",
		{
			try {
				if (OPFOR_TELEPORT_TARGET select 0 == 0) then { throw "opfor not yet teleported" };
				_pos call checkWater;
				["teleportClickBlu", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
				_pos call bluforTeleporting;
				openMap [false,false];
			} catch {
				hint str _exception;
			};
		}
	] call BIS_fnc_addStackedEventHandler;
};

checkWater = {
	if (surfaceIsWater _this) then {
		throw (str _pos) + " is covered in water :("; // localize "str_GRAD_spawn_on_water" // [] call EFUNC(common,displayTextStructured);
	};
};


opforTeleporting = {
	OPFOR_TELEPORT_TARGET = _this;
	publicVariableServer "OPFOR_TELEPORT_TARGET";
	debugLog("opfor published target");
};

bluforTeleporting = {
	closeDialog 0;

	BLUFOR_TELEPORT_TARGET = TRUE; publicVariableServer "BLUFOR_TELEPORT_TARGET";

	// entfernung marker zu spawnpunkt zu klein oder groß?
	_distance = _this distance (getMarkerPos "opfor_marker");
	if (_distance < MINIMAL_BLUFOR_SPAWN_DISTANCE) exitWith {hintSilent format [localize "str_GRAD_spawnTooClose1" + '(%1 m).' + localize "str_GRAD_spawnTooClose2" + ' %2.', floor(_distance), MINIMAL_BLUFOR_SPAWN_DISTANCE];
	player execVM "mission_setup\teleport.sqf";};
	if (_distance > MAXIMAL_BLUFOR_SPAWN_DISTANCE) exitWith {hintSilent format [localize "str_GRAD_spawnTooFar1" + '(%1 m).' + localize "str_GRAD_spawnTooFar2" + ' %2.', floor(_distance), MAXIMAL_BLUFOR_SPAWN_DISTANCE];
	player execVM "mission_setup\teleport.sqf";
	};

	// teleport und gucken, ob posi frei ist
	[[[west,_this],"mission_setup\teleportEffect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

};


