fnc_addOrder = {
    _immediatelyLockButton = {
        _idc = GRAD_buymenu_currentMenuBuyButtonIDCs getVariable [_this, -1];
        if (_idc == -1) exitWith {
            diag_log format ['something is wrong, no idc for button %1', _this];
        };
        ctrlSetText [_idc, 'Ordering...'];
        //ctrlSetTextColor [_idc, 'ordering...'];
        ctrlEnable [_idc, false];
    };



	_selector = _this select 0;

    _selector call _immediatelyLockButton;

	_supplyItem = (missionNamespace getVariable (player getVariable 'GRAD_buymenu_supplies_name')) getVariable _selector;
	_classname = _supplyItem select 0;
	_eta = _supplyItem select 4;
	_init = _supplyItem select 5;
	_calls = _supplyItem select 6;
	_method = _supplyItem select 8;

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

	[player, _neworder] remoteExecCall ["fnc_api_createOrder", 2];
	// DANGER: NEVER USE THIS _neworder REFERENCE AGAIN ON THIS CLIENT! OBJECT IS PASSED TO SERVER AND *WILL BE DELETED THERE*
};
