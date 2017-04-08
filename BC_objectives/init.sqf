// init needs to be spawned on server only

if (isServer) then {

	_min = str ((["GRAD_TICKS_NEEDED", 2700] call BIS_fnc_getParamValue)/60);

	if (TRACKING_PERSON) then {
		_taskBlufor = [_min] call BC_objectives_fnc_afghanTasksBluforCreate;
		_taskOpfor = [_min] call BC_objectives_fnc_afghanTasksOpforCreate;
		
		[_taskOpfor, _taskOpfor] call BC_objectives_fnc_loopConditions;
	} else {
		_taskBlufor = [_min] call BC_objectives_fnc_classicTasksBluforCreate;
		_taskOpfor = [_min] call BC_objectives_fnc_classicTasksOpforCreate;
		
		[_taskOpfor, _taskOpfor] call BC_objectives_fnc_loopConditions;
	};
};

if (hasInterface) then {
	call BC_objectives_fnc_endConditionListener;
};