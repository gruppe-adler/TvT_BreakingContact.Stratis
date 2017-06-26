params ["_center"];

_count = ["GRAD_INTERVALS_NEEDED", 1] call BIS_fnc_getParamValue;

/* if (_count isEqualTo 1) exitWith { diag_log format ["no random locations necessary"]; }; */

_possibleLocations = nearestLocations [_center, ["NameCity", "NameCityCapital", "NameVillage"], 5500];

_selectedLocations = [];

for "_i" from 0 to (_count - 1) do {

	_location = selectRandom _possibleLocations;
	_possibleLocations = _possibleLocations - [_location];
	_selectedLocations = _selectedLocations + [_location];

};

missionNamespace setVariable ["BC_objectives_radioPositions", _selectedLocations, true];
[_selectedLocations] remoteExec ["BC_objectives_fnc_createRadioPositionMarkerLocal", east, true];