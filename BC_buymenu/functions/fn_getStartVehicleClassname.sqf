/*
    _faction is baseConfigName
*/

params ["_faction"];

private _vehicle = ("configName _x == 'StartVehicle'" configClasses _faction) select 0;
private _allVariants = "true" configClasses (missionConfigFile >> "CfgGradBuymenu" >> (configName _faction) >> (configName _vehicle));

private _selectedCode = "";
private _selectedConfig = "";
private _type = "";

{
  private _config = _x;
  private _condition = [(_config >> "condition"), "text", "true"] call CBA_fnc_getConfigEntry;
  private _code = compile ([(_config >> "code"), "text", ""] call CBA_fnc_getConfigEntry);

    if (call compile _condition) then {
        _selectedConfig = _x;
        _selectedCode = _code;  
    };
} forEach _allVariants;

// return 
(configName _selectedConfig)