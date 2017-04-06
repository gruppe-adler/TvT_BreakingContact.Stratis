params ["_bool", "_radioTerminal"];

_previous = GRAD_TERMINAL_MARKER_HIDDEN;
GRAD_TERMINAL_MARKER_HIDDEN = _bool;

_return = false;

if (
	MISSION_COMPLETED || !alive _radioTerminal
	) then {
	GRAD_TERMINAL_MARKER_HIDDEN = true;
};

if (!([GRAD_TERMINAL_MARKER_HIDDEN, _previous] call GRAD_tracking_fnc_booleanEqual)) then {
	publicVariable "GRAD_TERMINAL_MARKER_HIDDEN";
};

_return