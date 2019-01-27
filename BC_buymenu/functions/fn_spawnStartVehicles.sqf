params ["_opforCommander", "_opforSpawnPosition"];

diag_log format ["fn_spawnStartVehicles: start"];

BUYABLES_OPFOR_INDEX = ["BUYABLES_OPFOR", -1] call BIS_fnc_getParamValue;
BUYABLES_BLUFOR_INDEX = ["BUYABLES_BLUFOR", -1] call BIS_fnc_getParamValue;

private _factionBlufor = "getText (_x >> 'side') == 'Blufor'" configClasses (missionConfigFile >> "CfgGradBuymenu") select BUYABLES_BLUFOR_INDEX;
private _buyablesBlufor = configName (_factionBlufor);

private _factionOpfor = "getText (_x >> 'side') == 'Opfor'" configClasses (missionConfigFile >> "CfgGradBuymenu") select BUYABLES_BLUFOR_INDEX;
private _buyablesOpfor = configName (_factionOpfor);

private _opforPosition = [_opforSpawnPosition, 1] call BC_buymenu_fnc_getSpawnPosition;
private _bluforPosition = [_opforSpawnPosition, BLUFOR_SPAWN_DISTANCE] call BC_buymenu_fnc_getSpawnPosition;

if (count _opforPosition == 0 || count _bluforPosition == 0) exitWith {
    [ "gui_spawn_opfor"] remoteExec ["createDialog", _opforCommander];
    ["No road position found, please choose another Spawn location"] remoteExec ["hint", _opforCommander];
};

diag_log format ["fn_spawnStartVehicles: got positions %1 - %2", _opforPosition, _bluforPosition];

{   
    _x params ["_buyables", "_position", "_blockedPosition", "_side"];

    diag_log format ["_buyables %1", _buyables];

    private _type = [_buyables] call BC_buymenu_fnc_getStartVehicleClassname;
    private _data = [_buyables, _type, true] call BC_buymenu_fnc_getVehicleParams;

    diag_log format ["call to buyvehicle: %1 - %2 - %3", _side, _position, _data];
    // todo set dir according to roads
    private _roadDir = random 360;
    private _nearestRoad = [_position, 20, []] call BIS_fnc_nearestRoad;
    if (!isNull _nearestRoad) then {
        private _roadsConnectedTo = roadsConnectedTo _nearestRoad;
        if (count _roadsConnectedTo > 0) then {
            private _connectedRoad = _roadsConnectedTo select 0;
            _roadDir = [_nearestRoad, _connectedRoad] call BIS_fnc_DirTo;
        };
    };

    private _startVehicle = [_side, objNull, _position, _roadDir, _data] call BC_buymenu_fnc_buyVehicle;

    diag_log format ["fn_getVehicleParams: _position of start vehicle %2: %1", _position, _side];
    [_position, _side] remoteExec ["BC_setup_fnc_createStartMarker", _side];

    

    ["startVehicle",[_startVehicle, _side]] call CBA_fnc_globalEvent;
    // lets make TELEPORT_TARGETS deprecated
    if (_side == east) then {
        OPFOR_TELEPORT_TARGET = _position;
        publicVariable "OPFOR_TELEPORT_TARGET";

        // dirty but position didnt get properly executed with remoteexec
        [OPFOR_TELEPORT_TARGET] remoteExec ["BC_setup_fnc_teleportPlayer", east, true];
        [OPFOR_TELEPORT_TARGET, east] remoteExec ["BC_setup_fnc_createStartMarker", east, true];
    } else {
        BLUFOR_TELEPORT_TARGET = _position;
        publicVariable "BLUFOR_TELEPORT_TARGET";

        [BLUFOR_TELEPORT_TARGET] remoteExec ["BC_setup_fnc_teleportPlayer", west, true];
        [BLUFOR_TELEPORT_TARGET, west] remoteExec ["BC_setup_fnc_createStartMarker", west, true];
    };
} forEach [
    [_factionOpfor, _opforPosition, [], east],
    [_factionBlufor, _bluforPosition, _opforPosition, west]
];

// leader information for both sides
[] call BC_setup_fnc_showLeaderInformation;