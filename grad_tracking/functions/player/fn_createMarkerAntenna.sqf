private ["_marker"];

_marker = createMarkerLocal ["mrk_antenna", [0, 0, 0]];
"mrk_antenna" setMarkerShapeLocal "ELLIPSE";
"mrk_antenna" setMarkerColorLocal "ColorOrange";
"mrk_antenna" setMarkerAlphaLocal 0;
"mrk_antenna" setMarkerSizeLocal [1, 1];
"mrk_antenna" setMarkerBrushLocal "SolidFull";

_marker