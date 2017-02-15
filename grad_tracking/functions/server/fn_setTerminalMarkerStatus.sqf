params ["_bool", "_radioTerminal"];

_previous = GRAD_TERMINAL_MARKER_HIDDEN;
GRAD_TERMINAL_MARKER_HIDDEN = _bool;

if (
	MISSION_COMPLETED || !alive _radioTerminal
	) then {
	GRAD_TERMINAL_MARKER_HIDDEN = true;
};

if (!([GRAD_TERMINAL_MARKER_HIDDEN, _previous] call booleanEqual)) then {
	publicVariable "GRAD_TERMINAL_MARKER_HIDDEN";
};