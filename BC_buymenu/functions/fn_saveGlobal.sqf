params ["_add", "_baseConfigName", "_itemConfigName"];

private _identifier = format ["BC_buymenu_buyList_%1", _baseConfigName];
private _boughtVehicles = missionNamespace getVariable [_identifier, []];

if (_add) then {
    _boughtVehicles pushBack _itemConfigName; 
} else {
    _boughtVehicles deleteAt (_boughtVehicles find _itemConfigName);
};

missionNamespace setVariable [_identifier, _boughtVehicles, true];