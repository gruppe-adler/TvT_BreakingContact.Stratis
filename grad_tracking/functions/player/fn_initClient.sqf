// create initial markers

mrk_lastSeen = call GRAD_tracking_fnc_createMarkerLastSeen;
mrk_radioVeh = call GRAD_tracking_fnc_createMarkerRadioVeh;
mrk_terminal = call GRAD_tracking_fnc_createMarkerTerminal;

// hintsilent format ["%1, %2, %3", mrk_lastSeen, mrk_radioVeh, mrk_terminal];

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

"GRAD_RADIO_VEH_MARKER_POS" addPublicVariableEventHandler _GRAD_RADIO_VEH_MARKER_POS_listener;
"GRAD_RADIO_VEH_MARKER_HIDDEN" addPublicVariableEventHandler _GRAD_RADIO_VEH_MARKER_HIDDEN_listener;

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
