params ["_tasksBlufor", "_tasksOpfor"];
_tasksBlufor params ["_taskBlufor1","_taskBlufor2"];
_tasksOpfor params ["_tasksOpfor1","_tasksOpfor2"];

/* wait until truck exists */
waitUntil {sleep 1; !isNil "GRAD_TERMINAL_DESTROYED"};

[{
    params ["_args", "_handle"];
    _args params ["_taskBlufor1","_taskBlufor2","_taskOpfor1","_taskOpfor2"];

    /* detect all dead */
    OPFOR_PRE_ELIMINATED = ({side _x == east && alive _x} count allUnits == 0);
    BLUFOR_PRE_ELIMINATED = ({side _x == west && alive _x} count allUnits == 0);

    if (GRAD_TERMINAL_DESTROYED) then { [] call GRAD_tracking_fnc_bluforCaptured; };

    if (OPFOR_PRE_ELIMINATED) then {["OPFOR_PRE_ELIMINATED"] spawn BC_objectives_fnc_waitingForUnconscious;};
    if (BLUFOR_PRE_ELIMINATED) then {["BLUFOR_PRE_ELIMINATED"] spawn BC_objectives_fnc_waitingForUnconscious;};

    /* opfor wins by transmission*/
    if (TRANSMISSION_COMPLETE) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;

        [_taskBlufor1,"FAILED",true] call BIS_fnc_taskSetState;
        [_taskBlufor2,"FAILED",true] call BIS_fnc_taskSetState;
        [_taskOpfor1,"SUCCEEDED",true] call BIS_fnc_taskSetState;
        [_taskOpfor2,"CANCELED",true] call BIS_fnc_taskSetState;
    };

    /* opfor wins by elimination*/
    if (BLUFOR_ELIMINATED) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;

        [_taskBlufor1,"FAILED",true] call BIS_fnc_taskSetState;
        [_taskBlufor2,"FAILED",true] call BIS_fnc_taskSetState;
        [_taskOpfor1,"CANCELED",true] call BIS_fnc_taskSetState;
        [_taskOpfor2,"SUCCEEDED",true] call BIS_fnc_taskSetState;
    };

    /* blufor wins by capture*/
    if (BLUFOR_CAPTURED) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;

        [_taskBlufor1,"SUCCEEDED",true] call BIS_fnc_taskSetState;
        [_taskBlufor2,"CANCELED",true] call BIS_fnc_taskSetState;
        [_taskOpfor1,"FAILED",true] call BIS_fnc_taskSetState;
        [_taskOpfor2,"FAILED",true] call BIS_fnc_taskSetState;
    };

    /* blufor wins by elimination*/
    if (OPFOR_ELIMINATED) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;

        [_taskBlufor1,"CANCELED",true] call BIS_fnc_taskSetState;
        [_taskBlufor2,"SUCCEEDED",true] call BIS_fnc_taskSetState;
        [_taskOpfor1,"FAILED",true] call BIS_fnc_taskSetState;
        [_taskOpfor2,"FAILED",true] call BIS_fnc_taskSetState;
    };

    if (TRUCK_DESTROYED_NOT_CONQUERED) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;

    	_radioVeh = missionNameSpace getVariable ["GRAD_tracking_radioVehObj", objNull];
        _terminal = missionNameSpace getVariable ["GRAD_tracking_terminalObj", objNull];

    	_killerSide = side (_radioVeh getVariable ["ace_medical_lastDamageSource", objNull]);

    	switch (_killerSide) do {
    		case west: {
                [_taskBlufor1,"FAILED",true] call BIS_fnc_taskSetState;
                [_taskBlufor2,"CANCELED",true] call BIS_fnc_taskSetState;
           	    [_taskOpfor1,"CANCELED",true] call BIS_fnc_taskSetState;
                [_taskOpfor2,"CANCELED",true] call BIS_fnc_taskSetState;
    		};
    		case east: {
                [_taskBlufor1,"CANCELED",true] call BIS_fnc_taskSetState;
                [_taskBlufor2,"CANCELED",true] call BIS_fnc_taskSetState;
           	    [_taskOpfor1,"FAILED",true] call BIS_fnc_taskSetState;
                [_taskOpfor2,"CANCELED",true] call BIS_fnc_taskSetState;
    		};
    		default {
                [_taskBlufor1,"CANCELED",true] call BIS_fnc_taskSetState;
                [_taskBlufor2,"CANCELED",true] call BIS_fnc_taskSetState;
           	    [_taskOpfor1,"CANCELED",true] call BIS_fnc_taskSetState;
                [_taskOpfor2,"CANCELED",true] call BIS_fnc_taskSetState;
    		};
    	};

    };

},11,[_taskBlufor1,_taskBlufor2,_taskOpfor1,_taskOpfor2]] call CBA_fnc_addPerFrameHandler;
