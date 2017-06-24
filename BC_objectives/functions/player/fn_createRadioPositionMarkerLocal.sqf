params ["_pos"];



if (!(playerSide isEqualTo east)) exitWith {};

_marker = createMarkerLocal [format["local_radio_location_%1", toString _pos],_pos];
// diag_log format ["GRAD_CIV_DEBUG: Marker %1 created", _marker];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "hd_flag";
_marker setMarkerAlphaLocal 1;
_marker setMarkerColorLocal "ColorOpfor";
_marker setMarkerTextLocal "send here";

localRadioPositionMarkers = localRadioPositionMarkers + [_marker];