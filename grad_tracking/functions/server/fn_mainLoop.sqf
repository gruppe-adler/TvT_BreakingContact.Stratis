params ["_radioVeh", "_terminal", "_endCondition"];

_result = [1,0];

grad_tracking_currentLoop = 0;

GRAD_tracking_mainLoop = [{

    params ["_args", "_handle"];
    _args params ["_radioVeh", "_terminal", "_endCondition", "_result"];

    // stop loop if necessary
    if (_endCondition) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    // if all ticks and intervals are reached, end mission
    if (GRAD_INTERVALS_DONE >= GRAD_INTERVALS_NEEDED) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;   // remove PFH
        [] call GRAD_tracking_fnc_bluforSurrendered;    // call Mission End
    };

    // if vehicles are destroyed, end mission
    if (!alive _radioVeh && {(_radioVeh getVariable ["detachableRadio", 0] != 2)}) exitWith {
        [] call GRAD_tracking_fnc_bluforCaptured;
    };

    // check if cookoff needs fixing
    [_radioVeh] call GRAD_tracking_fnc_radioTruckCookoffFix;

    // who the fuck is sending a signal currently
    _radioVehIsSending = [_radioVeh] call GRAD_tracking_fnc_radioVehIsSending;
    _terminalIsSending = [_terminal] call GRAD_tracking_fnc_terminalIsSending;
    _bothAreSending = (_terminalIsSending && _radioVehIsSending);

    // add one tick  if only vehicle is sending
    if (_radioVehIsSending && !_bothAreSending && !GRAD_TERMINAL) then {
        GRAD_TICKS_DONE = GRAD_TICKS_DONE + 1;
    };

    // add only terminal is sending, add half a tick
    if (!_radioVehIsSending && _terminalIsSending) then {
        GRAD_TICKS_DONE = GRAD_TICKS_DONE + 0.5;
    };

    // if truck and terminal are sending, add terminal to truck distance dependent tick
    if (_bothAreSending) then {
        params ["_tempModifier", "_tempDistance"];

        _result = [_radioVeh distance _terminal] call GRAD_tracking_fnc_distanceToRadioNerf;
        _modifier = _result select 0;

        [_modifier, _tempModifier, _tempDistance, _result] call GRAD_tracking_fnc_terminalCalculateDistanceModifier;

        GRAD_TICKS_DONE = GRAD_TICKS_DONE + (1 * _modifier);
    };

    // toggle marker visbility
    [!_radioVehIsSending, _radioVeh] call GRAD_tracking_fnc_setRadioVehMarkerStatus;
    [!_terminalIsSending, _terminal] call GRAD_tracking_fnc_setTerminalMarkerStatus;

    if (GRAD_TICKS_DONE >= GRAD_TICKS_NEEDED) then {
        GRAD_INTERVALS_DONE = GRAD_INTERVALS_DONE + 1;
        GRAD_TICKS_DONE = 0;
    };

    if (grad_tracking_currentLoop < GRAD_SIGNAL_DELAY) then {
        grad_tracking_currentLoop = grad_tracking_currentLoop + 1;
    } else {
        grad_tracking_currentLoop = 0; // reset delay for position update

        if (!GRAD_TERMINAL_ACTIVE) then {
            [getPos _radioVeh select 0, getPos _radioVeh select 1] call GRAD_tracking_fnc_setRadioVehMarkerPosition;
        } else {
            [getPos _radioVeh select 0, getPos _radioVeh select 1] call GRAD_tracking_fnc_setRadioVehMarkerPosition;
            [getPos _terminal select 0, getPos _terminal select 1] call GRAD_tracking_fnc_setTerminalMarkerPosition;
        };
    };

},1,[_radioVeh, _terminal, _endCondition, _result]] call CBA_fnc_addPerFrameHandler;


GRAD_tracking_syncLoop = [{
    params ["_args", "_handle"];

    "mrk_spawn_blufor_land_1" setMarkerPos (call US_VEHICLE_SPAWN);
    "mrk_spawn_opfor_land_1" setMarkerPos (call RUS_VEHICLE_SPAWN);
    publicVariable "GRAD_TICKS_DONE";

},5,[]] call CBA_fnc_addPerFrameHandler;