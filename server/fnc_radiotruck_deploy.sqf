fnc_radiotruck_deploy = {
    params ["_radiotruck"];

    _fuel = fuel _radiotruck;
    _owner = owner _radiotruck;

    _radiotruck setVariable ["GRAD_isDeployed", true, true];
    [_radiotruck, 1] call rhs_fnc_gaz66_radioDeploy;

    _radiotruck setVariable ["GRAD_fuel", _fuel, true];
    [_radiotruck, 0] remoteExec ["setFuel", _owner];
};
