_markerPos = _this select 0;

_marker = createMarkerLocal [format["gunfight_shape_%1",_markerPos],_markerPos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerColorLocal "ColorUnknown";
_marker setMarkerSizeLocal [200,200];

_marker2 = createMarkerLocal [format["gunfight_icon_%1",_markerPos],_markerPos];
_marker2 setMarkerShapeLocal "ICON";
_marker2 setMarkerTypeLocal "hd_warning";
_marker2 setMarkerColorLocal "ColorUnknown";

_markerAlpha = 0.5;

diag_log format ["CivGunfight: Marker %1 created", _marker];

for "_i" from 0 to 49 do
{
  _markerAlpha = _markerAlpha - 0.01;
  _marker setMarkerAlphaLocal _markerAlpha;
  sleep 2;
};
deleteMarkerLocal _marker;
deleteMarkerLocal _marker2;
