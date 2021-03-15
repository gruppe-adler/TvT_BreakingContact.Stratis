params ["_bool", "_radioVeh"];

_previous = GRAD_RADIO_VEH_MARKER_HIDDEN;
GRAD_RADIO_VEH_MARKER_HIDDEN = _bool;

if (
     MISSION_COMPLETED ||
     !alive _radioVeh ||
     missionnamespace getVariable ["GRAD_replay_isRunning", false]
) then {
     GRAD_RADIO_VEH_MARKER_HIDDEN = true;
     ["server_GRAD_RADIO_VEH_MARKER_HIDDEN", [GRAD_RADIO_VEH_MARKER_HIDDEN], allPlayers] call CBA_fnc_targetEvent;
};

if (!([GRAD_RADIO_VEH_MARKER_HIDDEN, _previous] call GRAD_tracking_fnc_booleanEqual)) then {
      ["server_GRAD_RADIO_VEH_MARKER_HIDDEN", [GRAD_RADIO_VEH_MARKER_HIDDEN], allPlayers] call CBA_fnc_targetEvent;
};

false
