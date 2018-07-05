params ["_position"];

blufor_hq = "rhsusf_m998_d_4dr";

if (IS_WOODLAND) then {
   blufor_hq = "rhsusf_m998_w_4dr";
};

private _startVehicle = [west, _position, BLUFOR_SPAWN_DISTANCE, blufor_hq] spawn BC_setup_fnc_spawnStartVehicle;

waitUntil {
    !isNil "US_VEHICLE_SPAWN"
};

BLUFOR_TELEPORT_TARGET = position _startVehicle;
publicVariable "BLUFOR_TELEPORT_TARGET";

BLUFOR_TELEPORTED = true;
publicVariable "BLUFOR_TELEPORTED";

diag_log format ["DEBUG: %1, %2", BLUFOR_TELEPORT_TARGET, US_VEHICLE_SPAWN];
[BLUFOR_TELEPORT_TARGET, 50] remoteExec ["BC_setup_fnc_teleportPlayer", west, true];
[BLUFOR_TELEPORT_TARGET, US_VEHICLE_SPAWN, west] remoteExec ["BC_setup_fnc_createStartMarker", west, true];
