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

private _identifier = format ["BC_buymenu_spawnQueue_%1", _baseConfigName];
private _currentQueue = missionNamespace getVariable [_identifier, []];

if (_add) then {
    _currentQueue pushBack _data;
} else {
    _currentQueue deleteAt (_currentQueue find _data);
};

// diag_log format ["_currentQueue %1", _currentQueue];

missionNamespace setVariable [_identifier, _currentQueue, true];