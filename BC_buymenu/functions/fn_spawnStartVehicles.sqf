params ["_opforCommander", "_opforSpawnPosition"];

BUYABLES_OPFOR_INDEX = ["BUYABLES_OPFOR", -1] call BIS_fnc_getParamValue;
BUYABLES_BLUFOR_INDEX = ["BUYABLES_BLUFOR", -1] call BIS_fnc_getParamValue;

private _factionsBlufor = "getText (_x >> 'side') == 'Blufor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
private _buyablesBlufor = configName (_factionsBlufor select BUYABLES_BLUFOR_INDEX);

private _factionsOpfor = "getText (_x >> 'side') == 'Opfor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
private _buyablesOpfor = configName (_factionsOpfor select BUYABLES_OPFOR_INDEX);

private _opforPosition = [_opforSpawnPosition, 1] call BC_buymenu_fnc_getSpawnPosition;
private _bluforPosition = [_bluforSpawnPosition, BLUFOR_SPAWN_DISTANCE] call BC_buymenu_fnc_getSpawnPosition;

if (count _opforPosition == 0 || count _bluforPosition == 0) exitWith {
    [ "gui_spawn_opfor"] remoteExec ["createDialog", _opforCommander];
    ["No road position found, please choose another Spawn location"] remoteExec ["hint", _opforCommander];
};


{   
    _x params ["_buyables", "_position", "_side"];

    private _type = [_x] call BC_buymenu_fnc_getStartVehicleClassname;
    private _params [_type] call BC_buymenu_fnc_getVehicleParams;

    [_position, _type, _params] call BC_buymenu_fnc_buyVehicle;
    [_position, _side] remoteExec ["BC_setup_fnc_createStartMarker", _side];

} forEach [
    [_buyablesOpfor, _opforPosition, east],
    [_buyablesBlufor, _bluforPosition, west]
];