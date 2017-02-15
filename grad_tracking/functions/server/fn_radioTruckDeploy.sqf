params ["_radiotruck"];

_radiotruck setVariable ["GRAD_isAnimating", true, true];

_fuel = fuel _radiotruck;
_owner = owner _radiotruck;

_radiotruck setVariable ["GRAD_fuel", _fuel, true];
[_radiotruck, 0] remoteExec ["setFuel", _owner];

[_radiotruck, 1] call rhs_fnc_gaz66_radioDeploy;

sleep 3;
_radiotruck setVariable ["GRAD_isDeployed", true, true];
_radiotruck setVariable ["GRAD_isAnimating", false, true];
