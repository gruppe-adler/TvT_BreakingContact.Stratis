params ["_center"];

private _currentLocations = missionNamespace getVariable ["GRAD_tracking_radioPositions", []];
private _finishedLocations = missionNamespace getVariable ["GRAD_tracking_radioPositionsFinished", []];
private _addLocation = _currentLocations + [_center];

private _anotherCloseBy = false;

{
     if (_x distance _center < GRAD_MIN_DISTANCE_TO_RADIOPOSITION) then {
          _anotherCloseBy = true;
     };
} forEach _currentLocations + _finishedLocations;

// rescue exit if flag is planted too close to other flags
if (_anotherCloseBy) exitWith { [0,0,0]; };

missionNamespace setVariable ["GRAD_tracking_radioPositions", _addLocation, true];
[_center] remoteExec ["GRAD_tracking_fnc_createRadioPositionMarkerLocal", east, true];

// execute on server to have reference points
if (isMultiplayer) then {
     [_center] call GRAD_tracking_fnc_createRadioPositionMarkerLocal;
};

_center