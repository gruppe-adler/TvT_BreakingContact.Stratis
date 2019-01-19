// init needs to be spawned on server only
if (isServer) then {

    [] spawn {
        [{

            [PREPARATION_TIME] call BC_objectives_fnc_startPreparationTime;

            private _min = str ((["GRAD_TICKS_NEEDED", 2700] call BIS_fnc_getParamValue)/60);
            private _intervals = ["GRAD_INTERVALS_NEEDED", 1] call BIS_fnc_getParamValue;

            private _tasksBlufor = [_intervals, _min] call BC_objectives_fnc_classicTasksBluforCreate;
            private _tasksOpfor = [_intervals, _min] call BC_objectives_fnc_classicTasksOpforCreate;

            [_tasksBlufor, _tasksOpfor] call BC_objectives_fnc_loopConditions;

        }, 10] call CBA_fnc_waitAndExecute;
    };

};

if (hasInterface) then {
    call BC_objectives_fnc_endConditionListener;
};