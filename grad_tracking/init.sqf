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
     // publicVariable "GRAD_TERMINAL_MARKER_HIDDEN";
     GRAD_TERMINAL_MARKER_POS = [0,0];
     // publicVariable "GRAD_TERMINAL_MARKER_POS";

     GRAD_TERMINAL_DISTANCE = 0;
     publicVariable "GRAD_TERMINAL_DISTANCE";
     GRAD_TERMINAL_DESTROYED = false;
     publicVariable "GRAD_TERMINAL_DESTROYED";

     // radio VEHICLE related
     GRAD_RADIO_VEH_MARKER_HIDDEN = true;
     // publicVariable "GRAD_RADIO_VEH_MARKER_HIDDEN";
     GRAD_RADIO_VEH_MARKER_POS = [0,0];
     // publicVariable "GRAD_RADIO_VEH_MARKER_POS";

     GRAD_SIGNAL_DELAY = 1;
     publicVariable "GRAD_SIGNAL_DELAY";

     // initial broadcast
     ["GRAD_RADIO_VEH_MARKER_HIDDEN_listener", [GRAD_RADIO_VEH_MARKER_HIDDEN], "GRAD_RADIO_VEH_MARKER_HIDDEN_listener"] call CBA_fnc_globalEventJIP;
     ["GRAD_TERMINAL_MARKER_HIDDEN_listener", [GRAD_TERMINAL_MARKER_HIDDEN], "GRAD_TERMINAL_MARKER_HIDDEN_listener"] call CBA_fnc_globalEventJIP;
     ["GRAD_TERMINAL_MARKER_POS_listener", [GRAD_TERMINAL_MARKER_POS], "GRAD_TERMINAL_MARKER_POS_listener"] call CBA_fnc_globalEventJIP;
     ["GRAD_RADIO_VEH_MARKER_POS_listener", [GRAD_RADIO_VEH_MARKER_POS], "GRAD_RADIO_VEH_MARKER_POS_listener"] call CBA_fnc_globalEventJIP;
     

     GRAD_MIN_DISTANCE_TO_RADIOPOSITION = ["GRAD_MIN_DISTANCE_TO_RADIOPOSITION", 1000] call BIS_fnc_getParamValue;;

     GRAD_SIGNAL_SIZE = GRAD_MIN_DISTANCE_TO_RADIOPOSITION/2;
     publicVariable "GRAD_SIGNAL_SIZE";

     if (GRAD_INTERVALS_NEEDED isEqualTo 1) then { GRAD_MIN_DISTANCE_TO_RADIOPOSITION = 100000; };
     publicVariable "GRAD_MIN_DISTANCE_TO_RADIOPOSITION";
     

     GRAD_FUNKWAGEN_RED = [1, 0, 0, 1];

     sleep 2;

     [
          _radioVeh,
          _terminal,
          {MISSION_COMPLETED}
     ] call GRAD_tracking_fnc_mainLoop;

     [] call GRAD_tracking_fnc_terminalDistanceListenerServer;
};

if (hasInterface) then {

     [] call GRAD_tracking_fnc_initClient;
     [] call GRAD_tracking_fnc_terminalDistanceListenerClient;
};
