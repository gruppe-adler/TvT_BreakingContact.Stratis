params ["_vehicle"];

private _flag = _vehicle getVariable ["GRAD_flagObject",objNull];
if (isNull _flag) exitWith {};

detach _flag;
deleteVehicle _flag;

_vehicle setVariable ["GRAD_showFlag", false, true];
_vehicle setVariable ["GRAD_flagObject",objNull, true];
