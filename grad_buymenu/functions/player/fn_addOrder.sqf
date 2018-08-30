params ["_selector"];


_supplyItem = (missionNamespace getVariable (player getVariable 'GRAD_buymenu_supplies_name')) getVariable _selector;
_classname = _supplyItem select 0;
_eta = _supplyItem select 4;
_init = _supplyItem select 5;
_calls = _supplyItem select 6;
_method = _supplyItem select 8;

// position and cost
_endProcess = [_selector, _supplyItem select 3] call GRAD_buymenu_fnc_immediatelyLockButton;

if (_endProcess) exitWith {diag_log format ["createOrder: too expensive, exiting..."];};

diag_log format ["addOrder: %1", _classname];

_neworder = "Flag_NATO_F" createVehicle [0, 0, 0];
_neworder setVariable ['eta', _eta, true];
_neworder setVariable ['classname', _classname, true];
_neworder setVariable ['init', _init, true];
_neworder setVariable ['calls', _calls, true];
_neworder setVariable ['method', _method, true];
_neworder setVariable ['selector', _selector, true];

if (_method != 4) then {
	_neworder setVariable ['position', call (player getVariable "GRAD_buymenu_spawn_land"), true];
} else {
	_neworder setVariable ['position', call (player getVariable "GRAD_buymenu_spawn_water"), true];
};

[player, _neworder] remoteExecCall ["GRAD_buymenu_fnc_apiCreateOrder", 2];
// DANGER: NEVER USE THIS _neworder REFERENCE AGAIN ON THIS CLIENT! OBJECT IS PASSED TO SERVER AND *WILL BE DELETED THERE*