params ["_bool", "_radioVeh"];


if (_bool) then {
     GRAD_SIGNAL_DELAY = 3;
     GRAD_SIGNAL_DELAY_RANDOM = 3;
     GRAD_SIGNAL_SIZE = 25;
     publicVariable "GRAD_SIGNAL_SIZE";

} else {

     GRAD_SIGNAL_DELAY = 30;
     GRAD_SIGNAL_DELAY_RANDOM = 30;
     GRAD_SIGNAL_SIZE = 250;
     publicVariable "GRAD_SIGNAL_SIZE";

};