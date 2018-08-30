params ["_bool", "_radioTerminal"];

_previous = GRAD_TERMINAL_MARKER_HIDDEN;
GRAD_TERMINAL_MARKER_HIDDEN = _bool;

_return = false;

if (     MISSION_COMPLETED || GRAD_TERMINAL_DESTROYED ||     missionnamespace getVariable ["GRAD_replay_isRunning", false]     ) exitWith {     GRAD_TERMINAL_MARKER_HIDDEN = true;     publicVariable "GRAD_TERMINAL_MARKER_HIDDEN";
};

if (!([GRAD_TERMINAL_MARKER_HIDDEN, _previous] call GRAD_tracking_fnc_booleanEqual)) then {     publicVariable "GRAD_TERMINAL_MARKER_HIDDEN";
};

_return