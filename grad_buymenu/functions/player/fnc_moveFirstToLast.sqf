fnc_selectNextVehicleInArray = {

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
	_vehicleArrayResorted = [_vehicleArray] call fnc_moveFirstToLast;
	_supplyItem set [0, _vehicleArrayResorted];

	call fnc_refreshGUI;

	diag_log format ["%1 ..... supplies are now %2", _x, _vehicleArrayResorted select 0];
};

fnc_moveFirstToLast = {
 _array = _this select 0;

 if (count _array > 1) then {
  _first = _array select 0;
  _next = _array select 1;
  _last = _array select (count _array -1);

  {
   if (_foreachindex < (count _array) -1) then {
    _array set [_foreachindex,_array select (_foreachindex + 1)]
   };
  } forEach _array;
  _array set [(count _array) - 1,_first];
 };

 _array
};
