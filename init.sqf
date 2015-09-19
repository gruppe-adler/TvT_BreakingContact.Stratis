#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"
[]execVM "spawn\gui\initGUI.sqf";

TIME_OF_DAY = paramsArray select 0;
WEATHER_SETTING = paramsArray select 1;
MINIMAL_BLUFOR_SPAWN_DISTANCE = paramsArray select 2;
MAXIMAL_BLUFOR_SPAWN_DISTANCE = paramsArray select 3;
TIME_ACCELERATION = paramsArray select 4;
AR3PLAY_ENABLE_REPLAY = (paramsArray select 5) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 6) == 1;

if (isServer) then { setDate [2015, 2, 2, TIME_OF_DAY, 1]; };	//Zeit

if (didJIP) then {
	if (OPFOR_TELEPORTED) then {
		[player] execVM "onPlayerRespawn.sqf";
		if (!IS_VANILLA) then {
		[localize "str_GRAD_jip"] call EFUNC(common,displayTextStructured);
		} else {
		hintSilent "JIP leads to instant spectator";
		};
	};
};

enableSentences false;


firstspawn = false;

RUSSIAN_MARKER_POS = [0,0];

EDITOR_MODE = false; // check if test is in editor/singleplayer


if (!isMultiplayer) then {
	EDITOR_MODE = true;
	{_x disableAI "MOVE"} forEach allUnits;
};

if (isServer) then {
	setTimeMultiplier TIME_ACCELERATION;

	// spawn teleports done?
	OPFOR_TELEPORTED = false;
	BLUFOR_TELEPORTED = false;
	WINCONDITIONOPFOR = false;
	WINCONDITIONBLUFOR = false;

	BLUFOR_CAPTURED = false;
	publicVariable "BLUFOR_CAPTURED";
	MISSION_COMPLETED = false;
	publicVariable "MISSION_COMPLETED";

	bluforMarkerDrawn = false;
	publicVariable "bluforMarkerDrawn";

	BLUFOR_SURRENDERED = false;
	publicVariable "BLUFOR_SURRENDERED";
	END_MISSION_TRIGGERED = false;
	publicVariable "END_MISSION_TRIGGERED";
	SPECTATOR_LIST = [];
	publicVariable "SPECTATOR_LIST";
	RUSSIAN_MARKER_HIDDEN = true;
	publicVariable "RUSSIAN_MARKER_HIDDEN";
	BLUFOR_AT_BARREL = false;
	publicVariable "BLUFOR_AT_BARREL";
};


// respawn helper object, will be moved to objective location in teleport.sqf
// ["<t color=""#93E352"">" + localize "str_GRAD_choose_spawn_location",{[[[false], "mission_setup\teleport.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;  }, _Args, 1, false, true, "","_this == _target && !OPFOR_TELEPORTED"];
// ["<t color=""#93E352"">" + localize "str_GRAD_choose_spawn_location",{[[[false], "mission_setup\teleport.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;  }, _Args, 1, false, true, "","_this == _target && !BLUFOR_TELEPORTED && OPFOR_TELEPORTED"];



if (player == opfor_teamlead) then {
	[] spawn {
	waitUntil {!isNull player};
	0 = createDialog "gui_spawn_opfor";
	};
};

if (player == blufor_teamlead) then {
	[] spawn {
	waitUntil {!isNull player};
	0 = createDialog "gui_spawn_blufor";
	disableSerialization;
	ctrlEnable [8002, false];
	waitUntil {OPFOR_TELEPORTED};
	ctrlSetText [8002, "Spawnpunkt aussuchen"];
	8002 ctrlSetTooltip "Jetzt Spawnpunkt aussuchen";
	ctrlEnable [8002, true];
	};
	
};


clearInventory = compile preprocessFile "helpers\clearInventory.sqf";
spawnStuff = compile preprocessFile "helpers\spawnStuff.sqf";
moveStuff = compile preprocessFile "helpers\moveStuff.sqf";
//SHK POS
call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
// findsimplePos
call compile preprocessfile "helpers\findSimplePos.sqf";

If(isNil "spawn_help_fnc_compiled")then{call compile preprocessFileLineNumbers "helpers\findPos.sqf"};

enableSentences false; // Autospotten


if ((isServer) || (isDedicated)) then {
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then
		{
		[] execVM "tfarsettings.sqf";
	};
	[] execVM "objectives\detect_all_dead.sqf";
 	[] execVM "helpers\medical_settings.sqf";
};


// loadout call - giving each unit the appropriate sqf file

if !(isDedicated) then {
	[] execVM "mission_setup\helpBriefing.sqf";
	[] execVM "mission_setup\adjustInitialSpawnPosition.sqf";
	
	switchMoveEverywhere = compileFinal "_this select 0 switchMove (_this select 1);";
	
	[player] execVM "loadouts\_client.sqf";
	
	// Intro Gruppe Adler
	titleCut ["", "BLACK FADED", 999];
	
	[] Spawn {
		waitUntil {BLUFOR_TELEPORTED};
		titleText ["","PLAIN"];
		titleFadeOut 1;
		sleep 2;

		titleCut ["", "BLACK IN", 1];

		
		["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>OnTheFly</t>",0,0,2,2] spawn BIS_fnc_dynamicText;
	};
};


//[WEATHER_SETTING] execVM "ga_weather\ga_start_weather.sqf";

if (isServer) then {
	waitUntil {OPFOR_TELEPORTED && BLUFOR_TELEPORTED};

	[] execVM "after_action_reporter_pimped\movement_vanillamarker.sqf";
};
