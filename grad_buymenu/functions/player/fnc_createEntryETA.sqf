// CURRENTLY NOT IN USE

fnc_createEntryETA = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_title = _this select 4;

	_ctrlETA =  _display ctrlCreate ["RscStructuredText", _idc];

	_ctrlETA ctrlSetPosition [_xPos, safeZoneH/20*10, _width, safeZoneH/10];
	_ctrlETA ctrlSetBackgroundColor [0,0,0,0];

	_ctrlETA ctrlSetStructuredText parseText ("<t shadow='0' align='center'>" + str _title + "</t>");
	_ctrlETA ctrlSetTextColor [1,1,1,1];

	_ctrlETA ctrlCommit 0;
};
