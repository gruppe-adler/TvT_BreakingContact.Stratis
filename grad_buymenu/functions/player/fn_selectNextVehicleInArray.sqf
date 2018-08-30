if (DEBUG) then {
	diag_log format ["SELECT_NEXT_VEHICLE_IN_ARRAY : %1", (_this select 0) select 0];
};

_supplies = missionNamespace getVariable (player getVariable 'GRAD_buymenu_supplies_name');
_selector = (_this select 0) select 0 getVariable ["GRAD_vehicleIndex",0];

if (DEBUG) then {
	diag_log format ["SELECT_NEXT_VEHICLE_IN_ARRAY: vehicle index is %2", _supplies, _selector];
};

_supplyItem = _supplies getVariable _selector;

_vehicleArray = _supplyItem select 0;
_vehicleArrayResorted = [_vehicleArray] call GRAD_buymenu_fnc_moveFirstToLast;
_supplyItem set [0, _vehicleArrayResorted];

call GRAD_buymenu_fnc_refreshGUI;

diag_log format ["%1 ..... supplies are now %2", _vehicleArray select 0, _vehicleArrayResorted select 0];