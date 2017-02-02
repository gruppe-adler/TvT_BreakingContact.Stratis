params ["_vehicle"];

_manpad = "rhs_Igla_AA_pod_msv" createVehicle [0,0,0];

_manpad attachto[_vehicle,[0.4,-1.5,0.58]];

// remove default get out action, as it spawns you floating above the truck
_manpad setVehicleLock "LOCKED";

_vehicle setVariable ["attachedObject",_manpad, true];
_manpad setVariable ["attachedToObject", _vehicle, true];

[_vehicle] remoteExec ["GRAD_addGetInActionAA",0,true];
[_manpad] remoteExec ["GRAD_addGetOutActionAA",0,true];

_vehicle addEventHandler ["killed", { 
	_manpad = (_this select 0) getVariable ["attachedObject", objNull];
	if (!isNull _manpad) then {
		_manpad setDamage 1;
	};
}];