#include "..\missionMacros.h"

createOpforMarker = {
	_opfor_marker = createMarker ["opfor_marker", _this select 0];
	_opfor_marker setMarkerType "hd_objective";
	_opfor_marker setMarkerColor "ColorWEST";
	// with sector module, marker is only needed for getting position
	_opfor_marker setMarkerAlpha 0;
};

_ShowSetupInformation = {
	 while {!isNil "RUS_SPAWN_PAD"} do {
	 hintSilent format ["Searching Spawn Pad..."];
	 sleep 2;
 	};
	hintSilent format ["Setup completed."];
	diag_log format ["Mission Setup Information: Completed"];
};

_showLeaderInformation = {
	_teamleads= [
		"O_G_Soldier_TL_F",
		"O_soldierU_F",
		"O_Soldier_TL_F",
		"O_recon_TL_F",
		"O_soldierU_TL_F",
		"O_G_officer_F",
		"O_Soldier_TL_F",
		"O_recon_TL_F",
		"O_soldierU_TL_F"
	];
	_squadleads= [
		"O_Soldier_SL_F"
	];
	_commanders = [
		"opfor_assistant",
		"opfor_teamlead"
	];
	_allofthem = _teamleads + _squadleads + _commanders;
	_drawIconsStacked = [];

	_MISSION_ROOT = str missionConfigFile select [0, count str missionConfigFile - 15];
	{
		if (!(typeOf _x in _allofthem)) exitWith {};

		if (typeOf _x in _teamleads) then {
			_symbol = "tl";
			_color = [0.2,0.2,0.9,1];
		};
		if (typeOf _x in _squadleads) then {
			_symbol = "sql";
			_color = [0.8,0.8,0.8,1];
		};
		if (str _x in _commanders) then {
			_symbol = "com";
			_color = [0.2,0.9,0.2,1];
		};
		_uniqueString = "drawIconFor" + format ["%1",_x];
		_drawIconsStacked = _drawIconsStacked + _uniqueString;
		[_uniqueString, "onEachFrame", {
			drawIcon3D[_MISSION_ROOT + "\pic\leaderclasses\"
			_symbol +
			".paa", _color, [getPos _x select 0, getPos _x select 1, 2.3], 2, 2, 0];
		}] call BIS_fnc_addStackedEventHandler;
	} forEach allPlayers;
	waitUntil {time > 180};
	{[_x, "onEachFrame"] call BIS_fnc_removeStackedEventHandler; } forEach _drawIconsStacked;
};

_OPFOR_TELEPORT_TARGET_listener = {
	debugLog("opfor teleport target listener running...");
	_pos = _this select 1;

	[_pos, 50] execVM "player\teleportPlayer.sqf";
	[_pos] call createOpforMarker;

	closeDialog 0;

	[] spawn _ShowSetupInformation;
	[] spawn _showLeaderInformation;
};

"OPFOR_TELEPORT_TARGET" addPublicVariableEventHandler _OPFOR_TELEPORT_TARGET_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_OPFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {OPFOR_TELEPORT_TARGET select 0 != 0};
		[0, OPFOR_TELEPORT_TARGET] call _this;
	};
};
