params ["_count", "_min"];

private _taskName = "opforTask1";
private _taskDescription = format [localize "str_GRAD_classicTaskDescriptionOpfor1",_count, _min];
private _taskTitle = format [localize "str_GRAD_classicTaskTitleOpfor1",_count, _min];
private _areaMarkerName = "";

private _opforTask1 = [
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
     "defend"
] call BIS_fnc_taskCreate;


private _taskName = "bluforTask1";
private _taskDescription = format [localize "str_GRAD_classicTaskDescriptionBlufor",_count, _min];
private _taskTitle = format [localize "str_GRAD_classicTaskTitleBlufor",_count, _min];
private _areaMarkerName = "";
private _type = "destroy";

if (CONQUER_MODE) then {
     _taskDescription = format [localize "str_GRAD_classicTaskDescriptionBlufor_conquermode", _count, _min];
     _taskTitle = format [localize "str_GRAD_classicTaskTitleBlufor_conquermode", _count, _min];
};

private _bluforTask1 = [
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
     "destroy"
] call BIS_fnc_taskCreate;

[_opforTask1, _bluforTask1]