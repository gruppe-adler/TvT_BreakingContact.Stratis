params ["_startPosition", "_side"];

private _mrk_start = createMarkerLocal [format["markerStart_%1", toString _startPosition], _startPosition];
_mrk_start setMarkerShapeLocal "ICON";
_mrk_start setMarkerTypeLocal "hd_pickup";

if (_side isEqualTo west) then {
    _mrk_start setMarkerColorLocal "ColorWEST";
} else {
    _mrk_start setMarkerColorLocal "ColorEAST";
};