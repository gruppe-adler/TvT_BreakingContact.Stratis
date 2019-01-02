params ["_radiotruck"];

_radiotruck setVariable ["GRAD_isAnimating", true, true];

private _fuel = fuel _radiotruck;
private _owner = owner _radiotruck;

_radiotruck setVariable ["GRAD_fuel", _fuel, true];
[_radiotruck, 0] remoteExec ["setFuel", _owner];

if (typeOf _radiotruck == "rhs_gaz66_r142_vv") then {
	[_radiotruck, 1] call rhs_fnc_gaz66_radioDeploy;
};

sleep 3;
_radiotruck setVariable ["GRAD_isDeployed", true, true];
_radiotruck setVariable ["GRAD_isAnimating", false, true];
_radiotruck setVariable ["tf_range", 50000, true]; // for vehicles other than rhs gaz66