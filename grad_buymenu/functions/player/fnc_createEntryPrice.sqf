fnc_createEntryPrice = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_title = _this select 4;

	_ctrlPrice =  _display ctrlCreate ["RscStructuredText", _idc];

	_ctrlPrice ctrlSetPosition [_xPos, safeZoneH/20*9, _width, safeZoneH/10];
	_ctrlPrice ctrlSetBackgroundColor [0,0,0,0];

	_ctrlPrice ctrlSetStructuredText parseText ("<t color='#c1a43e'  shadow='0' align='center'>" + (str _title) + " cr</t>");
	_ctrlPrice ctrlSetTextColor [1,1,1,1];
	_ctrlPrice ctrlCommit 0;
};
