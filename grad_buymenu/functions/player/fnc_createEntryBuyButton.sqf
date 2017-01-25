fnc_createEntryBuyButton = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_selector = _this select 4;
	_supplies = _this select 5;
	_spawnMethod = _this select 6;
	_status = _this select 7;


	_btn =  _display ctrlCreate ["RscButton", _idc];

	_btn ctrlSetPosition [_xPos + (_width/4) - _width/16, safeZoneH/20*14, _width/2 + _width/8, safeZoneH/16];
	_btn ctrlSetBackgroundColor [0,0,0,0];
	_btn ctrlSetTextColor  [1,1,1,1];


	buttonSetAction [_idc, format["['%1', %2] call fnc_addOrder;", _selector, _spawnMethod]];

	switch (_status) do {
		case 0: {ctrlEnable [_idc, true]; _btn ctrlSetText "Order";};
		case 1: {ctrlEnable [_idc, false]; _btn ctrlSetText "En route";};
		case 2: {ctrlEnable [_idc, false]; _btn ctrlSetText "None available";};
		default {};
	};

    GRAD_buymenu_currentMenuBuyButtonIDCs setVariable [_selector, _idc];

	_btn ctrlCommit 0;
};
