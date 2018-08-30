// _pos = _this select 0;
// _trackingPrecision = _this select 1;

params ["_pos", "_trackingPrecision"];

randomize_coord = {
	params ["_coord","_precision"];
	_coord + random(_precision * 2) - _precision
};

randomize_pos =
{
	params ["_pos","_precision"];
	private ["_randomizedPos", "_trueX", "_trueY"];
	_trueX = _pos select 0;
	_trueY = _pos select 1;
	_randomizedPos = [
	[_trueX,_precision] call randomize_coord,
	[_trueY,_precision] call randomize_coord,
	_pos select 2
	];
	_randomizedPos
};


_markerPos = _pos;
_markerPos = [_pos,_trackingPrecision] call randomize_pos;

_marker = createMarkerLocal [format ["pilotmarker_%1", _markerPos],_markerPos];
_marker setMarkerTypeLocal "mil_unknown";
_marker setMarkerColorLocal "ColorBlufor";
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [_trackingPrecision*2, _trackingPrecision*2];
_marker setMarkerBrushLocal "Solid";
_marker setMarkerAlphaLocal 0.5;

_marker2 = createMarkerLocal [format["pilotmarker_icon_%1",_markerPos],_markerPos];
_marker2 setMarkerShapeLocal "ICON";
_marker2 setMarkerTypeLocal "hd_warning";
_marker2 setMarkerColorLocal "ColorBlufor";