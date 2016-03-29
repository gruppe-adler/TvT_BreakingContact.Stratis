#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

if (paramsArray select 10 == 1 || !isMultiplayer) then {
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
REPLAY_ACCURACY = paramsArray select 7;
AR3PLAY_ENABLE_REPLAY = (paramsArray select 8) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 9) == 1;
JIP_TIME_ALLOWED = paramsArray select 11;
CIVILIAN_TRAFFIC = paramsArray select 13;


// paramsarray select 12 is BFT module in editor
jipTime = JIP_TIME_ALLOWED;



// optimize for PVP
disableRemoteSensors true;
setViewDistance 3500;

setCustomWeather = {
	// skipTime -24;
	10 setOvercast (_this select 0);
	10 setRain 0;
	if ((_this select 0) > 0.5) then {
		_fogDensity = 0.2;
		_fogFalloff = 0;
		10 setFog [_fogDensity, _fogFalloff, 0];
	};
	if (_this select 1 && (_this select 0) > 0.7) then {
		10 setRain 1;
		_fogDensity = 0.4;
		_fogFalloff = 0;
		10 setFog [_fogDensity, _fogFalloff, 1];
	};

	forceWeatherChange;
	// skipTime 24;
};

getMapSize = {
	// check for arma3 map size
	_mapSizeDetected = worldSize;
	_mapSizeDetectedKnown = true;

	// check for utes/chernarus
	if (_mapSizeDetected < 2000) then {
	_mapSizeDetected = getNumber (configFile>>"CfgWorlds">>worldName>>"grid">>"zoom1">>"stepX")*(parseNumber mapGridPosition [0,0,0]);
	diag_log format ["Calculating Spawnpos: Map doesnt seem to be Arma3 native. Checking for Chernarus/Utes.",_mapSizeDetected];
	};

	// check for OA terrains / takistan
	if (_mapSizeDetected < 2000) then {
		_mapSizeDetected = getNumber (configFile>>"CfgWorlds">>worldName>>"grid">>"offsety");
		diag_log format ["Calculating Spawnpos: Checking for OA Terrain.",_mapSizeDetected];
	};

	// now im out of functions to get map size correctly
	if (_mapSizeDetected < 2000) then {
		_mapSizeDetectedKnown = false; diag_log format ["Calculating Spawnpos: Map Size < 2000 or unknown."];
	} else {
		_mapSizeDetectedKnown = true; diag_log format ["Calculating Spawnpos: Map Size is  %1.",_mapSizeDetected];
	};
	[_mapSizeDetected,_mapSizeDetectedKnown]
};


if (!isMultiplayer) then { // Editor
	/* {_x disableAI "MOVE"} forEach allUnits;*/
};

if (CIVILIAN_TRAFFIC == 1) then {
	[] execVM "Engima\Traffic\Init.sqf";
};

if (isServer) then {
	// allow view distance to be up to 10k

	// set to full moon date
	setDate [2015, 2, 5, TIME_OF_DAY, 1]; // set to 5:00 for perfect full moon

	switch (WEATHER_SETTING) do {
	case 0: {[0,false] call setCustomWeather;};
	case 1: {[0.65,false] call setCustomWeather;};
	case 2: {[1,true] call setCustomWeather;};
	case 3: {[random 1,true] call setCustomWeather;};
	default {[0,false] call setCustomWeather;};
        };
	// set time acceleration
	setTimeMultiplier TIME_ACCELERATION;

	["Initialize"] call BIS_fnc_dynamicGroups;

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

	OPFOR_TELEPORT_TARGET = [0, 0];
	publicVariable "OPFOR_TELEPORT_TARGET";
	BLUFOR_TELEPORT_TARGET = [0, 0];
	publicVariable "BLUFOR_TELEPORT_TARGET";

	VEHICLE_ORDERED_WEST = [false,0];
	publicVariable "VEHICLE_ORDERED_WEST";
	VEHICLE_ORDERED_EAST = [false,0];
	publicVariable "VEHICLE_ORDERED_EAST";

	BUY_OPTION_BLUFOR = true;
	publicVariable "BUY_OPTION_BLUFOR";
	BUY_OPTION_OPFOR = true;
	publicVariable "BUY_OPTION_OPFOR";

	OPFOR_TELEPORTED = false;
	publicVariable "OPFOR_TELEPORTED";
	BLUFOR_TELEPORTED = false;
	publicVariable "BLUFOR_TELEPORTED";

	// radio box related
	RADIO_BOX = false;
	publicVariable "RADIO_BOX";
	RADIO_BOX_ACTIVE = false;
	publicVariable "RADIO_BOX_ACTIVE";
	
	RADIO_BOX_MARKER_HIDDEN = true;
	publicVariable "RADIO_BOX_MARKER_HIDDEN";
	RADIO_BOX_MARKER_POS = [0,0];
	publicVariable "RADIO_BOX_MARKER_POS";

	RADIO_BOX_DISTANCE = 0;
	publicVariable "RADIO_BOX_DISTANCE";


	// radio truck related
	RADIO_TRUCK_MARKER_HIDDEN = true;
	publicVariable "RADIO_TRUCK_MARKER_HIDDEN";
	RADIO_TRUCK_MARKER_POS = [0,0];
	publicVariable "RADIO_TRUCK_MARKER_POS";

	RUSSIAN_POINTS = 0;
	publicVariable "RUSSIAN_POINTS";

	// civilian traffic
    CIV_KILLED_POS = [0,0,0];
    publicVariable "CIV_KILLED_POS";
    CIV_GUNFIGHT_POS = [0,0,0];
	publicVariable "CIV_GUNFIGHT_POS";

	// replay
	REPLAY_FINISHED = false;
	publicVariable "REPLAY_FINISHED";
	REPLAY_SPEED = 0.02;
	REPLAY_STEPS_PER_TICK = 1;

	russianCredits = OPFOR_MONEY;
	USCredits = BLUFOR_MONEY;

	0 = [russianCredits,USCredits] execVM "spawn\gui\addPublicVariableEventhandler.sqf";


	[] spawn {
		_connectedPlayers = call CBA_fnc_players;
		_playercount = count _connectedPlayers;
		_bonusPerPlayer = _playercount * 100;

		russianCredits = OPFOR_MONEY + _bonusPerPlayer;
		USCredits = BLUFOR_MONEY + _bonusPerPlayer;

		0 = [russianCredits,USCredits] execVM "spawn\gui\addPublicVariableEventhandler.sqf";

	};

	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};
	[] execVM "objectives\detect_all_dead.sqf";
 	[] execVM "helpers\medical_settings.sqf";

 	// events/listeners
	[] execVM "server\russianMarker.sqf";
 	[] execVM "server\teleportListener.sqf";
    [] execVM "server\civKillListener.sqf";
    [] execVM "server\civGunfightListener.sqf";

    // VCOM driving AI
    [] execVM "VCOM_Driving\init.sqf";

 	call compile preprocessFileLineNumbers "server\spawnBluforHQ.sqf";

 	if (!isMultiplayer) then {
	 	[] spawn {
	 		{
				if (!isPlayer _x) then {
					sleep 0.5; 0 = [_x] execVM "loadouts\_client.sqf";
					_x setVariable ["BIS_noCoreConversations", true]; 
				};
				0 = [_x] execVM "server\adjustInitialSpawnPositionAI.sqf";
			} forEach allUnits;
	 	};
 	} else {
	 	[] spawn {
	 		{
	 			if (!isPlayer _x) then {
		 			sleep 0.2;
		 			_x setVariable ["BIS_noCoreConversations", true]; 
		 			0 = [_x] execVM "loadouts\_client.sqf";
					0 = [_x] execVM "server\adjustInitialSpawnPositionAI.sqf";
	 			};
	 		} forEach allUnits;
	 	};
	};
};

diag_log format ["setup: server done"];

[REPLAY_ACCURACY] execVM "GRAD_replay\GRAD_replay_init.sqf";

clearInventory = compile preprocessFile "helpers\clearInventory.sqf";
spawnStuff = compile preprocessFile "helpers\spawnStuff.sqf";
//SHK POS
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
// findsimplePos
call compile preprocessFileLineNumbers "helpers\findSimplePos.sqf";


If(isNil "spawn_help_fnc_compiled") then { call compile preprocessFileLineNumbers "helpers\findPos.sqf"; }; // TODO why the if condition here?

diag_log format ["setup: clientandserver done"];

if (hasInterface) then {

	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

	player allowDamage false;
	[] execVM "player\setup\adjustInitialSpawnPosition.sqf"; diag_log format ["setup: initial spawn position initiated"];

	checkJIP = {
		if ((OPFOR_TELEPORT_TARGET select 0 != 0) && didJIP && time > jipTime) then {
			player setDamage 1;
		} else {
		if (!didJIP) exitWith {
			[] call checkSpawnButton;
		};
		waitUntil {!isNull player};
		if (playerSide == east) then {
				[OPFOR_TELEPORT_TARGET, 50] execVM "player\teleportPlayer.sqf";
			}
			else {
				[BLUFOR_TELEPORT_TARGET, 50] execVM "player\teleportPlayer.sqf";
			};

		};
	};


	checkSpawnButton = {

		if (str player != "opfor_teamlead") then {
			0 = [[worldSize/2,worldSize/2,0],"",1500] execVM "player\setup\establishingShot.sqf";
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

						if (_this select 1 == 57) then {0 = createDialog 'gui_spawn_opfor'; true};
					"]
			];
			0 = createDialog "gui_spawn_opfor";
			waitUntil {(OPFOR_TELEPORT_TARGET select 0 != 0)};
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];
		};
	};




	


	[] execVM "player\setup\helpBriefing.sqf"; diag_log format ["setup: briefing initiated"];




	[] execVM "player\allXXXSurrenderedListener.sqf"; diag_log format ["setup: surrenderlistener initiated"];
	// [player] execVM "loadouts\_client.sqf";
	[] spawn {
		sleep (random 10);
		[player] execVM "loadouts\_client.sqf"; diag_log format ["setup: loadout %1 initiated",player];
		enableSentences false;
		showSubtitles false;
		0 fadeRadio 0;
	};


	[] execVM "spawn\hedgehogAssemblingSystem.sqf";
	[] execVM "spawn\assaultBoatAssemblingSystem.sqf";
	[] execVM "spawn\addInteractions.sqf";
	[] execVM "player\civKillListener.sqf";
	[] execVM "player\civGunfightListener.sqf";
	[] execVM "player\startMarkerListener.sqf";

	if (playerSide == west) then {
		[] execVM "player\russianMarker.sqf";
		[] execVM "player\bluforBluforTeleportListener.sqf";
		[] execVM "player\bluforRussianPointsListener.sqf";
		[] spawn checkJIP;
	};

	if (playerSide == east) then {
		[] execVM "player\russianMarker.sqf"; diag_log format ["setup: russianmarker initiated"];
		[] execVM "player\opforOpforTeleportListener.sqf"; diag_log format ["setup: opforOpforTeleportListener initiated"];
		[] execVM "player\bluforRussianPointsListener.sqf";
		[] spawn checkJIP; diag_log format ["setup: createStartHints initiated"];
		player setVariable ["radioAttached",false]; // for use in detaching radio from radio truck
	};


	//player addEventHandler ["WeaponAssembled", {[_this select 1] execVM "helpers\nerfDrone.sqf"}];		//Darter
	[] execVM "helpers\nerfRaven.sqf";																		//Raven


	/*waitUntil {!isNull player && !isNil "ST_STHud_ToRestart"};
	// disable sthud for intro
	0 call fn_sthud_usermenu_changeMode;*/
};
