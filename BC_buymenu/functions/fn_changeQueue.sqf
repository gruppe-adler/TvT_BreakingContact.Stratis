params ["_add", "_data"];

private _currentQueue = missionNamespace getVariable ["BC_buymenu_vehicleSpawnQueue", []];

if (_add) then {
    _currentQueue pushBack _data;
} else {
    _currentQueue deleteAt (_currentQueue find _data);
};

missionNamespace setVariable ["BC_buymenu_vehicleSpawnQueue", _currentQueue];