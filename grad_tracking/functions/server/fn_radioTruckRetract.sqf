params ["_radiotruck"];

_radiotruck setVariable ["GRAD_isAnimating", true, true];
	[_radiotruck, 0] call rhs_fnc_gaz66_radioDeploy;

	_count = ceil (random 6);
	for "_i" from 0 to _count do {
		 
		playsound3d ["rhsafrf\addons\rhs_gaz66\data\sounds\zil_gaz66_start.wss", _radiotruck]; 
		sleep 2.9; 
		playsound3d ["A3\Sounds_F\vehicles\soft\Truck_02\ext_stop.wss", _radiotruck];
		
	};
	
	
	_radiotruck setVariable ["GRAD_isDeployed", false, true];
	_radiotruck setVariable ["GRAD_isAnimating", false, true];
_fuel = _radiotruck getVariable ["GRAD_fuel", 1];
[_radiotruck, _fuel] remoteExec ["setFuel", owner _radiotruck];
[_radiotruck, true] remoteExec ["engineOn", owner _radiotruck];