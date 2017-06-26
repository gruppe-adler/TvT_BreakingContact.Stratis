
// TODO NOT NEEDED?

params ["_locations"];

for "_i" from 0 to ((count _locations) - 1) do {

	_location = _locations select _i;
	_pos = locationPosition _location;

	
	_name = format ["marker_radio_%1", text _location];
	_name = _name splitString " " joinString ""; // remove whitespaces

	_marker = createMarkerLocal [_name, _pos];
	
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "hd_flag";
	_marker setMarkerAlphaLocal 1;
	_marker setMarkerColorLocal "ColorOpfor";
	_marker setMarkerTextLocal " 0 %";

	diag_log format ["creating marker %1 at %2", _name, _pos];
};