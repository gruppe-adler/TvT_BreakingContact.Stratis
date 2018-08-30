params ["_position"];

blufor_hq = "rhsusf_m998_d_4dr";

if (BC_IS_WOODLAND) then {
   blufor_hq = "rhsusf_m998_w_4dr";
};

private _startVehicle = [west, _position, BLUFOR_SPAWN_DISTANCE, blufor_hq] call BC_setup_fnc_spawnStartVehicle;

waitUntil {
    !isNil "US_VEHICLE_SPAWN"
};


BLUFOR_TELEPORT_TARGET = [west] call BC_setup_fnc_getStartVehiclePos;
publicVariable "BLUFOR_TELEPORT_TARGET";

BLUFOR_TELEPORTED = true;
publicVariable "BLUFOR_TELEPORTED";

[BLUFOR_TELEPORT_TARGET, 50] remoteExec ["BC_setup_fnc_teleportPlayer", west, true];
[BLUFOR_TELEPORT_TARGET, west] remoteExec ["BC_setup_fnc_createStartMarker", west, true];
