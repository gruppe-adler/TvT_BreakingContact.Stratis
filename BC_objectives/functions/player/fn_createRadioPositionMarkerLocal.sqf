
// TODO NOT NEEDED?

params ["_locations"];

for "_i" from 0 to (count _locations - 1) do {

	_location = _locations select _i;
	_pos = locationPosition _location;
	_name = name _location;

	_marker = createMarkerLocal [format["marker_radio_%1", _name],_pos];
	
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "hd_flag";
	_marker setMarkerAlphaLocal 1;
	_marker setMarkerColorLocal "ColorOpfor";
	_marker setMarkerTextLocal " 0 %";
};