fnc_createToolbarExitButton = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_title = _this select 4;


	_btn =  _display ctrlCreate ["RscButton", _idc];

	_btn ctrlSetPosition [_xPos, safeZoneY + safeZoneH/20, _width, safeZoneH/20];
	_btn ctrlSetBackgroundColor [0,0,0,0];
	_btn ctrlSetTextColor  [1,1,1,0.5];

	_btn ctrlSetText _title;	
	buttonSetAction [_idc, "closeDialog 0; buyMenuOpen = false"];

	_btn ctrlCommit 0;
};