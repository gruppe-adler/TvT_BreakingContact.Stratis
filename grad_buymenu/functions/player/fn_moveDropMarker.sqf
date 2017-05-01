params ["_pos", "_marker"];

_marker setMarkerPos _pos;

diag_log format ["moving marker %1 to %2",_marker,_pos];