// init needs to be spawned on server only
params ["_position"];

sleep 10;

if (isServer) then {

     if (PREPARATION_TIME > 0) then {[PREPARATION_TIME] call BC_objectives_fnc_startPreparationTime};

     _min = str ((["GRAD_TICKS_NEEDED", 2700] call BIS_fnc_getParamValue)/60);
     _intervals = ["GRAD_INTERVALS_NEEDED", 1] call BIS_fnc_getParamValue;
     
     _tasksBlufor = [_intervals, _min] spawn BC_objectives_fnc_classicTasksBluforCreate;
     _tasksOpfor = [_intervals, _min] spawn BC_objectives_fnc_classicTasksOpforCreate;

     [_tasksBlufor, _tasksOpfor] call BC_objectives_fnc_loopConditions;
     
};

if (hasInterface) then {
     call BC_objectives_fnc_endConditionListener;
};
