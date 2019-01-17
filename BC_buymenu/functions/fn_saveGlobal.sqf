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

if (_add) then {
    _boughtVehicles pushBack _itemConfigName; 
} else {
    _boughtVehicles deleteAt (_boughtVehicles find _itemConfigName);
};

missionNamespace setVariable [_identifier, _boughtVehicles, true];

// private _cacheCurrentValuesForAbort = missionNamespace getVariable ["BC_cacheCurrentValuesForAbort", []];