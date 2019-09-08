/* ripped from diod @prometheus */

params ["_entryName",["_defaultValue",false]];

private _return = [(missionConfigFile >> "cfgGradIslands" >> worldName), _entryName, _defaultValue] call BIS_fnc_returnConfigEntry;
if (_return isEqualTo "true") then {_return = true};
if (_return isEqualTo "false") then {_return = false};

_return
