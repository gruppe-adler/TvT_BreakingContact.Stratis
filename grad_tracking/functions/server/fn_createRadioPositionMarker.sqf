params ["_center"];

_count = ["GRAD_INTERVALS_NEEDED", 1] call BIS_fnc_getParamValue;

/* if (_count isEqualTo 1) exitWith { diag_log format ["no random locations necessary"]; }; */

_possibleLocations = nearestLocations [_center, ["NameCity", "NameCityCapital", "NameVillage"], worldSize, _center];

_selectedLocations = [];

for "_i" from 0 to ((count _possibleLocations) - 1) do {

	if (count _possibleLocations < 1) exitWith {
		diag_log format ["ERROR when creating radio locations: not enough villages in reach."]
	};
	// one position should be nearest to spawn
	if (_i isEqualTo 0) then {
		_location = _possibleLocations select 0;
		_possibleLocations = _possibleLocations - [_location];
		_selectedLocations = _selectedLocations + [_location];
	} else {
		_location = selectRandom _possibleLocations;
		_possibleLocations = _possibleLocations - [_location];
		_selectedLocations = _selectedLocations + [_location];
	};
};

missionNamespace setVariable ["GRAD_tracking_radioPositions", _selectedLocations, true];
[_selectedLocations] remoteExec ["GRAD_tracking_fnc_createRadioPositionMarkerLocal", east, true];