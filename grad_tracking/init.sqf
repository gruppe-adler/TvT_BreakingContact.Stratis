params ["_radioVeh", "_terminal"];

GRAD_TICKS_DONE = 0;

if (isServer) then {

	GRAD_TICKS_NEEDED = ["GRAD_TICKS_NEEDED", 2700] call BIS_fnc_getParamValue;
	publicVariable "GRAD_TICKS_NEEDED"; // clients need to know this

	GRAD_INTERVALS_NEEDED = ["GRAD_INTERVALS_NEEDED", 1] call BIS_fnc_getParamValue;
	publicVariable "GRAD_INTERVALS_NEEDED"; // clients need to know this

	GRAD_INTERVALS_DONE = 0;
	publicVariable "GRAD_INTERVALS_DONE";

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

	GRAD_SIGNAL_DELAY = 1;
	GRAD_SIGNAL_SIZE = 250;
	publicVariable "GRAD_SIGNAL_SIZE";

	// afghan wars mode
	if (TRACKING_PERSON) then {
		GRAD_INTERVALS_NEEDED = 5;
		publicVariable "GRAD_INTERVALS_NEEDED";
		GRAD_SIGNAL_DELAY = 30;
		GRAD_SIGNAL_DELAY_RANDOM = 30;
		
	};

	publicVariable "GRAD_SIGNAL_DELAY";
	
	sleep 2;

	[
		_radioVeh, 
		_terminal, 
		MISSION_COMPLETED
	] call GRAD_tracking_fnc_mainLoop;
	

	call GRAD_tracking_fnc_terminalDistanceListenerServer;
};

if (hasInterface) then {

	[] call GRAD_tracking_fnc_initClient;
	call GRAD_tracking_fnc_terminalDistanceListenerClient;
};
