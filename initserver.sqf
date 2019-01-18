#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf"; // absolute basic!

[] call BC_setup_fnc_initialSpawnServer;


DEBUG_MODE = false;
if ((["DEBUG_MODE", 0] call BIS_fnc_getParamValue) == 1 || !isMultiplayer) then {
  DEBUG_MODE = true;
};
publicVariable "DEBUG_MODE";



addMissionEventHandler ["HandleDisconnect",{
    params ["", "", "", "_name"];

    if (_unit getVariable ["BC_spawnSelector", false] && !OPFOR_TELEPORTED) then {
        private _spawnSelector = [east, _unit] call BC_setup_fnc_getHighestRankOfSide;
        _spawnSelector setVariable ["BC_spawnSelector", true];
        [] remoteExec ["BC_setup_fnc_openSpawnDialog", _spawnSelector];
    };
    if (_unit getVariable ["BC_potentToBuy", false]) then {
        private _potentToBuy = [side _unit, _unit] call BC_setup_fnc_getHighestRankOfSide;
        _potentToBuy setVariable ["BC_potentToBuy", true, true];
        ["The Commander disconnected. You are now authorized to buy."] remoteExec ["hint", _unit];
    };
    if (_unit getVariable ["GRAD_loadout_applicationCount",0] < 1) then {
        deleteVehicle _unit;
    };
    false
}];

// read parameters
TIME_OF_DAY = ["TIME_OF_DAY", 10] call BIS_fnc_getParamValue;
publicVariable "TIME_OF_DAY";

WEATHER_OVERCAST = ["WEATHER_OVERCAST", -1] call BIS_fnc_getParamValue;
publicVariable "WEATHER_OVERCAST";

WEATHER_FOG = ["WEATHER_FOG", -1] call BIS_fnc_getParamValue;
publicVariable "WEATHER_FOG";

WEATHER_WIND = ["WEATHER_WIND", -1] call BIS_fnc_getParamValue;
publicVariable "WEATHER_WIND";

BLUFOR_SPAWN_DISTANCE = ["BLUFOR_SPAWN_DISTANCE", 3000] call BIS_fnc_getParamValue;
publicVariable "BLUFOR_SPAWN_DISTANCE";

TIME_ACCELERATION = ["TIME_ACCELERATION", 1] call BIS_fnc_getParamValue;

GRAD_REPLAY_PRECISION = ["GRAD_REPLAY_PRECISION", 4] call BIS_fnc_getParamValue;
publicVariable "GRAD_REPLAY_PRECISION"; // clients need to know this

AR3PLAY_ENABLE_REPLAY = (["AR3PLAY_ENABLE_REPLAY", 0] call BIS_fnc_getParamValue) == 1;
AR3PLAY_IS_STREAMABLE = (["AR3PLAY_IS_STREAMABLE", 0] call BIS_fnc_getParamValue) == 1;

JIP_TIME_ALLOWED = ["JIP_TIME_ALLOWED", 999999] call BIS_fnc_getParamValue;
publicVariable "JIP_TIME_ALLOWED"; // clients need to know this

CIVILIAN_TRAFFIC = ["CIVILIAN_TRAFFIC", 999999] call BIS_fnc_getParamValue;
publicVariable "CIVILIAN_TRAFFIC"; // clients need to know this


// todo activate grad civs

CONQUER_MODE = (["CONQUER_MODE", 1] call BIS_fnc_getParamValue) == 0;
publicVariable "CONQUER_MODE";

PREPARATION_TIME = ["PREPARATION_TIME", 0] call BIS_fnc_getParamValue;
publicVariable "PREPARATION_TIME";

TRUCK_DESTROYED_NOT_CONQUERED = false;
publicVariable "TRUCK_DESTROYED_NOT_CONQUERED";


setCustomWeather = {

  // get random shit
  if (str WEATHER_OVERCAST isEqualTo "-1") then {
    WEATHER_OVERCAST = [[
    0.0,
    0.1,
    0.2,
    0.3,
    0.4,
    0.5,
    0.6,
    0.7,
    0.8,
    0.9,
    1.0
    ], [
    0.3,
    0.3,
    0.1,
    0.1,
    0.05,
    0.025,
    0.025,
    0.025,
    0.025,
    0.025,
    0.025]] call BIS_fnc_selectRandomWeighted;
  };

  if (str WEATHER_FOG isEqualTo "-1") then {
    WEATHER_FOG = [[
    0.0,
    0.05,
    0.1,
    0.2,
    0.3,
    0.4,
    0.5,
    0.6,
    0.7,
    0.8,
    1.0
    ], [
    0.5,
    0.3,
    0.1,
    0.075,
    0.01,
    0.005,
    0.005,
    0.004,
    0.003,
    0.002,
    0.001]] call BIS_fnc_selectRandomWeighted;
  };

  if (str WEATHER_WIND isEqualTo "-1") then {
    WEATHER_WIND = (random 2) - (random 4);
  };

  diag_log format ["BC setup: setting wind to %1", WEATHER_WIND];

  // basics
  10 setOvercast WEATHER_OVERCAST;
  10 setFog WEATHER_FOG;
  setWind [WEATHER_WIND, WEATHER_WIND, true];
  10 setWindForce 0.1;

  // add specials dependent on values
  if (WEATHER_OVERCAST > 0.5 && WEATHER_OVERCAST < 0.8) then {
    10 setRain 0.5;
    10 setRainbow 0.8;
  };

  if (WEATHER_OVERCAST >= 0.8) then {
    10 setRain 1;
    10 setLightnings 0.8;
  };

  // enforce changes
  forceWeatherChange;
};


// allow view distance to be up to 10k

// set to full moon date
setDate [2015, 2, 1, TIME_OF_DAY, 1]; // set to 5:00 for perfect full moon

call setCustomWeather;

// set time acceleration
setTimeMultiplier TIME_ACCELERATION;

["Initialize", [true]] call BIS_fnc_dynamicGroups;

MISSION_STARTED = false;
publicVariable "MISSION_STARTED";

BLUFOR_ELIMINATED = false;
publicVariable "BLUFOR_ELIMINATED";
OPFOR_ELIMINATED = false;
publicVariable "OPFOR_ELIMINATED";

BLUFOR_CAPTURED = false;
publicVariable "BLUFOR_CAPTURED";

TRANSMISSION_COMPLETE = false;
publicVariable "TRANSMISSION_COMPLETE";

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
REPLAY_SPEED = 0.05;
REPLAY_STEPS_PER_TICK = 1;


// spectator side center
SPEC_CENTER = createCenter independent;
SPEC_GROUP = createGroup [SPEC_CENTER, false];
publicVariable "SPEC_GROUP";



[] call grad_civMarker_fnc_civGunfightListener;
[] call grad_civMarker_fnc_civKilledListener;

// let highest player rank choose spawn
private _spawnSelector = [east] call BC_setup_fnc_getHighestRankOfSide;
_spawnSelector setVariable ["BC_spawnSelector", true];
[] remoteExec ["BC_setup_fnc_openSpawnDialog", _spawnSelector];

/*
[] spawn {
    waitUntil {
      BLUFOR_TELEPORT_TARGET select 0 != 0
    };
  {
      if (!isPlayer _x) then {
        sleep 0.5;
        _x setVariable ["BIS_noCoreConversations", true];
        [_x] call BC_setup_fnc_teleportAI;
      };
  } forEach allUnits;
};
*/

diag_log format ["setup: server done"];
