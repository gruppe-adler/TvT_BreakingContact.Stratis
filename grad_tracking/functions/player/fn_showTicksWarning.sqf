grad_ticks_nextWarning = 0.2;

_points = _this;
_pointsRatio = _points / (GRAD_TICKS_NEEDED * GRAD_INTERVALS_NEEDED);

if (_pointsRatio >= grad_ticks_nextWarning) then { // alle 10% die Warnung
	_string = localize "str_GRAD_transmissionTime_1" + " " + (str (round(_pointsRatio * 100))) + " " + localize "str_GRAD_transmissionTime_2";
	[_string] call EFUNC(common,displayTextStructured);
	playSound "beep";
	grad_ticks_nextWarning = grad_ticks_nextWarning + 0.1;
};