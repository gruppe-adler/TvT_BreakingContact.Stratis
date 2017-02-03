fnc_addOrder = {
    _immediatelyLockButton = {
    	params ["_selector", "_cost"];

    	_return = false;
        _idc = GRAD_buymenu_currentMenuBuyButtonIDCs getVariable [_selector, -1];

        if (_idc == -1) exitWith {
            diag_log format ['something is wrong, no idc for button %1', _this];
        };

		_moneyVar = player getVariable "GRAD_buymenu_money_name";
		_money = missionNamespace getVariable _moneyVar;

		_newMoney = _money - _cost;
		if (_newMoney < 0) exitWith {
			_btn =  findDisplay 1337 displayCtrl _idc;

			ctrlSetText [_idc, localize 'str_GRAD_buy_tooexpensive'];
			_btn ctrlSetTextColor  [0.8,0.2,0.2,1];
        	ctrlEnable [_idc, false];

			_return = true;
			_return
		};

        ctrlSetText [_idc, localize 'str_GRAD_buy_calling'];
        ctrlEnable [_idc, false];

        _return
    };



	_selector = _this select 0;

	

	_supplyItem = (missionNamespace getVariable (player getVariable 'GRAD_buymenu_supplies_name')) getVariable _selector;
	_classname = _supplyItem select 0;
	_eta = _supplyItem select 4;
	_init = _supplyItem select 5;
	_calls = _supplyItem select 6;
	_method = _supplyItem select 8;

	// position and cost
    _endProcess = [_selector, _supplyItem select 3] call _immediatelyLockButton;

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

	[player, _neworder] remoteExecCall ["fnc_api_createOrder", 2];
	// DANGER: NEVER USE THIS _neworder REFERENCE AGAIN ON THIS CLIENT! OBJECT IS PASSED TO SERVER AND *WILL BE DELETED THERE*
};
