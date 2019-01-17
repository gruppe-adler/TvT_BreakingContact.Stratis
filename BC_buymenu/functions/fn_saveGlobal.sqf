params ["_add", "_data"];

_data params [            
    "_baseConfigName",
    "_categoryConfigName",
    "_itemConfigName",
    "_stock",
    "_displayName",
    "_description",
    "_picturePath",
    "_canMoveDuringTransmission",
    "_terminal_position_offset",
    "_terminal_position_vectorDirAndUp",
    "_antennaOffset",
    "_crew", 
    "_cargo",
    "_speed",
    "_isSpecial",
    "_driverGPS", 
    "_crewHelmet", 
    "_disableTIEquipment",
    "_itemCargo",
    "_magazineCargo",
    "_trackCargo", 
    "_wheelCargo",
    "_removeMagazines",
    "_code"
];

private _identifier = format ["BC_buymenu_buyList_%1", _baseConfigName];
private _boughtVehicles = missionNamespace getVariable [_identifier, []];


private _vehicleCountCacheIdentifier = format ["BC_cacheValueFor_%1", _itemConfigName];
private _vehicleCountCacheValue = missionNamespace getVariable [_vehicleCountCache, 0];
private _cacheCurrentValuesForAbort = missionNamespace getVariable ["BC_cacheCurrentValuesForAbort", []];


if (_add) then {
    _boughtVehicles pushBack _itemConfigName;
    _vehicleCountCacheValue = _vehicleCountCacheValue + 1;
} else {
    _boughtVehicles deleteAt (_boughtVehicles find _itemConfigName);
    
    if (_vehicleCountCacheValue > 0) then {
        _vehicleCountCacheValue = _vehicleCountCacheValue - 1;
    };
};

_cacheCurrentValuesForAbort pushBackUnique [_vehicleCountCacheIdentifier, _vehicleCountCacheValue];


missionNamespace setVariable [_identifier, _boughtVehicles, true];
missionNamespace setVariable ["BC_cacheCurrentValuesForAbort", _cacheCurrentValuesForAbort];
