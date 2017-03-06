#include "\z\ace\addons\main\script_component.hpp"

private ["_string_1"];

ticks = _this;
ticksRatio = ticks / (GRAD_TICKS_NEEDED * GRAD_INTERVALS_NEEDED);

if (ticksRatio >= grad_ticks_nextWarning) then { // alle 10% die Warnung
	


	if (!TRACKING_PERSON) then {
		_string_1 = localize "str_GRAD_transmissionTime_1";
	} else {
		_string_1 = localize "str_GRAD_transmissionTime_1_mud";
	};
	_string = _string_1 + " " + (str (round(ticksRatio * 100))) + " " + localize "str_GRAD_transmissionTime_2";
	[_string] call EFUNC(common,displayTextStructured);
	playSound "beep";
	if (grad_ticks_nextWarning >= 0.8) then {
		if (grad_ticks_nextWarning >= 0.9) then {
			grad_ticks_nextWarning = grad_ticks_nextWarning + 0.05;
		} else {
			grad_ticks_nextWarning = grad_ticks_nextWarning + 0.2;
		};
	} else {
		grad_ticks_nextWarning = grad_ticks_nextWarning + 0.2;
	};
};