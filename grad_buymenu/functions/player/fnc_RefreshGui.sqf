fnc_refreshGUI = {
	if (!dialog) exitWith {};
	// closeDialog 0;
	diag_log format ["refreshing gui"];
	_gui = [true] call fnc_createEntries;
	_toolbar = [_gui, true] spawn fnc_createToolbar;
};
