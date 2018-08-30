#include "\z\ace\addons\main\script_component.hpp"

private ["_string"];

_interval = _this;

if (_interval >= grad_interval_nextWarning) then { // alle 10% die Warnung
	_string = 
		localize "str_GRAD_intervalReached_1" + " " +
		(str grad_interval_nextWarning) + " / " + (str GRAD_INTERVALS_NEEDED) + " " +
		localize "str_GRAD_intervalReached_2";
		
	[_string] call EFUNC(common,displayTextStructured);
	playSound "beep";
	grad_interval_nextWarning = grad_interval_nextWarning + 1;
};