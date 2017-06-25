params ["_center"];

_count = ["GRAD_INTERVALS_NEEDED", 1] call BIS_fnc_getParamValue;

/* if (_count isEqualTo 1) exitWith { diag_log format ["no random locations necessary"]; }; */

_possibleLocations = nearestLocations [_center, ["NameCity", "NameCityCapital", "NameVillage"], 4000];

_selectedLocations = [];

_radioPositionMarkers = [];

for "_i" from 0 to (_count - 1) do {

	_location = selectRandom _possibleLocations;
	_possibleLocations = _possibleLocations - [_location];
	_selectedLocations = _selectedLocations + [_location];

};


for "_i" from 0 to (_count - 1) do {

	_pos = locationPosition (_selectedLocations select _i);

	_marker = createMarker [format["global_radio_location_%1", toString _pos],_pos];
	// diag_log format ["GRAD_CIV_DEBUG: Marker %1 created", _marker];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "hd_flag";
	_marker setMarkerAlpha 0;
	_marker setMarkerColor "ColorOpfor";
	_marker setMarkerText " 0 %";

	_radioPositionMarkers = _radioPositionMarkers + [_marker];

};

missionNamespace setVariable ["BC_objectives_radioPositions", _radioPositionMarkers];
[_radioPositionMarkers] remoteExec ["BC_objectives_fnc_revealRadioPositionMarkers", 0, true];