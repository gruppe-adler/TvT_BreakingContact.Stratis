params ["_position"];

OPFOR_TELEPORT_TARGET = _position;
publicVariable "OPFOR_TELEPORT_TARGET";

OPFOR_TELEPORTED = true;
publicVariable "OPFOR_TELEPORTED";


BUYABLES_OPFOR_INDEX = ["BUYABLES_OPFOR", -1] call BIS_fnc_getParamValue;
private _sideFactions = "getText (_x >> 'side') == 'Opfor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
private _faction = (_sideFactions select BUYABLES_OPFOR_INDEX);
private _startVehicle = ("configName _x == 'StartVehicle'" configClasses _faction) select 0;
private _allVariants = "true" configClasses (missionConfigFile >> "CfgGradBuymenu" >> (configName _faction) >> (configName _startVehicle));

private _selectedCode = "";
private _selectedConfig = "";
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

private _terminal_position_offset = call compile ([(_selectedConfig >> "terminalPositionOffset"), "text", ""] call CBA_fnc_getConfigEntry);
private _terminal_position_vectorDirAndUp = call compile ([(_selectedConfig >> "terminalVectorDirAndUp"), "text", ""] call CBA_fnc_getConfigEntry);
private _antennaOffset = call compile ([(_selectedConfig >> "antennaOffset"), "text", ""] call CBA_fnc_getConfigEntry);

private _startVehicle = [east, _position, 0, _type, _selectedCode] call BC_setup_fnc_spawnStartVehicle;
_startVehicle setVariable ["BC_terminalPositionOffset", _terminal_position_offset, true];
_startVehicle setVariable ["BC_terminalVectorDirAndUp", _terminal_position_vectorDirAndUp, true];
_startVehicle setVariable ["BC_antennaOffset", _antennaOffset, true];


waitUntil {
    !isNil "RUS_VEHICLE_SPAWN"
};

[_position] spawn BC_setup_fnc_publishBluforTeleportTarget;

[OPFOR_TELEPORT_TARGET, 50] remoteExec ["BC_setup_fnc_teleportPlayer", east, true];
[OPFOR_TELEPORT_TARGET, east] remoteExec ["BC_setup_fnc_createStartMarker", east, true];

// leader information for both sides
[] call BC_setup_fnc_showLeaderInformation;
