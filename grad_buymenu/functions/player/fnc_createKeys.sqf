fnc_createKeys = {
    disableSerialization;

    _idc = _this select 0;
    _display = _this select 1;
    _xPos = safeZoneX + safeZoneW/20;

    _ctrlPriceKey =  _display ctrlCreate ["RscStructuredText", _idc];
  	_ctrlPriceKey ctrlSetPosition [_xPos, safeZoneH/20*9, safeZoneW/20, safeZoneH/10];
  	_ctrlPriceKey ctrlSetBackgroundColor [0,0,0,0];
  	_ctrlPriceKey ctrlSetStructuredText parseText ("<t color='#c0c0c0'  shadow='0' align='left'>Price</t>");
  	_ctrlPriceKey ctrlSetTextColor [1,1,1,0.5];

    _ctrlAmountKey =  _display ctrlCreate ["RscStructuredText", _idc];
    _ctrlAmountKey ctrlSetPosition [_xPos,safeZoneH/20*9.5, safeZoneW/20, safeZoneH/10];
    _ctrlAmountKey ctrlSetBackgroundColor [0,0,0,0];
    _ctrlAmountKey ctrlSetStructuredText parseText ("<t color='#c0c0c0' shadow='0' align='left'>Amount</t>");
    _ctrlAmountKey ctrlSetTextColor [1,1,1,0.5];

    _ctrlMethodKey =  _display ctrlCreate ["RscStructuredText", _idc];
    _ctrlMethodKey ctrlSetPosition [_xPos,safeZoneH/20*11, safeZoneW/20, safeZoneH/10];
    _ctrlMethodKey ctrlSetBackgroundColor [0,0,0,0];
    _ctrlMethodKey ctrlSetStructuredText parseText ("<t color='#c0c0c0' shadow='0' align='left'>Method</t>");
    _ctrlMethodKey ctrlSetTextColor [1,1,1,0.5];

    _ctrlAmountKey ctrlCommit 0;
    _ctrlPriceKey ctrlCommit 0;
    _ctrlMethodKey ctrlCommit 0;
};
