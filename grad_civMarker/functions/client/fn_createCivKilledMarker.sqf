_markerPos = _this select 0;

_marker = createMarkerLocal [format["civkill_shape_%1",_markerPos],_markerPos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerColorLocal "ColorCivilian";
_marker setMarkerSizeLocal [200,200];

_marker2 = createMarkerLocal [format["civkill_icon_%1",_markerPos],_markerPos];
_marker2 setMarkerShapeLocal "ICON";
_marker2 setMarkerTypeLocal "KIA";
_marker2 setMarkerColorLocal "ColorCivilian";

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


diag_log format ["CivKills: Marker %1 created", _marker];
