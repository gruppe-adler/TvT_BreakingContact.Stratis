params ["_center"];

_currentLocations = missionNamespace getVariable ["GRAD_tracking_radioPositions", []];
_addLocation = _currentLocations + [_center];

missionNamespace setVariable ["GRAD_tracking_radioPositions", _addLocation];
[_center] remoteExec ["GRAD_tracking_fnc_createRadioPositionMarkerLocal", east, true];

// execute on server to have reference points
[_center] call GRAD_tracking_fnc_createRadioPositionMarkerLocal;

_center