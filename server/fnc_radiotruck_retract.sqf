fnc_radiotruck_retract = {
    params ["_radiotruck"];

    _radiotruck setVariable ["GRAD_isDeployed", false, true];
 	[_radiotruck, 0] call rhs_fnc_gaz66_radioDeploy;

    _fuel = _radiotruck getVariable ["GRAD_fuel", 1];
    [_radiotruck, _fuel] remoteExec ["setFuel", owner _radiotruck];
};
