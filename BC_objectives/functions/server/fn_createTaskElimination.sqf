private _taskName = "opforTask2";
private _taskDescription = localize "str_GRAD_classicTaskDescriptionOpfor2";
private _taskTitle = localize "str_GRAD_classicTaskTitleEliminate";
private _areaMarkerName = "";

private _opforTask2 = [
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


private _taskName = "bluforTask2";
private _taskDescription = localize "str_GRAD_classicTaskDescriptionBlufor2";
private _taskTitle = localize "str_GRAD_classicTaskTitleEliminate";
private _areaMarkerName = "";

private _bluforTask2 = [
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

[_opforTask2, _bluforTask2]