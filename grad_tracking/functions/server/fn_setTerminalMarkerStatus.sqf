params ["_bool", "_radioTerminal"];

private _previous = GRAD_TERMINAL_MARKER_HIDDEN;
GRAD_TERMINAL_MARKER_HIDDEN = _bool;

private _return = false;

if (
     MISSION_COMPLETED || GRAD_TERMINAL_DESTROYED ||
     missionnamespace getVariable ["GRAD_replay_isRunning", false]
     ) exitWith {
     GRAD_TERMINAL_MARKER_HIDDEN = true;
     ["server_GRAD_TERMINAL_MARKER_HIDDEN", [GRAD_TERMINAL_MARKER_HIDDEN], allPlayers] call CBA_fnc_targetEvent;
     _return = true;
};

if (!([GRAD_TERMINAL_MARKER_HIDDEN, _previous] call GRAD_tracking_fnc_booleanEqual)) then {
     ["server_GRAD_TERMINAL_MARKER_HIDDEN", [GRAD_TERMINAL_MARKER_HIDDEN], allPlayers] call CBA_fnc_targetEvent;
     _return = true;
};

_return
