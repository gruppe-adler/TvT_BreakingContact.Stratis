params ["_modifier", "_tempModifier", "_tempDistance", "_result"];
private _distanceToRadioVeh = _result select 1;

// check if distance changed, if yes, broadcast for client hint
if ((_distanceToRadioVeh != _tempDistance) || (_modifier != _tempModifier)) then {
    GRAD_TERMINAL_DISTANCE = _modifier * 100;

    ["server_GRAD_TERMINAL_DISTANCE", [GRAD_TERMINAL_DISTANCE]] call CBA_fnc_serverEvent;
};
