if (playerSide != east) exitWith {};

_GRAD_TERMINAL_DISTANCE_listener = {
     0 = [GRAD_TERMINAL_DISTANCE] call GRAD_tracking_fnc_terminalDistanceHint;
};

"GRAD_TERMINAL_DISTANCE" addPublicVariableEventHandler _GRAD_TERMINAL_DISTANCE_listener;

// only works once, not really feasible in sp
if (!isMultiplayer) then {
     _GRAD_TERMINAL_DISTANCE_listener spawn {
          waitUntil {GRAD_TERMINAL_DISTANCE != 0};
          [0, GRAD_TERMINAL_DISTANCE] call _this;
     };
};
