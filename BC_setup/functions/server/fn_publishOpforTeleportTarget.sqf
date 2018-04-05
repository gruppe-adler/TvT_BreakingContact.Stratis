params ["_position"];

OPFOR_TELEPORT_TARGET = _position;
publicVariable "OPFOR_TELEPORT_TARGET";

OPFOR_TELEPORTED = true;
publicVariable "OPFOR_TELEPORTED";

private _startVehicle = [_position, 0, "rhs_gaz66_r142_vv"] spawn BC_setup_fnc_spawnStartVehicle;

waitUntil {
    !isNull _startVehicle
};

[_position] spawn BC_setup_fnc_publishBluforTeleportTarget;

[OPFOR_TELEPORT_TARGET, 50] remoteExec ["BC_setup_fnc_teleportPlayer", east, true];
[OPFOR_TELEPORT_TARGET, RUS_VEHICLE_SPAWN, east] remoteExec ["BC_setup_fnc_createStartMarker", east, true];
