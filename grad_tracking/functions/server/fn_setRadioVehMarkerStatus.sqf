params ["_bool", "_radioVeh"];

_previous = GRAD_RADIO_VEH_MARKER_HIDDEN;
GRAD_RADIO_VEH_MARKER_HIDDEN = _bool;

if (     
     MISSION_COMPLETED ||
     !alive _radioVeh ||
     missionnamespace getVariable ["GRAD_replay_isRunning", false]
) then {
     GRAD_RADIO_VEH_MARKER_HIDDEN = true;
     // publicVariable "GRAD_RADIO_VEH_MARKER_HIDDEN";
     ["GRAD_RADIO_VEH_MARKER_HIDDEN_listener", [GRAD_RADIO_VEH_MARKER_HIDDEN], "GRAD_RADIO_VEH_MARKER_HIDDEN_listener"] call CBA_fnc_globalEvent;
};

if (!([GRAD_RADIO_VEH_MARKER_HIDDEN, _previous] call GRAD_tracking_fnc_booleanEqual)) then {
      // publicVariable "GRAD_RADIO_VEH_MARKER_HIDDEN";
      ["GRAD_RADIO_VEH_MARKER_HIDDEN_listener", [GRAD_RADIO_VEH_MARKER_HIDDEN], "GRAD_RADIO_VEH_MARKER_HIDDEN_listener"] call CBA_fnc_globalEvent;
};

false