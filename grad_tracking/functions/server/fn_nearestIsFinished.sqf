params ["_obj"];

private ["_nearestIsFinished"];

_pos = getPos _obj;

_localRadioLocations = missionNamespace getVariable ["GRAD_tracking_radioPositions", []];
_finishedRadioLocations = missionNamespace getVariable ["GRAD_tracking_radioPositionsFinished", []];

_currentLocation = [_localRadioLocations, getPos _obj] call BIS_fnc_nearestPosition;
_finishedLocation = [_finishedRadioLocations, getPos _obj] call BIS_fnc_nearestPosition;

_nearestIsFinished = _currentLocation distance _pos > _finishedLocation distance _pos;

_nearestIsFinished