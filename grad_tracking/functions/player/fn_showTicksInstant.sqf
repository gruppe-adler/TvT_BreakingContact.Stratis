#include "\z\ace\addons\main\script_component.hpp"

params ["_side"];

if (playerSide == _side) then {
	_pointsRatio = GRAD_TICKS_DONE / GRAD_TICKS_NEEDED;
	if (!FACTIONS_DEFAULT) then {
		_string_1 = localize "str_GRAD_transmissionTime_1";
	} else {
		_string_1 = localize "str_GRAD_transmissionTime_1_mud";
	};
	_string = _string_1 + " " + (str (round(_pointsRatio * 100))) + " " + localize "str_GRAD_transmissionTime_2";
	[_string] call EFUNC(common,displayTextStructured);
};