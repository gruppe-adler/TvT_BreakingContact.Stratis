fnc_createEntryAmount = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_title = _this select 4;

	_ctrlAmount =  _display ctrlCreate ["RscStructuredText", _idc];

	_ctrlAmount ctrlSetPosition [_xPos,safeZoneH/20*9.5, _width, safeZoneH/10];
	_ctrlAmount ctrlSetBackgroundColor [0,0,0,0];

	_ctrlAmount ctrlSetStructuredText parseText ("<t shadow='0' align='center'>" + str _title + "</t>");
	_ctrlAmount ctrlSetTextColor [1,1,1,1];

	_ctrlAmount ctrlCommit 0;
};
