params ["_bool", "_radioVeh"];

_previous = GRAD_RADIO_VEH_MARKER_HIDDEN;
GRAD_RADIO_VEH_MARKER_HIDDEN = _bool;

if (	
	MISSION_COMPLETED ||
	!alive _radioVeh
) then {
	GRAD_RADIO_VEH_MARKER_HIDDEN = true;
};

if (!([GRAD_RADIO_VEH_MARKER_HIDDEN, _previous] call GRAD_tracking_fnc_booleanEqual)) then {
	 publicVariable "GRAD_RADIO_VEH_MARKER_HIDDEN";
};
