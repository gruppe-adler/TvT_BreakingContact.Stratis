#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

call compile preprocessFile "islandConfig.sqf"; // absolute basic!
call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf"; // absolute basic!
// get_slope used in spawnbluforhq.sqf
call compile preprocessFileLineNumbers "helpers\findSimplePos.sqf";




If(isNil "spawn_help_fnc_compiled") then { call compile preprocessFileLineNumbers "helpers\findPos.sqf"; }; // TODO why the if condition here?

if (paramsArray select 10 == 1 || !isMultiplayer) then {
	DEBUG_MODE = true;
} else {
	DEBUG_MODE = false;
};

// read parameters
TIME_OF_DAY = paramsArray select 0;
publicVariable "TIME_OF_DAY";
WEATHER_SETTING = paramsArray select 1;
publicVariable "WEATHER_SETTING";
BLUFOR_SPAWN_DISTANCE = (paramsArray select 2);
publicVariable "BLUFOR_SPAWN_DISTANCE";
OPFOR_MONEY = paramsArray select 3;
publicVariable "OPFOR_MONEY";
BLUFOR_MONEY = paramsArray select 4;
publicVariable "BLUFOR_MONEY";
POINTS_NEEDED_FOR_VICTORY = paramsArray select 5;
publicVariable "POINTS_NEEDED_FOR_VICTORY"; // clients need to know this
TIME_ACCELERATION = paramsArray select 6;
REPLAY_ACCURACY = paramsArray select 7;
publicVariable "REPLAY_ACCURACY"; // clients need to know this
AR3PLAY_ENABLE_REPLAY = (paramsArray select 8) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 9) == 1;
JIP_TIME_ALLOWED = paramsArray select 11;
publicVariable "JIP_TIME_ALLOWED"; // clients need to know this
CIVILIAN_TRAFFIC = paramsArray select 13;
publicVariable "CIVILIAN_TRAFFIC"; // clients need to know this

FACTIONS_DEFAULT = (paramsArray select 14 == 0);
publicVariable "FACTIONS_DEFAULT";

if (!FACTIONS_DEFAULT) then {
	0 = execVM "server\wave_respawn\init.sqf";
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

RADIO_BOX_DESTROYED = false;
publicVariable "RADIO_BOX_DESTROYED";

// radio truck related
RADIO_TRUCK_MARKER_HIDDEN = true;
publicVariable "RADIO_TRUCK_MARKER_HIDDEN";
RADIO_TRUCK_MARKER_POS = [0,0];
publicVariable "RADIO_TRUCK_MARKER_POS";

OPFOR_POINTS = 0;
publicVariable "OPFOR_POINTS";



showPointsInstant = {diag_log format ["debug: east checks transmission progress manually."];};

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
	publicVariable "moneyBlufor";
	publicVariable "moneyOpfor";
};

if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
	[] execVM "tfarsettings.sqf";
};
[] execVM "objectives\detect_all_dead.sqf";
	[] execVM "helpers\medical_settings.sqf";

	// events/listeners
[] execVM "server\trackingMarker.sqf";
[] execVM "server\radioBoxDistanceListener.sqf";
[] execVM "server\teleportListener.sqf";
[] execVM "server\civKillListener.sqf";
[] execVM "server\civGunfightListener.sqf";
[] execVM "server\spawn\spawnRadioTruck.sqf";

call compile preprocessFileLineNumbers "server\spawnBluforHQ.sqf";
call compile preprocessFileLineNumbers "server\fnc_radiotruck_deploy.sqf";
call compile preprocessFileLineNumbers "server\fnc_radiotruck_retract.sqf";

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
