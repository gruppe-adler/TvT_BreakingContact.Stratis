params ["_min"];

_minutesString = _min + " min";

_taskName = localize "str_GRAD_classicTaskNameOpfor" + " " + _minutesString;
_taskDescription_1 =  localize "str_GRAD_classicTaskDescriptionOpfor_1";
_taskDescription_2 =  localize "str_GRAD_classicTaskDescriptionOpfor_2";

_taskDescription =  _taskDescription_1 + " " + _minutesString + " " + _taskDescription_2;

_taskTitle = localize "str_GRAD_classicTaskTitleOpfor" + " " + _minutesString;

_areaMarkerName = " target area ";

_opforTask = [
	EAST,
	_taskName,
	[
		_taskDescription,
		_taskTitle,
		_areaMarkerName
	],
	objNull,
	"AUTOASSIGNED",
	1,
	true,
	"defend"
] call BIS_fnc_taskCreate;

_opforTask