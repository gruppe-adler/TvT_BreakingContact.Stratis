#include "\z\ace\addons\main\script_component.hpp"

_points = _this;
_pointsRatio = _points / (GRAD_TICKS_NEEDED * GRAD_INTERVALS_NEEDED);

if (_pointsRatio >= grad_ticks_nextWarning) then { // alle 10% die Warnung
	_string = "";

	if (!FACTIONS_DEFAULT) then {
		_string_1 = localize "str_GRAD_transmissionTime_1";
	} else {
		_string_1 = localize "str_GRAD_transmissionTime_1_mud";
	};
	_string = _string_1 + " " + (str (round(_pointsRatio * 100))) + " " + localize "str_GRAD_transmissionTime_2";
	[_string] call EFUNC(common,displayTextStructured);
	playSound "beep";
	grad_ticks_nextWarning = grad_ticks_nextWarning + 0.1;
};