#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

call compile preprocessFile "islandConfig.sqf"; // absolute basic!
call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf"; // absolute basic!
// get_slope used in spawnbluforhq.sqf
call compile preprocessFileLineNumbers "helpers\findSimplePos.sqf";

0 = execVM "grad_civs\init.sqf";

DEBUG_MODE = false;
if ((["DEBUG_MODE", 0] call BIS_fnc_getParamValue) == 1 || !isMultiplayer) then {
	DEBUG_MODE = true;
};
publicVariable "DEBUG_MODE";

// read parameters
TIME_OF_DAY = ["TIME_OF_DAY", 10] call BIS_fnc_getParamValue;
publicVariable "TIME_OF_DAY";

WEATHER_SETTING = ["WEATHER_SETTING", 0] call BIS_fnc_getParamValue;
publicVariable "WEATHER_SETTING";

BLUFOR_SPAWN_DISTANCE = ["BLUFOR_SPAWN_DISTANCE", 3000] call BIS_fnc_getParamValue;
publicVariable "BLUFOR_SPAWN_DISTANCE";

TIME_ACCELERATION = ["TIME_ACCELERATION", 1] call BIS_fnc_getParamValue;

REPLAY_ACCURACY = ["REPLAY_ACCURACY", 4] call BIS_fnc_getParamValue;
publicVariable "REPLAY_ACCURACY"; // clients need to know this

AR3PLAY_ENABLE_REPLAY = (["AR3PLAY_ENABLE_REPLAY", 0] call BIS_fnc_getParamValue) == 1;
AR3PLAY_IS_STREAMABLE = (["AR3PLAY_IS_STREAMABLE", 0] call BIS_fnc_getParamValue) == 1;

JIP_TIME_ALLOWED = ["JIP_TIME_ALLOWED", 999999] call BIS_fnc_getParamValue;
publicVariable "JIP_TIME_ALLOWED"; // clients need to know this

CIVILIAN_TRAFFIC = ["CIVILIAN_TRAFFIC", 999999] call BIS_fnc_getParamValue;
publicVariable "CIVILIAN_TRAFFIC"; // clients need to know this

FACTIONS_DEFAULT = (["FACTION_MODE", 1] call BIS_fnc_getParamValue) == 1;
publicVariable "FACTIONS_DEFAULT";

if (!FACTIONS_DEFAULT) then {
	
} else {
	0 = execVM "grad_waverespawn\init.sqf";
	0 = execVM "grad_roadtrash\init.sqf";
	
};

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


// allow view distance to be up to 10k

// set to full moon date
setDate [2015, 2, 1, TIME_OF_DAY, 1]; // set to 5:00 for perfect full moon

switch (WEATHER_SETTING) do {
case 0: {[0,false] call setCustomWeather;};
case 1: {[0.65,false] call setCustomWeather;};
case 2: {[1,true] call setCustomWeather;};
case 3: {[random 1,true] call setCustomWeather;};
default {[0,false] call setCustomWeather;};
};
// set time acceleration
setTimeMultiplier TIME_ACCELERATION;

["Initialize", [true]] call BIS_fnc_dynamicGroups;

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



// civilian traffic
CIV_KILLED = [[0,0,0],objNull];
publicVariable "CIV_KILLED";
CIV_GUNFIGHT_POS = [0,0,0];
publicVariable "CIV_GUNFIGHT_POS";

// replay
REPLAY_FINISHED = false;
publicVariable "REPLAY_FINISHED";
REPLAY_SPEED = 0.02;
REPLAY_STEPS_PER_TICK = 1;



// add money from player count
[] spawn {
	_playercount = count (call CBA_fnc_players);
	_bonusPerPlayer = _playercount * 100;

	waitUntil {!isNil "moneyOpfor" && !isNil "moneyBlufor"};

	moneyOpfor = moneyOpfor + _bonusPerPlayer;
	moneyBlufor = moneyBlufor + _bonusPerPlayer;

	if (FACTIONS_DEFAULT) then {
		moneyOpfor = moneyOpfor + 1000;
	};
	publicVariable "moneyBlufor";
	publicVariable "moneyOpfor";
};

if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
	[] execVM "tfarsettings.sqf";
};
[] execVM "objectives\detect_all_dead.sqf";
	[] execVM "helpers\medical_settings.sqf";


[] execVM "server\teleportListener.sqf";
[] execVM "server\civKillListener.sqf";
[] execVM "server\civGunfightListener.sqf";
[] execVM "server\spawn\spawnRadioTruck.sqf";

call compile preprocessFileLineNumbers "server\spawnBluforHQ.sqf";


	if (!isMultiplayer) then {
 	[] spawn {
 		{
			if (!isPlayer _x) then {
				sleep 1;
				_x setVariable ["BIS_noCoreConversations", true];
			};
			0 = [_x] execVM "server\teleportAI.sqf";
		} forEach allUnits;
 	};
	} else {
 	[] spawn {
 		{
 			if (!isPlayer _x) then {
	 			sleep 0.5;
	 			_x setVariable ["BIS_noCoreConversations", true];
				0 = [_x] execVM "server\teleportAI.sqf";
 			};
 		} forEach allUnits;
 	};
};


diag_log format ["setup: server done"];