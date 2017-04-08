params ["_min"];

_minutesString = _min + " min";

_taskName = localize "str_GRAD_afghanTaskNameBlufor" + " " + _minutesString;
_taskDescription_1 =  localize "str_GRAD_afghanTaskDescriptionBlufor";

_taskDescription =  _taskDescription_1 + " " + _minutesString;

_taskTitle = localize "str_GRAD_afghanTaskTitleBlufor";

_areaMarkerName = " target area ";

_bluforTask = [
	WEST,
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

_bluforTask