fnc_refreshGUI = {
	if (!dialog) exitWith {};
	closeDialog 0;
	diag_log format ["refreshing gui"];
	_gui = [] call fnc_createEntries;
	_toolbar = [_gui] spawn fnc_createToolbar;
};
