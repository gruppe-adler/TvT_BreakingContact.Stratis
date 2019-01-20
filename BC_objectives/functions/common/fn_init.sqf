// init needs to be spawned on server only
if (isServer) then {

    [] spawn {
        [{

            [PREPARATION_TIME] call BC_objectives_fnc_startPreparationTime;

            private _min = str ((["GRAD_TICKS_NEEDED", 2700] call BIS_fnc_getParamValue)/60);
            private _intervals = ["GRAD_INTERVALS_NEEDED", 1] call BIS_fnc_getParamValue;

            

            [{

                private _tasksMain = [_intervals, _min] call BC_objectives_fnc_createTaskMain;

                  [{
                    params ["_tasksMain"];
                    private _tasksElimination = [] call BC_objectives_fnc_createTaskElimination;

                    [_tasksMain, _tasksElimination] spawn BC_objectives_fnc_loopConditions;  

                }, [_tasksMain], 10] call CBA_fnc_waitAndExecute;

            }, [], 10] call CBA_fnc_waitAndExecute;


            // start replay record
            [{
                call GRAD_replay_fnc_init;
            }, [], PREPARATION_TIME] call CBA_fnc_waitAndExecute;

        }, [], 10] call CBA_fnc_waitAndExecute;

    };

};

if (hasInterface) then {
    call BC_objectives_fnc_endConditionListener;
};