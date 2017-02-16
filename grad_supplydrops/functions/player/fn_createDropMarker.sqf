params ["_pos", "_side"];

if (playerSide != _side) exitWith {};

private ["_marker"];

_marker = createMarkerLocal [format ["mrk_drop_%1", str _pos], _pos];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerColorLocal "ColorOpfor";
_marker setMarkerAlphaLocal 1;
_marker setMarkerTypeLocal "hd_pickup";
_marker setMarkerTextLocal (localize "str_GRAD_supplyDrop");

_marker