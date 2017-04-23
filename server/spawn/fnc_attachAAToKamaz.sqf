params ["_vehicle"];

_manpad = "RHS_Stinger_AA_pod_WD" createVehicle [0,0,0];

_manpad attachto[_vehicle,[0.4,-1.5,0.58]];

// remove default get out action, as it spawns you floating above the truck
_manpad setVehicleLock "LOCKED";

_vehicle setVariable ["attachedObject",_manpad, true];
_manpad setVariable ["attachedToObject", _vehicle, true];

[_vehicle] remoteExec ["GRAD_addGetInActionAA",0,true];
[_manpad] remoteExec ["GRAD_addGetOutActionAA",0,true];

[_manpad, false, [0, 0, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
[_manpad, false, [0, 0, 0], 0] remoteExec ["ace_dragging_fnc_setDraggable", 0, true];

_vehicle addEventHandler ["killed", {
	_manpad = (_this select 0) getVariable ["attachedObject", objNull];
	if (!isNull _manpad) then {
		_manpad setDamage 1;
	};
}];

[{
	params ["_args","_handle"];
	_args params ["_vehicle","_manpad"];

	if (!alive _vehicle || isNull _vehicle) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
	if (_vehicle getHitPointDamage "HitEngine" > 0.8 && {_vehicle getHitPointDamage "HitBody" > 0.8}) exitWith {
		_manpad setDamage 1;
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
} , 1, [_vehicle,_manpad]] call CBA_fnc_addPerFrameHandler;
