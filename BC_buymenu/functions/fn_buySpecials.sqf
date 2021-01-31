params ["_vehicle", "_startVehicle", "_data", "_unit"];

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

diag_log format ["_code %1, _stock %2", _code, _stock];

[_vehicle, _startVehicle, _unit] call _code;