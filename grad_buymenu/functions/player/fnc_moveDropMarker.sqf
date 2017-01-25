fnc_moveDropMarker = {
    _pos = _this select 0;
    _marker = _this select 1;

    _marker setMarkerPos _pos;

    diag_log format ["moving marker %1 to %2",_marker,_pos];
};
