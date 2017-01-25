fnc_createToolbarHeadline = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_title = _this select 2;


	_ctrlHeadline =  _display ctrlCreate ["RscStructuredText", _idc];


	_ctrlHeadline ctrlSetBackgroundColor [0,0,0,0];

	_ctrlHeadline ctrlSetStructuredText parseText ("<t size='4' shadow='0' align='center'>" + _title + "</t>");
	_ctrlHeadline ctrlSetTextColor [1,1,1,0.2];
	_ctrlHeadline ctrlSetPosition [
		safeZoneX + (safeZoneX + safeZoneW)/5,
		safeZoneY + (safeZoneY + safeZoneH)/20,
		safeZoneX + safeZoneW,
		safeZoneH/10
	];

	_ctrlHeadline ctrlCommit 0;
};
