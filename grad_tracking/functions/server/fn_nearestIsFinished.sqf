params ["_obj"];

private ["_nearestIsFinished"];

_pos = getPos _obj;
_nearestIsFinished = false;

_localRadioLocations = missionNamespace getVariable ["GRAD_tracking_radioPositions", []];
_finishedRadioLocations = missionNamespace getVariable ["GRAD_tracking_radioPositionsFinished", []];

_currentLocation = [_localRadioLocations, getPos _obj] call BIS_fnc_nearestPosition;
_finishedLocation = [_finishedRadioLocations, getPos _obj] call BIS_fnc_nearestPosition;

if (count _finishedRadioLocations > 0) then {     _nearestIsFinished = _currentLocation distance _pos > _finishedLocation distance _pos;
};

// diag_log format ["_nearestIsFinished %1,  _currentLocation %2, _finishedLocation %3, _finishedRadioLocations %4", 
// _nearestIsFinished, _currentLocation, _finishedLocation, _finishedRadioLocations];

_nearestIsFinished