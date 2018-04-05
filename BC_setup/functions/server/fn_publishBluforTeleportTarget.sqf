params ["_opforPosition"];

if (IS_WOODLAND) then {
   blufor_hq = "rhsusf_m998_w_4dr";
} else {
   blufor_hq = "rhsusf_m998_d_4dr";
};

private _startVehicle = [_opforPosition, BLUFOR_SPAWN_DISTANCE, blufor_hq] spawn BC_setup_fnc_spawnStartVehicle;

waitUntil {
    !isNull _startVehicle
};

BLUFOR_TELEPORT_TARGET = position _startVehicle;
publicVariable "BLUFOR_TELEPORT_TARGET";

BLUFOR_TELEPORTED = true;
publicVariable "BLUFOR_TELEPORTED";

[BLUFOR_TELEPORT_TARGET, 50] remoteExec ["BC_setup_fnc_teleportPlayer", west, true];
[BLUFOR_TELEPORT_TARGET, US_VEHICLE_SPAWN, west] remoteExec ["BC_setup_fnc_createBluforMarker", west, true];

closeDialog 0;
