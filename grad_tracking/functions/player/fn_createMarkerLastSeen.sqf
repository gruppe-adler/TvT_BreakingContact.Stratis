private ["_marker"];

_marker = createMarkerLocal ["mrk_lastSeen", [0, 0, 0]];
"mrk_lastSeen" setMarkerShapeLocal "ICON";
"mrk_lastSeen" setMarkerColorLocal "ColorOpfor";
"mrk_lastSeen" setMarkerAlphaLocal 0;
"mrk_lastSeen" setMarkerTypeLocal "hd_dot";
"mrk_lastSeen" setMarkerTextLocal (localize "str_GRAD_lastTransmission");

_marker