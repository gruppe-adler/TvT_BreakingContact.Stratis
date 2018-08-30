
// TODO NOT NEEDED?

params ["_pos"];
     
_name = format ["marker_radio_%1", str _pos];
_name = _name splitString " " joinString ""; // remove whitespaces

_marker = createMarkerLocal [_name, _pos];

_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "hd_flag";
_marker setMarkerAlphaLocal 1;
_marker setMarkerColorLocal "ColorOpfor";
_marker setMarkerTextLocal " 0 %";

_name2 = format ["marker_radio_%1_radiusInner", str _pos];
_name2 = _name2 splitString " " joinString ""; // remove whitespaces

_marker2 = createMarkerLocal [_name2, _pos];

_marker2 setMarkerShapeLocal "ELLIPSE";
_marker2 setMarkerSizeLocal [GRAD_MIN_DISTANCE_TO_RADIOPOSITION/2, GRAD_MIN_DISTANCE_TO_RADIOPOSITION/2];
_marker2 setMarkerAlphaLocal 0.25;
_marker2 setMarkerBrushLocal "Solid";
_marker2 setMarkerColorLocal "ColorBlack";


_name3 = format ["marker_radio_%1_radiusOuter", str _pos];
_name3 = _name3 splitString " " joinString ""; // remove whitespaces

_marker3 = createMarkerLocal [_name3, _pos];

_marker3 setMarkerShapeLocal "ELLIPSE";
_marker3 setMarkerSizeLocal [GRAD_MIN_DISTANCE_TO_RADIOPOSITION, GRAD_MIN_DISTANCE_TO_RADIOPOSITION];
_marker3 setMarkerAlphaLocal 0.3;
_marker3 setMarkerBrushLocal "Border";
_marker3 setMarkerColorLocal "ColorOpfor";

diag_log format ["creating marker %1 at %2", _name2, _pos];