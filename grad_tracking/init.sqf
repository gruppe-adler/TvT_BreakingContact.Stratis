params ["_radioVeh", "_terminal"];

if (isServer) then {
	// radio box related
	GRAD_TERMINAL = false;
	publicVariable "GRAD_TERMINAL";
	GRAD_TERMINAL_ACTIVE = false;
	publicVariable "GRAD_TERMINAL_ACTIVE";

	GRAD_TERMINAL_MARKER_HIDDEN = true;
	publicVariable "GRAD_TERMINAL_MARKER_HIDDEN";
	GRAD_TERMINAL_MARKER_POS = [0,0];
	publicVariable "GRAD_TERMINAL_MARKER_POS";

	GRAD_TERMINAL_DISTANCE = 0;
	publicVariable "GRAD_TERMINAL_DISTANCE";
	GRAD_TERMINAL_DESTROYED = false;
	publicVariable "GRAD_TERMINAL_DESTROYED";

	// radio VEHICLE related
	GRAD_RADIO_VEH_MARKER_HIDDEN = true;
	publicVariable "GRAD_RADIO_VEH_MARKER_HIDDEN";
	GRAD_RADIO_VEH_MARKER_POS = [0,0];
	publicVariable "GRAD_RADIO_VEH_MARKER_POS";

	sleep 2;

	// radio vehicle, condition to stop
	[_radioVeh, _terminal, MISSION_COMPLETED] call GRAD_tracking_fnc_mainLoop;
	call GRAD_tracking_fnc_terminalDistanceListenerServer;
};

if (hasInterface) then {
	if (!FACTIONS_DEFAULT) then {
		GRAD_SIGNAL_DELAY = 1;
	} else {
		GRAD_SIGNAL_DELAY = 30;
	};

	[] call GRAD_tracking_fnc_initClient;
	call GRAD_tracking_fnc_terminalDistanceListenerClient;
};
