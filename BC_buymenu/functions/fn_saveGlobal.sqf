params ["_add", "_baseConfigName", "_classname"];

private _identifier = format ["BC_buymenu_buyList_%1", _baseConfigName];
private _boughtVehicles = missionNamespace getVariable [_identifier, []];

if (_add) then {
    _boughtVehicles pushBack _classname; 
} else {
    _boughtVehicles deleteAt (_boughtVehicles find _classname);
};

missionNamespace setVariable [_identifier, _boughtVehicles, true];