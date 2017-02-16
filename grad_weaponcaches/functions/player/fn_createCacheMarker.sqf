params ["_pos", "_precision", "_enemySide"];

private ["_marker", "_markerIcon", "_markerShape"];

_iconOpposing = "hd_warning";
_iconOwnerSide = "loc_bunker";



if (playerSide == _enemySide) then {

	_randomizePos = [_pos, _precision] call GRAD_weaponcaches_fnc_randomizeMarker;

	_markerIcon = createMarkerLocal [format ["mrk_weaponcache_icon_%1", str _pos], _pos];
	_markerIcon setMarkerShapeLocal "ICON";
	_markerIcon setMarkerColorLocal "ColorOpfor";
	_markerIcon setMarkerAlphaLocal 1;
	_markerIcon setMarkerTypeLocal _iconOpposing;
	_markerIcon setMarkerTextLocal " hostile area";

	_markerShape = createMarkerLocal [format ["mrk_weaponcache_icon_%1", str _pos], _pos];
	_markerShape setMarkerShapeLocal "ELLIPSE";
	_markerShape setMarkerSizeLocal [_precision,_precision];
	_markerShape setMarkerColorLocal "ColorOpfor";
	_markerShape setMarkerAlphaLocal 0.3;
	_markerShape setMarkerBrushLocal "SolidFull";

} else {

	_marker = createMarkerLocal [format ["mrk_weaponcache_icon_%1", str _pos], _pos];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerColorLocal "ColorWest";
	_marker setMarkerAlphaLocal 1;
	_marker setMarkerTypeLocal _iconOwnerSide;
	_marker setMarkerTextLocal " weapon cache";

};