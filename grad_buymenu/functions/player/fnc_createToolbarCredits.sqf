fnc_createToolbarCredits = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_title = _this select 4;


	_ctrlCredits =  _display ctrlCreate ["RscStructuredText", _idc];

	_ctrlCredits ctrlSetPosition [_xPos, safeZoneY + safeZoneH/20, _width, safeZoneH/20];
	_ctrlCredits ctrlSetBackgroundColor [-1,-1,-1,0];

	[_title] spawn fnc_refreshCredits;


};
