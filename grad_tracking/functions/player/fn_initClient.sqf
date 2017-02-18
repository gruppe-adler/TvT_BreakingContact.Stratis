// create initial markers
mrk_lastSeen = call GRAD_tracking_fnc_createMarkerLastSeen;
mrk_radioVeh = call GRAD_tracking_fnc_createMarkerRadioVeh;
mrk_terminal = call GRAD_tracking_fnc_createMarkerTerminal;


_GRAD_RADIO_VEH_MARKER_POS_listener = {
	mrk_radioVeh setMarkerPosLocal (_this select 1);
};

_GRAD_RADIO_VEH_MARKER_HIDDEN_listener = {
	if (_this select 1) then {
		mrk_radioVeh setMarkerAlphaLocal 0;
	} else {
		[] call GRAD_tracking_fnc_ensureRadioVehMarkerAnimation;	
	};
};

_GRAD_TERMINAL_MARKER_POS_listener = {
	mrk_terminal setMarkerPosLocal (_this select 1);
};

_GRAD_TERMINAL_MARKER_HIDDEN_listener = {
	if (_this select 1) then {
		mrk_terminal setMarkerAlphaLocal 0;
	} else {
		[] call GRAD_tracking_fnc_ensureTerminalMarkerAnimation;
	};
};

// initial set
grad_interval_nextWarning = 1;
grad_ticks_nextWarning = 0.2;

// add listener for intervals
call GRAD_tracking_fnc_listenerInterval; 
call GRAD_tracking_fnc_listenerTicks;


// add listener for radio signal marker
"GRAD_RADIO_VEH_MARKER_POS" addPublicVariableEventHandler _GRAD_RADIO_VEH_MARKER_POS_listener;
"GRAD_RADIO_VEH_MARKER_HIDDEN" addPublicVariableEventHandler _GRAD_RADIO_VEH_MARKER_HIDDEN_listener;


// add listener for terminal signal marker
"GRAD_TERMINAL_MARKER_POS" addPublicVariableEventHandler _GRAD_TERMINAL_MARKER_POS_listener;
"GRAD_TERMINAL_MARKER_HIDDEN" addPublicVariableEventHandler _GRAD_TERMINAL_MARKER_HIDDEN_listener;


// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	[_GRAD_RADIO_VEH_MARKER_HIDDEN_listener, _GRAD_RADIO_VEH_MARKER_POS_listener, _GRAD_TERMINAL_MARKER_HIDDEN_listener, _GRAD_TERMINAL_MARKER_POS_listener] spawn {
		while {true} do {
			[0, GRAD_RADIO_VEH_MARKER_HIDDEN] call (_this select 0);
			[0, GRAD_RADIO_VEH_MARKER_POS] call (_this select 1);
			[0, GRAD_TERMINAL_MARKER_HIDDEN] call (_this select 2);
			[0, GRAD_TERMINAL_MARKER_POS] call (_this select 3);
			sleep 2;
		};
	};
};
