player setVariable ["radioAttached",false]; // for use in detaching radio from radio truck

// create initial markers
mrk_lastSeen = call GRAD_tracking_fnc_createMarkerLastSeen;
mrk_radioVeh = call GRAD_tracking_fnc_createMarkerRadioVeh;
mrk_terminal = call GRAD_tracking_fnc_createMarkerTerminal;
mrk_antenna = call GRAD_tracking_fnc_createMarkerAntenna;

["server_GRAD_RADIO_VEH_MARKER_POS", {
    params ["_bool"];

    mrk_radioVeh setMarkerPosLocal _bool;

}] call CBA_fnc_addEventhandler;


["server_GRAD_TERMINAL_MARKER_POS", {
    params ["_bool"];

    mrk_terminal setMarkerPosLocal _bool;

}] call CBA_fnc_addEventhandler;


["server_GRAD_RADIO_VEH_MARKER_HIDDEN", {
    params ["_bool"];

    if (_bool) then {
  		mrk_radioVeh setMarkerAlphaLocal 0;
  	} else {
  		[] call GRAD_tracking_fnc_ensureRadioVehMarkerAnimation;
  	};

}] call CBA_fnc_addEventhandler;


["server_GRAD_TERMINAL_MARKER_HIDDEN", {
    params ["_bool"];

    if (_bool) then {
         mrk_terminal setMarkerAlphaLocal 0;
    } else {
         [] call GRAD_tracking_fnc_ensureTerminalMarkerAnimation;
    };

}] call CBA_fnc_addEventhandler;


["server_GRAD_ANTENNA_MARKER_POS", {
    params ["_bool"];

    mrk_antenna setMarkerPosLocal _bool;

}] call CBA_fnc_addEventhandler;


["server_GRAD_ANTENNA_MARKER_HIDDEN", {
    params ["_bool"];

    if (_bool) then {
         mrk_antenna setMarkerAlphaLocal 0;
    } else {
         [] call GRAD_tracking_fnc_ensureAntennaMarkerAnimation;
    };

}] call CBA_fnc_addEventhandler;


// initial set
grad_interval_nextWarning = 1;
grad_ticks_nextWarning = 0.2;

// add listener for intervals
call GRAD_tracking_fnc_listenerInterval;
call GRAD_tracking_fnc_listenerTicks;
