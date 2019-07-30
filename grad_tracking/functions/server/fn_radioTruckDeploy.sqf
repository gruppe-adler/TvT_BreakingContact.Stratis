params ["_radiotruck"];

_radiotruck setVariable ["GRAD_isAnimating", true, true];

private _fuel = fuel _radiotruck;
private _owner = owner _radiotruck;
private _canMove = _radiotruck getVariable ["BC_canMoveDuringTransmission", false];

if (typeOf _radiotruck == "rhs_gaz66_r142_vv") exitWith {
	[_radiotruck, 1] spawn rhs_fnc_gaz66_radioDeploy;
    sleep 3;
    _radiotruck setVariable ["GRAD_isDeployed", true, true];
    _radiotruck setVariable ["GRAD_isAnimating", false, true];
};

/*
_radiotruck setVariable ["GRAD_fuel", _fuel, true];
[_radiotruck, 0] remoteExec ["setFuel", _owner];
*/

sleep 3;
_radiotruck setVariable ["GRAD_isDeployed", true, true];
_radiotruck setVariable ["GRAD_isAnimating", false, true];
_radiotruck setVariable ["tf_range", 50000, true]; // for vehicles other than rhs gaz66

/*
private _antennaOffset = _radiotruck getVariable ["BC_antennaOffset", []];
if (count _antennaOffset > 0) then {
    private _antenna = "Land_SatelliteAntenna_01_F" createVehicle [0,0,0];
    _antenna attachTo [_radiotruck, _antennaOffset];
    _radiotruck setVariable ["BC_antennaObj", _antenna, true];
};
*/

/*
if (_canMove) then {
	[_radiotruck, _fuel] remoteExec ["setFuel", _owner];
};
*/