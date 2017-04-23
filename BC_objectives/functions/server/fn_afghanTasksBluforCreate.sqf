params ["_min","_interval"];

_taskName = "bluforTask1";
_taskDescription =  format [localize "str_GRAD_afghanTaskDescriptionBlufor1",_interval,_min];
_taskTitle = format [localize "str_GRAD_afghanTaskTitleBlufor1",_interval,_min];
_areaMarkerName = " target area ";

_bluforTask1 = [
	WEST,
	_taskName,
	[
		_taskDescription,
		_taskTitle,
		_areaMarkerName
	],
	objNull,
	"AUTOASSIGNED",
	2,
	true,
	"defend"
] call BIS_fnc_taskCreate;


_taskName = "bluforTask2";
_taskDescription = localize "str_GRAD_afghanTaskDescriptionBlufor2";
_taskTitle = localize "str_GRAD_afghanTaskTitleEliminate";
_areaMarkerName = " target area ";

_bluforTask2 = [
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
	"destroy"
] call BIS_fnc_taskCreate;

[_bluforTask1,_bluforTask2]
