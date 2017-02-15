params ["_radioVeh", "_terminal", "_endCondition"];

_result = [1,0];
_counter = 0;

GRAD_tracking_mainLoop = [{

    params ["_args", "_handle"];
    _args params ["_radioVeh", "_terminal", "_endCondition", "_result", "_counter"];

    if (_endCondition) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    _radioVehIsSending = [_radioVeh] call GRAD_tracking_fnc_radioVehIsSending;
    _terminalIsSending = [_terminal] call GRAD_tracking_fnc_terminalIsSending;
    _bothAreSending = (_terminalIsSending && _radioVehIsSending);

    if (_radioVehIsSending && !_bothAreSending && !GRAD_TERMINAL) then {
        OPFOR_POINTS = OPFOR_POINTS + 1;
        // diag_log format ["debug: vehicle is sending alone"];
    };

    if (!_radioVehIsSending && _terminalIsSending) then {
        OPFOR_POINTS = OPFOR_POINTS + 0.5;
        // diag_log format ["debug: terminal is sending alone"];
    };

    if (_bothAreSending) then {
        _tempModifier = _result select 0;
        _tempDistance = _result select 1;

        _result = [_radioVeh distance _terminal] call GRAD_tracking_fnc_distanceToRadioNerf;
        _modifier = _result select 0;
        _distanceToRadioVeh = _result select 1;

        // check if distance changed, if yes, broadcast for client hint
        if ((_distanceToRadioVeh != _tempDistance) || (_modifier != _tempModifier)) then {
            GRAD_TERMINAL_DISTANCE = _modifier * 100;
            publicVariable "GRAD_TERMINAL_DISTANCE";
        };
        OPFOR_POINTS = OPFOR_POINTS + (1 * _modifier);
        // diag_log format ["debug:both are sending"];
    };



    [!_radioVehIsSending, _radioVeh] call GRAD_tracking_fnc_setRadioVehMarkerStatus;
    [!_terminalIsSending, _terminal] call GRAD_tracking_fnc_setTerminalMarkerStatus;

    if (typeOf _radioVeh == "rhs_gaz66_r142_vv") then {
        if (_radioVeh getHit "karoserie" == 1 && _radioVeh getHit "motor" == 1 && !(_radioVeh getVariable ["isCookingOff", false])) then {
            _radioVeh setVariable ["isCookingOff", true, true];
            [[_radioVeh, {[_radioVeh] call ace_cookoff_fnc_cookOff}]] remoteExec ["GRAD_tracking_fnc_execIfLocal",0,false];
        };
    };

    if (OPFOR_POINTS >= POINTS_NEEDED_FOR_VICTORY) exitWith {
        [] call GRAD_tracking_fnc_bluforSurrendered;
    };

    if (!alive _radioVeh && {(_radioVeh getVariable ["detachableRadio", 0] != 2)}) exitWith {
        [] call GRAD_tracking_fnc_bluforCaptured;
    };


    if (!GRAD_TERMINAL_ACTIVE) then {
        if (!FACTIONS_DEFAULT) then {
            [getPos _radioVeh select 0, getPos _radioVeh select 1] call GRAD_tracking_fnc_setRadioVehMarkerPosition;
        } else {
            if (_counter < 10) then {
                _counter = _counter + 1;
            } else {
                _counter = 0;
                [getPos _radioVeh select 0, getPos _radioVeh select 1] call GRAD_tracking_fnc_setRadioVehMarkerPosition;
            };
        };
        
    } else {
        [getPos _radioVeh select 0, getPos _radioVeh select 1] call GRAD_tracking_fnc_setRadioVehMarkerPosition;
        [getPos _terminal select 0, getPos _terminal select 1] call GRAD_tracking_fnc_setTerminalMarkerPosition;
    };

},1,[_radioVeh, _terminal, _endCondition, _result, _counter]] call CBA_fnc_addPerFrameHandler;


GRAD_tracking_syncLoop = [{
    params ["_args", "_handle"];

    if (OPFOR_POINTS > POINTS_NEEDED_FOR_VICTORY) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    publicVariable "OPFOR_POINTS";
    "mrk_spawn_blufor_land_1" setMarkerPos (call US_VEHICLE_SPAWN);
    "mrk_spawn_opfor_land_1" setMarkerPos (call RUS_VEHICLE_SPAWN);

},5,[]] call CBA_fnc_addPerFrameHandler;