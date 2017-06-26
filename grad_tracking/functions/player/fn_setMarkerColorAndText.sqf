params ["_location", "_color", "_text"];

_markerName = format["marker_radio_%1", name _location];

_marker setMarkerColorLocal _color;
_marker setMarkerTextLocal _text;