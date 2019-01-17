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

private _identifier = format ["BC_buymenu_boughtVehicleCache_%1", _itemConfigName];
private _vehicleCountCacheValue = missionNamespace getVariable [_identifier, 0];


if (_add) then {
    _boughtVehicles pushBack _itemConfigName;
    _vehicleCountCacheValue = _vehicleCountCacheValue + 1;
} else {
    _boughtVehicles deleteAt (_boughtVehicles find _itemConfigName);
    
    if (_vehicleCountCacheValue > 0) then {
        _vehicleCountCacheValue = _vehicleCountCacheValue - 1;
    };
};

missionNamespace setVariable [_identifier, _vehicleCountCacheValue, true];