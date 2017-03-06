params ["_unit", "_veh"];

// ignore if vehicle is public
if (
	_veh getVariable ["GRAD_publicTransport_isTaxi", false] ||
	_veh getVariable ["GRAD_publicTransport_isBus", false]
) exitWith {
	
};

GRAD_SIGNAL_DELAY = 3;
GRAD_SIGNAL_DELAY_RANDOM = 3;
GRAD_SIGNAL_SIZE = 15;
publicVariable "GRAD_SIGNAL_SIZE";