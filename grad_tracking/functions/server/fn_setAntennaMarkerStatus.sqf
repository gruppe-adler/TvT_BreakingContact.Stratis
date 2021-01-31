params ["_bool", "_antenna"];

_previous = GRAD_ANTENNA_MARKER_HIDDEN;
GRAD_ANTENNA_MARKER_HIDDEN = _bool;

_return = false;

if (
     MISSION_COMPLETED || GRAD_ANTENNA_DISABLED ||
     missionnamespace getVariable ["GRAD_replay_isRunning", false]
     ) exitWith {
     GRAD_ANTENNA_MARKER_HIDDEN = true;
     publicVariable "GRAD_ANTENNA_MARKER_HIDDEN";
};

if (!([GRAD_ANTENNA_MARKER_HIDDEN, _previous] call GRAD_tracking_fnc_booleanEqual)) then {
     publicVariable "GRAD_ANTENNA_MARKER_HIDDEN";
};

_return