params ["_position"];

OPFOR_TELEPORT_TARGET = _position;
publicVariable "OPFOR_TELEPORT_TARGET";

OPFOR_TELEPORTED = true;
publicVariable "OPFOR_TELEPORTED";

private _startVehicle = [east, _position, 0, "rhs_gaz66_r142_vv"] spawn BC_setup_fnc_spawnStartVehicle;

waitUntil {
    !isNil "RUS_VEHICLE_SPAWN"
};

[_position] spawn BC_setup_fnc_publishBluforTeleportTarget;

diag_log format ["DEBUG: %1, %2", OPFOR_TELEPORT_TARGET, RUS_VEHICLE_SPAWN];
[OPFOR_TELEPORT_TARGET, 50] remoteExec ["BC_setup_fnc_teleportPlayer", east, true];
[OPFOR_TELEPORT_TARGET, RUS_VEHICLE_SPAWN, east] remoteExec ["BC_setup_fnc_createStartMarker", east, true];

// leader information for both sides
[] call BC_setup_fnc_showLeaderInformation;
