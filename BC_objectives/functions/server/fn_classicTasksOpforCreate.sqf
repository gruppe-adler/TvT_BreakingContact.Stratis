params ["_count", "_min"];

_taskName = "opforTask1";
_taskDescription = format [localize "str_GRAD_classicTaskDescriptionOpfor1",_count, _min];
_taskTitle = format [localize "str_GRAD_classicTaskTitleOpfor1",_count, _min];
_areaMarkerName = " target area ";

_opforTask1 = [     EAST,     _taskName,     [     	_taskDescription,     	_taskTitle,     	_areaMarkerName     ],     objNull,     "AUTOASSIGNED",     2,     true,     "defend"
] call BIS_fnc_taskCreate;


_taskName = "opforTask2";
_taskDescription = localize "str_GRAD_classicTaskDescriptionOpfor2";
_taskTitle = localize "str_GRAD_classicTaskTitleEliminate";
_areaMarkerName = " target area ";

_opforTask2 = [     EAST,     _taskName,     [     	_taskDescription,     	_taskTitle,     	_areaMarkerName     ],     objNull,     "AUTOASSIGNED",     1,     true,     "destroy"
] call BIS_fnc_taskCreate;

[_opforTask1,_opforTask2]
