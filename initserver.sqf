call compile preprocessFile "islandConfig.sqf";

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
[] execVM "server\radioBoxDistanceListener.sqf";
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
			0 = [_x] execVM "server\teleportAI.sqf";
		} forEach allUnits;
 	};
	} else {
 	[] spawn {
 		{
 			if (!isPlayer _x) then {
	 			sleep 0.2;
	 			_x setVariable ["BIS_noCoreConversations", true];
	 			0 = [_x] execVM "loadouts\_client.sqf";
				0 = [_x] execVM "server\teleportAI.sqf";
 			};
 		} forEach allUnits;
 	};
};


diag_log format ["setup: server done"];
