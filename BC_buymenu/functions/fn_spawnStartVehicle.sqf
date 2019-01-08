params ["_opforSpawnPosition"];

BUYABLES_OPFOR_INDEX = ["BUYABLES_OPFOR", -1] call BIS_fnc_getParamValue;
BUYABLES_BLUFOR_INDEX = ["BUYABLES_BLUFOR", -1] call BIS_fnc_getParamValue;

private _factionsBlufor = "getText (_x >> 'side') == 'Blufor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
private _buyablesBlufor = configName (_factionsBlufor select BUYABLES_BLUFOR_INDEX);

private _factionsOpfor = "getText (_x >> 'side') == 'Opfor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
private _buyablesOpfor = configName (_factionsOpfor select BUYABLES_OPFOR_INDEX);

private _nearestRoadPosition = [
    _opforSpawnPosition, 
    0, 
    random 360, 
    0,
    [2,1000], 
    [0,"rhsusf_CH53E_USMC"]
] call SHK_pos;

if (count _nearestRoadPosition < 1) exitWith {
    hint "no road position found";
};


{
    [_x]

} forEach [_buyablesOpfor, _buyablesBlufor];


[
    _unit,
    _unit,
    0,
    _code,
    _baseConfigName,
    _categoryConfigName,
    _itemConfigName,
    _roadPos,
    _roadDir,
    _driverGPS,
    _crew,
    _crewHelmet,
    _disableTIEquipment,
    _itemCargo,
    _magazineCargo,
    _trackCargo,
    _wheelCargo,
    _removeMagazines,
    _canMoveDuringTransmission
] call BC_buymenu_fnc_buyVehicle;