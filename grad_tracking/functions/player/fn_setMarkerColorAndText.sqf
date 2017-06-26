params ["_locationname", "_color", ["_text", ""]];

_markerName = format["marker_radio_%1", _locationname];
_markerName = _markerName splitString " " joinString ""; // remove whitespaces

/* diag_log format ["setting color and text for %1", _markerName]; */

_markerName setMarkerColorLocal _color;

if (!(_text isEqualTo "")) then {
	_markerName setMarkerTextLocal _text;
};