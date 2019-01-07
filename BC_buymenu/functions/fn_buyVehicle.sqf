/*  Spawns vehicle
*
*   ripoff from grad-lbm, tweaked to prefer roads    
*/

params ["_buyer","_account","_price","_code","_baseConfigName","_categoryConfigName","_itemConfigName","_spawnPosition", "_spawnDir", "_driverGPS", "_crew", "_crewHelmet", "_disableTIEquipment", "_itemCargo", "_magazineCargo", "_trackCargo", "_wheelCargo", "_removeMagazines"];

diag_log format ["%1 - %2 - %3", _crewHelmet, _crew, _removeMagazines];

private _spawnEmpty = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "spawnEmpty"), "number", -1] call CBA_fnc_getConfigEntry;
if (_spawnEmpty == -1) then {
    _spawnEmpty = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> "spawnEmpty"), "number", 0] call CBA_fnc_getConfigEntry;
};

private _sideBuyer = side _buyer;

//spawn vehicle
private _vehicle = _itemConfigName createVehicle [0,0,0];
_vehicle setDir _spawnDir;
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

_vehicle setVariable ["ace_vehiclelock_lockSide", _sideBuyer, true];


[_buyer,_itemConfigName,_vehicle,_spawnPosition] call _code;
[[_buyer,_itemConfigName,_vehicle,_spawnPosition],_code] remoteExec ["grad_lbm_fnc_callCodeClient",0,false];

//vehicle marker
_c1 = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> "vehicleMarkers"), "number", 2] call CBA_fnc_getConfigEntry;
_c2 = [(missionConfigFile >> "CfgGradBuymenu" >> "vehicleMarkers"), "number", 1] call CBA_fnc_getConfigEntry;
switch (true) do {
    case (_c1 == 1): {
        [_buyer, _vehicle, _baseConfigName, _categoryConfigName, _itemConfigName] remoteExec ["BC_buymenu_fnc_vehicleMarker", side _buyer, false];
    };
    case (_c1 == 0): {false};
    case (_c2 == 1): {
        [_buyer, _vehicle, _baseConfigName, _categoryConfigName, _itemConfigName] remoteExec ["BC_buymenu_fnc_vehicleMarker", side _buyer, false];
    };
    default {false};
};


//track
if (missionNamespace getVariable  ["grad_lbm_trackingTag",""] != "") then {
    [_baseConfigName,_categoryConfigName,_itemConfigName] call GRAD_lbm_tracking_fnc_trackPurchase;
};
