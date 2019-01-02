params ["_position"];

OPFOR_TELEPORT_TARGET = _position;
publicVariable "OPFOR_TELEPORT_TARGET";

OPFOR_TELEPORTED = true;
publicVariable "OPFOR_TELEPORTED";


BUYABLES_OPFOR_INDEX = ["BUYABLES_OPFOR", -1] call BIS_fnc_getParamValue;
private _faction = missionConfigFile >> "CfgGradBuymenu" >> (BUYABLES_OPFOR_VALUES select BUYABLES_OPFOR_INDEX);
private _startVehicles = "true" configClasses _faction;
private _type = "rhs_gaz66_r142_vv";
TERMINAL_POSITION_OFFSET = [(_config >> "terminalPositionOffset"), "Array", []] call CBA_fnc_getConfigEntry;
TERMINAL_POSITION_VECTORDIRANDUP = [(_config >> "terminalVectorDirAndUp"), "Array", []] call CBA_fnc_getConfigEntry;

{
  private _config = _x;
  private _condition = [(_config >> "condition"), "text", "true"] call CBA_fnc_getConfigEntry;

    if (call compile _condition) then {
    	_type = _config;
    };
} forEach _startVehicles;

private _startVehicle = [east, _position, 0, _type] call BC_setup_fnc_spawnStartVehicle;

waitUntil {
    !isNil "RUS_VEHICLE_SPAWN"
};

[_position] spawn BC_setup_fnc_publishBluforTeleportTarget;

[OPFOR_TELEPORT_TARGET, 50] remoteExec ["BC_setup_fnc_teleportPlayer", east, true];
[OPFOR_TELEPORT_TARGET, east] remoteExec ["BC_setup_fnc_createStartMarker", east, true];

// leader information for both sides
[] call BC_setup_fnc_showLeaderInformation;
