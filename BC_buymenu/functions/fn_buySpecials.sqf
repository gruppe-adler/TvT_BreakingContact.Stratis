params ["_startVehicle", "_data"];

_data params [
    "_baseConfigName",
    "_categoryConfigName",
    "_itemConfigName",
    "_spawnPosition",
    "_spawnDir",
    "_canMoveDuringTransmission",
    "_terminal_position_offset",
    "_terminal_position_vectorDirAndUp",
    "_antennaOffset",
    "_driverGPS",
    "_crew",
    "_crewHelmet",
    "_disableTIEquipment",
    "_itemCargo",
    "_magazineCargo",
    "_trackCargo",
    "_wheelCargo",
    "_removeMagazines",
    "_code"
];

[_startVehicle] call _code;