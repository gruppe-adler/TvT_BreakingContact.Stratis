#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

DEBUG_MODE = true;

[] execVM "spawn\gui\initGUI.sqf";

TIME_OF_DAY = paramsArray select 0;
WEATHER_SETTING = paramsArray select 1;
MINIMAL_BLUFOR_SPAWN_DISTANCE = paramsArray select 2;
MAXIMAL_BLUFOR_SPAWN_DISTANCE = paramsArray select 3;
TIME_ACCELERATION = paramsArray select 4;
POINTS_NEEDED_FOR_VICTORY = paramsArray select 5;
AR3PLAY_ENABLE_REPLAY = (paramsArray select 6) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 7) == 1;

if (!isMultiplayer) then { // Editor
	{_x disableAI "MOVE"} forEach allUnits;
};

if (isServer) then {
	setDate [2015, 2, 2, TIME_OF_DAY, 1];
	setTimeMultiplier TIME_ACCELERATION;

	BLUFOR_ELIMINATED = false;
	publicVariable "BLUFOR_ELIMINATED";
	OPFOR_ELIMINATED = false;
	publicVariable "OPFOR_ELIMINATED";

	BLUFOR_CAPTURED = false;
	publicVariable "BLUFOR_CAPTURED";
	BLUFOR_SURRENDERED = false;
	publicVariable "BLUFOR_SURRENDERED";

	SPECTATOR_LIST = [];
	publicVariable "SPECTATOR_LIST";
	RUSSIAN_MARKER_HIDDEN = true;
	publicVariable "RUSSIAN_MARKER_HIDDEN";

	RUSSIAN_MARKER_POS = [0,0];
	publicVariable "RUSSIAN_MARKER_POS";
	RUSSIAN_POINTS = 0;
	publicVariable "RUSSIAN_POINTS";
	OPFOR_TELEPORT_TARGET = [0, 0];
	publicVariable "OPFOR_TELEPORT_TARGET";
	BLUFOR_TELEPORT_TARGET = [0, 0];
	publicVariable "BLUFOR_TELEPORT_TARGET";

	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};
	[] execVM "objectives\detect_all_dead.sqf";
 	[] execVM "helpers\medical_settings.sqf";

 	// events/listeners
	[] execVM "server\russianMarker.sqf";
 	[] execVM "server\teleportListener.sqf";
};

clearInventory = compile preprocessFile "helpers\clearInventory.sqf";
spawnStuff = compile preprocessFile "helpers\spawnStuff.sqf";
call compile preprocessFile "islandConfig.sqf";
//SHK POS
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
// findsimplePos
call compile preprocessfile "helpers\findSimplePos.sqf";

If(isNil "spawn_help_fnc_compiled") then { call compile preprocessFileLineNumbers "helpers\findPos.sqf"; }; // TODO why the if condition here?

if (hasInterface) then {

	createSpawnButton = {
		waitUntil {time > 1};
		0 = createDialog _this;
	};

	enableSentences false;

	[] execVM "player\intro.sqf";
	[] execVM "player\setup\helpBriefing.sqf";
	[] execVM "player\setup\adjustInitialSpawnPosition.sqf";
	[] execVM "player\allXXXSurrenderedListener.sqf";
	[player] execVM "loadouts\_client.sqf";

	if (playerSide == west) then {
		[] execVM "player\russianMarker.sqf";
		[] execVM "player\bluforOpforTeleportListener.sqf";
		[] execVM "player\bluforBluforTeleportListener.sqf";
		[] execVM "player\bluforRussianPointsListener.sqf";
		if (player == blufor_teamlead) then {
			"gui_spawn_blufor" call createSpawnButton;
		};
	};

	if (playerSide == east) then {
		[] execVM "player\opforBluforTeleportListener.sqf";
		[] execVM "player\opforOpforTeleportListener.sqf";
		if (player == opfor_teamlead) then {
			"gui_spawn_opfor" spawn createSpawnButton;
		};
	};
};
