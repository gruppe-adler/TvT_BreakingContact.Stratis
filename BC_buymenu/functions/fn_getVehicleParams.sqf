params ["_baseConfig", "_itemConfig", "_isStartVehicle"];

private _baseConfigName = configName _baseConfig;
private _categoryConfig = (([_itemConfig, false] call BIS_fnc_returnParents) select 0);
private _categoryConfigName = configName _categoryConfig;
private _itemConfigName = configName _itemConfig;

private _isSpecial = ([(_categoryConfig >> "kindOf"), "text", ""] call CBA_fnc_getConfigEntry) isEqualTo "Special";
private _driverGPS = [(_categoryConfig >> "driverGPS"), "text", "true"] call CBA_fnc_getConfigEntry isEqualTo "true";
private _crewHelmet = [(_categoryConfig >> "crewHelmet"), "text", ""] call CBA_fnc_getConfigEntry;
private _disableTIEquipment = [(_categoryConfig >> "disableTIEquipment"), "text", "true"] call CBA_fnc_getConfigEntry;

diag_log format ["_baseConfig %1, _itemConfig %2, _isStartVehicle %3", _baseConfig, _itemConfig, _isStartVehicle];


private _canMoveDuringTransmission = [(_baseConfig >> "StartVehicle" >> "canMoveDuringTransmission"), "text", "false"] call CBA_fnc_getConfigEntry isEqualTo "true";
private _terminal_position_offset = ([(_baseConfig >> "StartVehicle" >> "terminalPositionOffset"), "array", []] call CBA_fnc_getConfigEntry);
private _terminal_position_vectorDirAndUp = ([(_baseConfig >> "StartVehicle" >> "terminalVectorDirAndUp"), "array", []] call CBA_fnc_getConfigEntry);
private _antennaOffset = ([(_baseConfig >> "StartVehicle" >> "antennaOffset"), "array", []] call CBA_fnc_getConfigEntry);

// diag_log format ["_canMoveDuringTransmission %1", _canMoveDuringTransmission];

private _displayName = [(_itemConfig >> "displayName"), "text", [_itemConfigName] call grad_lbm_fnc_getDisplayName] call CBA_fnc_getConfigEntry;
private _stock = [(_itemConfig >> "stock"), "number", 999999] call CBA_fnc_getConfigEntry;
private _description = [(_itemConfig >> "description"), "text", [_itemConfigName] call grad_lbm_fnc_getDescription] call CBA_fnc_getConfigEntry;
private _code = compile ([(_itemConfig >> "code"), "text", ""] call CBA_fnc_getConfigEntry);

diag_log format ["reading _stock %1", _stock];

private _picturePath = [(_itemConfig >> "picturePath"), "text", ""] call CBA_fnc_getConfigEntry;
if (_picturePath isEqualTo "") then {
    _picturePath = getText (configfile >> "CfgVehicles" >> _itemConfigName >> "editorPreview");
};

private _itemCargo = [(_itemConfig >> "itemCargo"), "array", []] call CBA_fnc_getConfigEntry;
private _magazineCargo = [(_itemConfig >> "magazineCargo"), "array", []] call CBA_fnc_getConfigEntry;
private _trackCargo = [(_itemConfig >> "trackCargo"), "number", 0] call CBA_fnc_getConfigEntry;
private _wheelCargo = [(_itemConfig >> "wheelCargo"), "number", 0] call CBA_fnc_getConfigEntry;

private _removeMagazines = [(_itemConfig >> "removeMagazines"), "array", []] call CBA_fnc_getConfigEntry;

private _crew = [_itemConfigName,false] call BIS_fnc_crewCount;
private _fullCrew = [_itemConfigName,true] call BIS_fnc_crewCount;
private _cargo = _fullCrew - _crew;

// diag_log format ["_crew %1", _crew];

private _speed = 0;
if (!isNull (configFile >> "CfgVehicles" >> _itemConfigName >> "maxSpeed")) then {
     _speed = getNumber( configFile >> "CfgVehicles" >> _itemConfigName >> "maxSpeed" );
};

// add missing stuff
private _categoryConfigName = if (_isStartVehicle) then { "StartVehicle" } else { _baseConfigName };
private _baseConfigName = configName (([_baseConfig, false] call BIS_fnc_returnParents) select 0);


// diag_log format ["get vehicle params helmet %1", _crewHelmet];

[
    _baseConfigName,
    _categoryConfigName, 
    _itemConfigName,
    _stock,
    _displayName,
    _description,
    _picturePath,
    _canMoveDuringTransmission,
    _terminal_position_offset,
    _terminal_position_vectorDirAndUp,
    _antennaOffset,
    _crew, 
    _cargo, 
    _speed,
    _isSpecial, 
    _driverGPS, 
    _crewHelmet, 
    _disableTIEquipment, 
    _itemCargo, 
    _magazineCargo, 
    _trackCargo, 
    _wheelCargo, 
    _removeMagazines,
    _code
]
