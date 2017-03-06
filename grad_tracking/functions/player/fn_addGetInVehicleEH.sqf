params ["_unit"];

_unit addEventhandler ["GetInMan", {
	private _unit = _this select 0;
	private _veh = _this select 2;

	[_unit, _veh] remoteExec ["GRAD_tracking_fnc_registerVehicleEnter", [0, -2] select isDedicated, true];
}];

_unit addEventhandler ["GetOutMan", {
	private _unit = _this select 0;
	private _veh = _this select 2;
	
	[_unit, _veh] remoteExec ["GRAD_tracking_fnc_registerVehicleExit", [0, -2] select isDedicated, true];
	
}];