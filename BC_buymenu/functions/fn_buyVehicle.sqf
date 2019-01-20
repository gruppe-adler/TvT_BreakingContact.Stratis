/*  Spawns vehicle
*
*   ripoff from grad-lbm, tweaked to prefer roads    
*/

// params ["_side","_code","_baseConfigName","_categoryConfigName","_itemConfigName","_spawnPosition", "_spawnDir", "_driverGPS", "_crew", "_crewHelmet", "_disableTIEquipment", "_itemCargo", "_magazineCargo", "_trackCargo", "_wheelCargo", "_removeMagazines", "_canMoveDuringTransmission"];

params [
    "_side", 
    ["_startVehicle", objNull],
    "_spawnPosition", 
    "_spawnDir",
    "_data"
];

diag_log format ["buyVehicle: %1 - %2 - %3 - %4", _side, _spawnPosition, _spawnDir, _data];

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

private _spawnEmpty = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "spawnEmpty"), "number", -1] call CBA_fnc_getConfigEntry;
if (_spawnEmpty == -1) then {
    _spawnEmpty = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> "spawnEmpty"), "number", 1] call CBA_fnc_getConfigEntry;
};

//spawn vehicle
private _vehicle = _itemConfigName createVehicle [0,0,0]; // create elsewhere so you dont see the rotation glitch
_vehicle setDir _spawnDir;
_spawnPosition set [2,0.6]; // elevate a bit in case of bumps in the road or other shit instaploding

_vehicle setPos _spawnPosition;

//bis vehicle init
private _init = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "vehicleInit"), "text", "[[],[]]"] call CBA_fnc_getConfigEntry;
private _compiledInit = call compile _init;
_compiledInit params ["_initTexture", "_initAnimationsource"];

[_vehicle, _initTexture, _initAnimationsource] call BIS_fnc_initVehicle;

// spawn empty
if (_spawnEmpty == 1) then {
    clearBackpackCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
};


// diag_log format ["buy vehicle helmet %1", _crewHelmet];

// add crew helmets as many as crew slots
if (_crewHelmet != "") then {
    _vehicle addItemCargoGlobal [_crewHelmet, _crew];
};

// disable thermals if set
if (_disableTIEquipment == "true") then {
    _vehicle disableTIEquipment true;
};

if (_driverGPS) then {
    _vehicle addItemCargoGlobal ["ItemGPS", 1];
};

if (count _removeMagazines > 0) then {
    _vehicle removeMagazineGlobal _removeMagazines;
};

// todo add condition config
if (true) then {
    
    {
        _x params ["_type", "_turretpath", "_ammoCount", "_id", "_creator"];

        private _ammo = [configfile >> "CfgMagazines" >> _type >> "ammo", "string", ""] call CBA_fnc_getConfigEntry;
        private _splashDamage = [configfile >> "CfgAmmo" >> _ammo >> "indirectHit", "number", 0] call CBA_fnc_getConfigEntry;
        private _splashRange = [configfile >> "CfgAmmo" >> _ammo >> "indirectHitRange", "number", 0] call CBA_fnc_getConfigEntry;
        
        if (_splashRange > 3 && _splashDamage > 0) then {
            _vehicle removeMagazinesTurret [_type, _turretpath];
            diag_log format ["removing ammo %1 from %2, splash damage is %3 and range %4", 
            _ammo, _vehicle, _splashDamage, _splashRange];
        };

    } forEach (magazinesAllTurrets _vehicle);
};


// add items + magazines
if (count _itemCargo > 0)  then {
    {   
        _x params ["_classname", "_count"];
        _vehicle addItemCargoGlobal [_classname, _count];
    } forEach _itemCargo;
};

// add items + magazines
if (count _magazineCargo > 0)  then {
    {   
        _x params ["_classname", "_count"];
        _vehicle addItemCargoGlobal [_classname, _count];
    } forEach _magazineCargo;
};

// add spare wheels/tracks
if (_trackCargo > 0) then {
    ['AddCargoByClass', ['ACE_track', _vehicle, _trackCargo], _vehicle] call CBA_fnc_targetEvent;
};
if (_wheelCargo > 0) then {
    ['AddCargoByClass', ['ACE_wheel', _vehicle, _wheelCargo], _vehicle] call CBA_fnc_targetEvent;
};


_vehicle setVariable ["BC_canMoveDuringTransmission", _canMoveDuringTransmission, true];
_vehicle setVariable ["BC_terminal_position_offset", _terminal_position_offset, true];
_vehicle setVariable ["BC_terminal_position_vectorDirAndUp", _terminal_position_vectorDirAndUp, true];
_vehicle setVariable ["BC_antennaOffset", _antennaOffset, true];
_vehicle setVariable ["ace_vehiclelock_lockSide", _side, true];


[_vehicle, _startVehicle] call _code;

//vehicle marker
_c1 = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> "vehicleMarkers"), "number", 2] call CBA_fnc_getConfigEntry;
_c2 = [(missionConfigFile >> "CfgGradBuymenu" >> "vehicleMarkers"), "number", 1] call CBA_fnc_getConfigEntry;
switch (true) do {
    case (_c1 == 1): {
        [_vehicle, _baseConfigName, _categoryConfigName, _itemConfigName] remoteExec ["BC_buymenu_fnc_vehicleMarker", _side, false];
    };
    case (_c1 == 0): {false};
    case (_c2 == 1): {
        [_vehicle, _baseConfigName, _categoryConfigName, _itemConfigName] remoteExec ["BC_buymenu_fnc_vehicleMarker", _side, false];
    };
    default {false};
};


//track
if (missionNamespace getVariable  ["grad_lbm_trackingTag",""] != "") then {
    [_baseConfigName,_categoryConfigName,_itemConfigName] call GRAD_lbm_tracking_fnc_trackPurchase;
};

_vehicle
