#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

DEBUG_MODE = true;

[] execVM "spawn\initGUI.sqf";

TIME_OF_DAY = paramsArray select 0;
WEATHER_SETTING = paramsArray select 1;
MINIMAL_BLUFOR_SPAWN_DISTANCE = paramsArray select 2;
MAXIMAL_BLUFOR_SPAWN_DISTANCE = paramsArray select 3;
TIME_ACCELERATION = paramsArray select 4;
POINTS_NEEDED_FOR_VICTORY = paramsArray select 5;
AR3PLAY_ENABLE_REPLAY = (paramsArray select 6) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 7) == 1;
custom_overcast = 1;

setCustomWeather = {
	skipTime -24; 86400 setOvercast (_this select 0); skipTime 24;
};
/*
switch (WEATHER_SETTING) do {
	case 0: {[0] call setCustomWeather;};
	case 1: {[0.5] call setCustomWeather;};
	case 2: {[1] call setCustomWeather;};
	case 3: {[random 1] call setCustomWeather;};
	default {[random 1] call setCustomWeather;};
};*/


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

	VEHICLE_ORDERED_WEST = [false,0];
	publicVariable "VEHICLE_ORDERED_WEST";
	VEHICLE_ORDERED_EAST = [false,0];
	publicVariable "VEHICLE_ORDERED_EAST";

	OPFOR_TELEPORTED = false;
	publicVariable "OPFOR_TELEPORTED";
	BLUFOR_TELEPORTED = false;
	publicVariable "BLUFOR_TELEPORTED";


	//_playercount = count allPlayers;
	//_bonusPerPlayer = _playercount * 100;

	russianCredits = 5000; // + _bonusPerPlayer;
	USCredits = 5000; // + _bonusPerPlayer;

	0 = [russianCredits,USCredits] execVM "spawn\gui\addPublicVariableEventhandler.sqf";

	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};
	[] execVM "objectives\detect_all_dead.sqf";
 	[] execVM "helpers\medical_settings.sqf";

 	// events/listeners
	[] execVM "server\russianMarker.sqf";
 	[] execVM "server\teleportListener.sqf";

 	{if (!isPlayer _x) then {[_x] execVM "loadouts\_client.sqf";};} forEach allUnits;
 	
};


clearInventory = compile preprocessFile "helpers\clearInventory.sqf";
spawnStuff = compile preprocessFile "helpers\spawnStuff.sqf";
call compile preprocessFile "islandConfig.sqf";
//SHK POS
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
// findsimplePos
call compile preprocessfile "helpers\findSimplePos.sqf";
call compile preprocessfile "helpers\findBluforPos.sqf";

If(isNil "spawn_help_fnc_compiled") then { call compile preprocessFileLineNumbers "helpers\findPos.sqf"; }; // TODO why the if condition here?


if (hasInterface) then {

	checkSpawnButton = {
		[] spawn {
			waitUntil {!dialog && !visibleMap};
			0 = [playerside] execVM "spawn\checkIfSpawned.sqf";
		};
	};

	createSpawnButton = {
		waitUntil {!isNull player && time > 1};
		diag_log format ["createspawnbutton executed"];
		// [] call checkSpawnButton;
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
		//[] spawn createSpawnButton;
	};

	if (playerSide == east) then {
		[] execVM "player\russianMarker.sqf";
		[] execVM "player\opforBluforTeleportListener.sqf";
		[] execVM "player\opforOpforTeleportListener.sqf";
		//[] spawn createSpawnButton;
	};
};
