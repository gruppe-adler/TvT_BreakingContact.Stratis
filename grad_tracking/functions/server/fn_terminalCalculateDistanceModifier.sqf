params ["_modifier", "_tempModifier", "_tempDistance", "_result"];
 _distanceToRadioVeh = _result select 1;

// check if distance changed, if yes, broadcast for client hint
if ((_distanceToRadioVeh != _tempDistance) || (_modifier != _tempModifier)) then {
    GRAD_TERMINAL_DISTANCE = _modifier * 100;
    publicVariable "GRAD_TERMINAL_DISTANCE";
};