#include "\z\ace\addons\main\script_component.hpp"

params ["_side"];

private ["_string_1"];

if (playerSide == _side) then {
	_ticksRatio = GRAD_TICKS_DONE / GRAD_TICKS_NEEDED;

	if (!TRACKING_PERSON) then {
		_string_1 = localize "str_GRAD_transmissionTime_1";
	} else {
		_string_1 = localize "str_GRAD_transmissionTime_1_mud";
	};
	_string = _string_1 + " " + (str (round(_ticksRatio * 100))) + " " + localize "str_GRAD_transmissionTime_2";
	[_string] call EFUNC(common,displayTextStructured);
};