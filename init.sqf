#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

DEBUG_MODE = true;

// islandconfig must be before initgui!
call compile preprocessFile "islandConfig.sqf";
[] execVM "spawn\initGUI.sqf";

// read parameters
TIME_OF_DAY = paramsArray select 0;
WEATHER_SETTING = paramsArray select 1;
BLUFOR_SPAWN_DISTANCE = (paramsArray select 2) * 2;
OPFOR_MONEY = paramsArray select 3;
BLUFOR_MONEY = paramsArray select 4;
POINTS_NEEDED_FOR_VICTORY = paramsArray select 5;
TIME_ACCELERATION = paramsArray select 6;
AR3PLAY_ENABLE_REPLAY = (paramsArray select 7) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 8) == 1;
custom_overcast = 1;

// optimize for PVP
disableRemoteSensors true;

setCustomWeather = {
	skipTime -24; 86400 setOvercast (_this select 0); skipTime 24;
};

switch (WEATHER_SETTING) do {
	case 0: {[0] call setCustomWeather;};
	case 1: {[0.4] call setCustomWeather;};
	case 2: {[1] call setCustomWeather;};
	case 3: {[random 1] call setCustomWeather;};
	default {[random 1] call setCustomWeather;};
};


if (!isMultiplayer) then { // Editor
	{_x disableAI "MOVE"} forEach allUnits;
};

// set to full moon date
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


	_playercount = count allPlayers;
	_bonusPerPlayer = _playercount * 100;

	russianCredits = OPFOR_MONEY + _bonusPerPlayer;
	USCredits = BLUFOR_MONEY + _bonusPerPlayer;

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
diag_log format ["setup: server done"];

clearInventory = compile preprocessFile "helpers\clearInventory.sqf";
spawnStuff = compile preprocessFile "helpers\spawnStuff.sqf";
//SHK POS
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
// findsimplePos
call compile preprocessfile "helpers\findSimplePos.sqf";
call compile preprocessfile "helpers\findBluforPos.sqf";

If(isNil "spawn_help_fnc_compiled") then { call compile preprocessFileLineNumbers "helpers\findPos.sqf"; }; // TODO why the if condition here?

diag_log format ["setup: clientandserver done"];

if (hasInterface) then {

	checkJIP = {
		if ((OPFOR_TELEPORT_TARGET select 0 != 0) && didJIP) then {
			forcerespawn player;
		} else {
			[] spawn checkSpawnButton;
		};
	};

	

	checkSpawnButton = {
		waitUntil {!dialog && !visibleMap};
		if (BLUFOR_TELEPORTED) exitWith {};
		0 = [playerside] execVM "spawn\checkIfSpawned.sqf";
	};

	createStartHints = {
		[] call checkJIP;
	};

	enableSentences false;

	
	[] execVM "player\intro.sqf"; diag_log format ["setup: intro initiated"];

	[] execVM "player\setup\helpBriefing.sqf"; diag_log format ["setup: briefing initiated"];

	[] execVM "player\setup\adjustInitialSpawnPosition.sqf"; diag_log format ["setup: initial spawn position initiated"];

	
	[] execVM "player\allXXXSurrenderedListener.sqf"; diag_log format ["setup: surrenderlistener initiated"];
	[player] execVM "loadouts\_client.sqf"; diag_log format ["setup: loadouts initiated"];

	[] execVM "spawn\addBuyInteraction.sqf";
	
	if (playerSide == west) then {
		[] execVM "player\russianMarker.sqf"; 
		[] execVM "player\bluforOpforTeleportListener.sqf";
		[] execVM "player\bluforBluforTeleportListener.sqf";
		[] execVM "player\bluforRussianPointsListener.sqf";
		[] spawn createStartHints;
		
	};

	if (playerSide == east) then {
		[] execVM "player\russianMarker.sqf"; diag_log format ["setup: russianmarker initiated"];
		[] execVM "player\opforBluforTeleportListener.sqf"; diag_log format ["setup: opforBluforTeleportListener initiated"];
		[] execVM "player\opforOpforTeleportListener.sqf"; diag_log format ["setup: opforOpforTeleportListener initiated"];
		[] spawn createStartHints; diag_log format ["setup: createStartHints initiated"];
		
		
	};
	waitUntil {!isNull player};
};