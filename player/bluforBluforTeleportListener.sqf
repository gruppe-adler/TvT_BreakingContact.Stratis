_addBluforSpawnMarker = {
     _pos = _this select 0;


     _blufor_marker_start = createMarkerLocal ["blufor_marker_start", _pos];
     _blufor_marker_start setMarkerTypeLocal "hd_start";
     _blufor_marker_start setMarkerColorLocal "ColorWEST";
};

_BLUFOR_TELEPORT_TARGET_listener = {
     _pos = _this select 1;

     [_pos] call _addBluforSpawnMarker;
     [_pos, 50] execVM "player\teleportPlayer.sqf";
};

"BLUFOR_TELEPORT_TARGET" addPublicVariableEventHandler _BLUFOR_TELEPORT_TARGET_listener;
// diag_log format ["Mission Setup: Added blufor teleport PVEH: %1", _BLUFOR_TELEPORT_TARGET_listener];

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
     _BLUFOR_TELEPORT_TARGET_listener spawn {
          waitUntil {BLUFOR_TELEPORT_TARGET select 0 != 0};
          [0, BLUFOR_TELEPORT_TARGET] call _this;
     };
};
