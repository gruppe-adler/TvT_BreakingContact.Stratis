#include "..\missionMacros.h"

createOpforMarker = {
	_opfor_marker = createMarker ["opfor_marker", _this];
	_opfor_marker setMarkerType "hd_objective";
	_opfor_marker setMarkerColor "ColorWEST";
	// with sector module, marker is only needed for getting position
	_opfor_marker setMarkerAlpha 0;
};

_OPFOR_TELEPORT_TARGET_listener = {
	debugLog("opfor teleport target listener running...");
	_pos = _this select 1;

	[_pos, 50] execVM "helpers\teleportPlayer.sqf";
	_pos call createOpforMarker;

	closeDialog 0;
};

"OPFOR_TELEPORT_TARGET" addPublicVariableEventHandler _OPFOR_TELEPORT_TARGET_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_OPFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {OPFOR_TELEPORT_TARGET select 0 != 0};
		[0, OPFOR_TELEPORT_TARGET] call _this;
	};
};
