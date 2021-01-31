_prev = GRAD_ANTENNA_MARKER_POS;
GRAD_ANTENNA_MARKER_POS = _this;
if ((_prev select 0 != GRAD_ANTENNA_MARKER_POS select 0) ||
      (_prev select 1 != GRAD_ANTENNA_MARKER_POS select 1)) then {
      publicVariable "GRAD_ANTENNA_MARKER_POS";
};