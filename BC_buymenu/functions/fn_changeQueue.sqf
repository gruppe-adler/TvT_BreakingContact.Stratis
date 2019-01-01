params ["_add", "_baseConfigName", "_data"];

private _identifier = format ["BC_buymenu_spawnQueue_%1", _baseConfigName];
private _currentQueue = missionNamespace getVariable [_identifier, []];

if (_add) then {
    _currentQueue pushBack _data;
} else {
    _currentQueue deleteAt (_currentQueue find _data);
};

diag_log format ["_currentQueue %1", _currentQueue];

missionNamespace setVariable [_identifier, _currentQueue, true];