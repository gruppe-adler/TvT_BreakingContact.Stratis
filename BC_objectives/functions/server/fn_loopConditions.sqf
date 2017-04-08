params ["_taskBlufor", "_taskOpfor"];

/* wait until truck exists */
waitUntil {sleep 1; !isNil "GRAD_TERMINAL_DESTROYED"};

[{
    params ["_args", "_handle"];
    _args params ["_taskBlufor", "_taskOpfor"];

    if (TRANSMISSION_COMPLETE || BLUFOR_ELIMINATED) exitWith {
    	 [_handle] call CBA_fnc_removePerFrameHandler;

    	 [_taskBlufor,"FAILED",true] call BIS_fnc_taskSetState;
    	 [_taskOpfor,"SUCCEEDED",true] call BIS_fnc_taskSetState;
    };

    if (OPFOR_ELIMINATED || BLUFOR_CAPTURED) exitWith {
    	 [_handle] call CBA_fnc_removePerFrameHandler;

    	 [_taskBlufor,"SUCCEEDED",true] call BIS_fnc_taskSetState;
    	 [_taskOpfor,"FAILED",true] call BIS_fnc_taskSetState;
    };

    if (TRUCK_DESTROYED_NOT_CONQUERED) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;

    	_radioVeh = missionNameSpace getVariable ["GRAD_tracking_radioVehObj", objNull];
        _terminal = missionNameSpace getVariable ["GRAD_tracking_terminalObj", objNull];

    	_killerSide = side (_radioVeh getVariable ["ace_medical_lastDamageSource", objNull]);

    	switch (_killerSide) do {
    		case west: { 
    			[_taskBlufor,"FAILED",true] call BIS_fnc_taskSetState;
    	 		[_taskOpfor,"CANCELED",true] call BIS_fnc_taskSetState;
    		};
    		case east: {
    			[_taskBlufor,"FAILED",true] call BIS_fnc_taskSetState;
    	 		[_taskOpfor,"CANCELED",true] call BIS_fnc_taskSetState;
    		};
    		default {
    			[_taskBlufor,"CANCELED",true] call BIS_fnc_taskSetState;
    	 		[_taskOpfor,"CANCELED",true] call BIS_fnc_taskSetState;
    		};
    	};
    	
    };

    /* detect all dead */
    OPFOR_PRE_ELIMINATED = ({side _x == east && alive _x} count allUnits == 0);
    BLUFOR_PRE_ELIMINATED = ({side _x == west && alive _x} count allUnits == 0);
    
	if (GRAD_TERMINAL_DESTROYED) then { [] call GRAD_tracking_fnc_bluforCaptured; };

    if (OPFOR_PRE_ELIMINATED) then {["OPFOR_PRE_ELIMINATED"] spawn BC_objectives_fnc_waitingForUnconscious;};
    if (BLUFOR_PRE_ELIMINATED) then {["BLUFOR_PRE_ELIMINATED"] spawn BC_objectives_fnc_waitingForUnconscious;};

    if (OPFOR_ELIMINATED || BLUFOR_ELIMINATED) exitWith {
        publicVariable "OPFOR_ELIMINATED";
        publicVariable "BLUFOR_ELIMINATED";
    };

},11,[_taskBlufor, _taskOpfor]] call CBA_fnc_addPerFrameHandler;