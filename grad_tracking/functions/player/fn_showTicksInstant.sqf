#include "\z\ace\addons\main\script_component.hpp"

params ["_side"];

if (playerSide == _side) then {
	_pointsRatio = GRAD_TICKS_DONE / GRAD_TICKS_NEEDED;
	_string = localize "str_GRAD_transmissionTime_1" + " " + (str (round(_pointsRatio * 100))) + " " + localize "str_GRAD_transmissionTime_2";
	[_string] call EFUNC(common,displayTextStructured);
};