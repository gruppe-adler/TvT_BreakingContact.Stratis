#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

if (paramsArray select 9 == 1 || !isMultiplayer) then {
	DEBUG_MODE = true;
	[] execVM "bulletTracing.sqf";
} else {
	DEBUG_MODE = false;
};

// islandconfig must be before initgui!
call compile preprocessFile "islandConfig.sqf";
[] execVM "spawn\initGUI.sqf";

// read parameters
TIME_OF_DAY = paramsArray select 0;
WEATHER_SETTING = paramsArray select 1;
BLUFOR_SPAWN_DISTANCE = (paramsArray select 2);
OPFOR_MONEY = paramsArray select 3;
BLUFOR_MONEY = paramsArray select 4;
POINTS_NEEDED_FOR_VICTORY = paramsArray select 5;
TIME_ACCELERATION = paramsArray select 6;
AR3PLAY_ENABLE_REPLAY = (paramsArray select 7) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 8) == 1;
custom_overcast = 1;

jipTime = 600;

// optimize for PVP
disableRemoteSensors true;

setCustomWeather = {
	// skipTime -24; 
	0 setOvercast (_this select 0); 
	setViewDistance 7000;
	// skipTime 24;
};

switch (WEATHER_SETTING) do {
	case 0: {[0] call setCustomWeather;};
	case 1: {[0.4] call setCustomWeather;};
	case 2: {[1] call setCustomWeather;};
	case 3: {[random 1] call setCustomWeather;};
	default {[0] call setCustomWeather;};
};


if (!isMultiplayer) then { // Editor
	/* {_x disableAI "MOVE"} forEach allUnits;*/
};


if (isServer) then {
	// allow view distance to be up to 10k
	
	// set to full moon date
	setDate [2015, 2, 2, TIME_OF_DAY, 1];
	// set time acceleration
	setTimeMultiplier TIME_ACCELERATION;

	BLUFOR_ELIMINATED = false;
	publicVariable "BLUFOR_ELIMINATED";
	OPFOR_ELIMINATED = false;
	publicVariable "OPFOR_ELIMINATED";

	BLUFOR_CAPTURED = false;
	publicVariable "BLUFOR_CAPTURED";
	BLUFOR_SURRENDERED = false;
	publicVariable "BLUFOR_SURRENDERED";

	MISSION_COMPLETED = false;
	publicVariable "MISSION_COMPLETED";

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

[] execVM "CSSA3\CSSA3_init.sqf";
[] execVM "GRAD_replay\GRAD_replay_init.sqf";

clearInventory = compile preprocessFile "helpers\clearInventory.sqf";
spawnStuff = compile preprocessFile "helpers\spawnStuff.sqf";
//SHK POS
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
// findsimplePos
call compile preprocessFileLineNumbers "helpers\findSimplePos.sqf";
call compile preprocessFileLineNumbers "helpers\spawnBluforHQ.sqf";
// establishingShot = call compile preprocessFileLineNumbers "helpers\establishingShot.sqf";


If(isNil "spawn_help_fnc_compiled") then { call compile preprocessFileLineNumbers "helpers\findPos.sqf"; }; // TODO why the if condition here?

diag_log format ["setup: clientandserver done"];

if (hasInterface) then {



	checkJIP = {
		if ((OPFOR_TELEPORT_TARGET select 0 != 0) && didJIP && time > jipTime) then {
			player setDamage 1;
			["forced"] spawn CSSA3_fnc_createSpectateDialog;
		} else {
			[] spawn checkSpawnButton;
		};
	};


	checkSpawnButton = {
		// waitUntil {!dialog && !visibleMap};
		if (didJIP) exitWith {};
		if (player != opfor_teamlead) then {
			0 = [[worldSize/2,worldSize/2,0],"Breaking Contact - Waiting for Spawn."] execVM "helpers\establishingShot.sqf";
		} else {
		disableSerialization;
		waitUntil {!(isNull ([] call BIS_fnc_displayMission))};
			cheffeKeyEH = ([] call BIS_fnc_displayMission) displayAddEventHandler [
				"KeyDown",
				format ["	
						if (OPFOR_TELEPORT_TARGET select 0 != 0) then {
							([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];
							
							playSound ['click', true];

						};

						if (_this select 1 != 1) then {0 = createDialog 'gui_spawn_opfor'; true};
					"]
			];
			0 = createDialog "gui_spawn_opfor";
			waitUntil {(OPFOR_TELEPORT_TARGET select 0 != 0)};
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];
		};
		
		// if (BLUFOR_TELEPORTED) exitWith {};
		// 0 = [playerside] execVM "spawn\checkIfSpawned.sqf";
	};

	
	

	enableSentences false;

	
	[] execVM "player\intro.sqf"; diag_log format ["setup: intro initiated"];

	[] execVM "player\setup\helpBriefing.sqf"; diag_log format ["setup: briefing initiated"];

	[] execVM "player\setup\adjustInitialSpawnPosition.sqf"; diag_log format ["setup: initial spawn position initiated"];

	
	[] execVM "player\allXXXSurrenderedListener.sqf"; diag_log format ["setup: surrenderlistener initiated"];
	[player] execVM "loadouts\_client.sqf"; diag_log format ["setup: loadouts initiated"];

	[] execVM "spawn\hedgehogAssemblingSystem.sqf";
	[] execVM "spawn\addInteractions.sqf";
	
	if (playerSide == west) then {
		[] execVM "player\russianMarker.sqf"; 
		[] execVM "player\bluforOpforTeleportListener.sqf";
		[] execVM "player\bluforBluforTeleportListener.sqf";
		[] execVM "player\bluforRussianPointsListener.sqf";
		[] spawn checkJIP;
		
	};

	if (playerSide == east) then {
		[] execVM "player\russianMarker.sqf"; diag_log format ["setup: russianmarker initiated"];
		[] execVM "player\opforBluforTeleportListener.sqf"; diag_log format ["setup: opforBluforTeleportListener initiated"];
		[] execVM "player\opforOpforTeleportListener.sqf"; diag_log format ["setup: opforOpforTeleportListener initiated"];
		[] spawn checkJIP; diag_log format ["setup: createStartHints initiated"];
		
		
	};
	waitUntil {!isNull player && !isNil "ST_STHud_ToRestart"};
	// disable sthud for intro
	0 call fn_sthud_usermenu_changeMode;
};