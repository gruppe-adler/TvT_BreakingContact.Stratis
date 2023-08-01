params ["_radiotruck"];

_radiotruck setVariable ["GRAD_isAnimating", true, true];

private _type = typeOf _radiotruck;

if (_type == "rhs_gaz66_r142_vv") exitWith {
	[_radiotruck, 0] spawn rhs_fnc_gaz66_radioDeploy;
    sleep 3;
    _radiotruck setVariable ["GRAD_isDeployed", false, true];
    _radiotruck setVariable ["GRAD_isAnimating", false, true];
};
_radiotruck setVariable ["tf_range", 0, true]; // for vehicles other than rhs radio truck

if (_type == "SPE_US_M3_Halftrack_Repair" || {_type == "SPE_OpelBlitz_Repair"}) then {
    private _antenna = _radiotruck getVariable 'BC_ww2_antenna';
    deleteVehicle _antenna;
    _radiotruck setVariable ["BC_ww2_antenna", objNull, true];
};

sleep 3;
_radiotruck setVariable ["GRAD_isDeployed", false, true];
_radiotruck setVariable ["GRAD_isAnimating", false, true];


_fuel = _radiotruck getVariable ["GRAD_fuel", 1];
[_radiotruck, _fuel] remoteExecCall ["setFuel", owner _radiotruck];

// [_radiotruck, true] remoteExec ["engineOn", owner _radiotruck];

/*
private _antenna = _radiotruck getVariable ["BC_antennaObj", objNull];
if (!isNull _antenna) then {
    detach _antenna;
    deleteVehicle _antenna;
};
*/
