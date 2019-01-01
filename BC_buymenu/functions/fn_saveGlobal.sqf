params ["_add", "_identifier", "_classname"];

private _identifier = format ["BC_buymenu_buyList_%1", _identifier];
private _boughtVehicles = missionNamespace getVariable [_identifier, []];

if (_add) then {
    _boughtVehicles pushBack _classname; 
} else {
    _boughtVehicles deleteAt (_boughtVehicles find _classname);
};

missionNamespace setVariable [_identifier, _boughtVehicles, true];