params ["_startPosition", "_side"];

//diag_log format ["DEBUG: %1, %2, %3", _startPosition, _conePosition, _side];

private _startPos = _startPosition;
private _conePos = [_side] call BC_setup_fnc_getSpawnPos;

private _mrk_start = createMarkerLocal [format["markerStart_%1", toString _startPos], _startPos];
_mrk_start setMarkerShapeLocal "ICON";
_mrk_start setMarkerTypeLocal "hd_pickup";

private _mrk_cone = createMarkerLocal [format["markerCone_%1", toString _conePos], _conePos];
_mrk_cone setMarkerShapeLocal "ICON";
_mrk_cone setMarkerTypeLocal "hd_start";

if (_side isEqualTo west) then {
    _mrk_start setMarkerColorLocal "ColorWEST";
    _mrk_cone setMarkerColorLocal "ColorWEST";
} else {
    _mrk_start setMarkerColorLocal "ColorEAST";
    _mrk_cone setMarkerColorLocal "ColorEAST";
};