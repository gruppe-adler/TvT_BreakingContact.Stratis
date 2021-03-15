["server_GRAD_TERMINAL_DISTANCE", {
    params ["_value"];

    ["server_GRAD_TERMINAL_DISTANCE",[GRAD_TERMINAL_DISTANCE], allPlayers] call CBA_fnc_targetEvent;

}] call CBA_fnc_addEventhandler;
