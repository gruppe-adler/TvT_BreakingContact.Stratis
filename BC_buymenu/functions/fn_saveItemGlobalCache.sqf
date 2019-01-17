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

private _identifier = format ["BC_buymenu_boughtItemCache_%1_%2", _baseConfigName, _itemConfigName];
private _vehicleCountCacheValue = missionNamespace getVariable [_identifier, 0];

if (_add) then {
    _vehicleCountCacheValue = _vehicleCountCacheValue + 1;
} else {    
    if (_vehicleCountCacheValue > 0) then {
        _vehicleCountCacheValue = _vehicleCountCacheValue - 1;
    };
};

// diag_log format ["saving _vehicleCountCacheValue %1 : %2", _identifier, _vehicleCountCacheValue];
missionNamespace setVariable [_identifier, _vehicleCountCacheValue, true];