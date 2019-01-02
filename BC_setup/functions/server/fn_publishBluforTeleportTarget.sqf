params ["_position"];

// get start vehicle type
BUYABLES_BLUFOR_INDEX = ["BUYABLES_BLUFOR", -1] call BIS_fnc_getParamValue;
private _faction = missionConfigFile >> "CfgGradBuymenu" >> (BUYABLES_BLUFOR_VALUES select BUYABLES_BLUFOR_INDEX);
private _startVehicles = "true" configClasses _faction;
private _type = "rhsusf_m998_w_4dr";
{
  private _config = _x;
  private _condition = [(_config >> "condition"), "text", "true"] call CBA_fnc_getConfigEntry;

    if (call compile _condition) then {
    	_type = _x;
    };
} forEach _startVehicles;

private _startVehicle = [west, _position, BLUFOR_SPAWN_DISTANCE, _type] call BC_setup_fnc_spawnStartVehicle;

waitUntil {
    !isNil "US_VEHICLE_SPAWN"
};


BLUFOR_TELEPORT_TARGET = [west] call BC_setup_fnc_getStartVehiclePos;
publicVariable "BLUFOR_TELEPORT_TARGET";

BLUFOR_TELEPORTED = true;
publicVariable "BLUFOR_TELEPORTED";

[BLUFOR_TELEPORT_TARGET, 50] remoteExec ["BC_setup_fnc_teleportPlayer", west, true];
[BLUFOR_TELEPORT_TARGET, west] remoteExec ["BC_setup_fnc_createStartMarker", west, true];
