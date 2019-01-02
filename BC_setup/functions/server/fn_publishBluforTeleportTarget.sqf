params ["_position"];

// get start vehicle type
BUYABLES_BLUFOR_INDEX = ["BUYABLES_BLUFOR", -1] call BIS_fnc_getParamValue;
private _sideFactions = "getText (_x >> 'side') == 'Blufor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
private _faction = (_sideFactions select BUYABLES_BLUFOR_INDEX);
private _startVehicle = ("configName _x == 'StartVehicle'" configClasses _faction) select 0;
private _allVariants = "true" configClasses (missionConfigFile >> "CfgGradBuymenu" >> (configName _faction) >> (configName _startVehicle));
private _selectedConfig = "";
private _selectedCode = "";
private _type = "";

{
  private _config = _x;
  private _condition = [(_config >> "condition"), "text", "true"] call CBA_fnc_getConfigEntry;
  private _code = compile ([(_config >> "code"), "text", ""] call CBA_fnc_getConfigEntry);
    if (call compile _condition) then {
        _selectedConfig = _x;
        _selectedCode = _code;
    };
} forEach _allVariants;

_type = configName _selectedConfig;

private _startVehicle = [west, _position, BLUFOR_SPAWN_DISTANCE, _type, _selectedCode] call BC_setup_fnc_spawnStartVehicle;

waitUntil {
    !isNil "US_VEHICLE_SPAWN"
};


BLUFOR_TELEPORT_TARGET = [west] call BC_setup_fnc_getStartVehiclePos;
publicVariable "BLUFOR_TELEPORT_TARGET";

BLUFOR_TELEPORTED = true;
publicVariable "BLUFOR_TELEPORTED";

[BLUFOR_TELEPORT_TARGET, 50] remoteExec ["BC_setup_fnc_teleportPlayer", west, true];
[BLUFOR_TELEPORT_TARGET, west] remoteExec ["BC_setup_fnc_createStartMarker", west, true];
