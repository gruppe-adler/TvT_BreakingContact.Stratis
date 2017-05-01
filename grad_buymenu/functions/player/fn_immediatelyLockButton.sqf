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