if (playerSide != east) exitWith {};

["server_GRAD_TERMINAL_DISTANCE", {
    params ["_value"];

    GRAD_TERMINAL_DISTANCE = _value;
    [_value] call GRAD_tracking_fnc_terminalDistanceHint;

}] call CBA_fnc_addEventhandler;
