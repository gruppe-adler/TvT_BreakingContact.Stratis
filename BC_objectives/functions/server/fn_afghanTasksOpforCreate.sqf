params ["_min","_interval"];

_taskName = "opforTask1";
_taskDescription =  format [localize "str_GRAD_afghanTaskDescriptionOpfor1",_interval,_min];
_taskTitle = localize "str_GRAD_afghanTaskTitleOpfor1";
_areaMarkerName = " target area ";

_opforTask1 = [
	EAST,
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
	"destroy"
] call BIS_fnc_taskCreate;


_taskName = "opforTask2";
_taskDescription =  localize "str_GRAD_afghanTaskDescriptionOpfor2";
_taskTitle = localize "str_GRAD_afghanTaskTitleEliminate";
_areaMarkerName = " target area ";

_opforTask2 = [
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
	"destroy"
] call BIS_fnc_taskCreate;

[_opforTask1,_opforTask2]
