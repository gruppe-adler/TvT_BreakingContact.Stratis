disableSerialization;
_ctrl = ctrlIDC  (_this select 0);
_time = (vehiclesRussian select 0) select 5;

diag_log format ["//////////////////////"];
diag_log format ["control: %1, time: %2",_ctrl,_time];
diag_log format ["//////////////////////"];

disableSerialization;
_origText = ctrlText _ctrl;

disableSerialization;
ctrlEnable [1001, false];
ctrlEnable [1002, false];
ctrlEnable [1003, false];
ctrlEnable [1004, false];

_string = format ["Kommt in %1 s",_time];

disableSerialization;
ctrlSetText [_ctrl, _string];

_origHeadlineText = ctrlText 1100;
ctrlSetText [1100, "Nachschub"];

[_ctrl,_time,_origText] spawn {
	_control = _this select 0;
	_timer = _this select 1;
	_orig = _this select 2;
	_string = format ["ETA %1 s",_timer];

	while {_timer > -1} do {
		_string = format ["ETA %1 s",_timer];
		disableSerialization;
		ctrlSetText [_control, _string];
		_timer = _timer - 1;
		sleep 1;
	};

	ctrlSetText [_control, "bitte warten"];
	sleep 5;

	if (true) exitWith {
		disableSerialization;
		ctrlEnable [1001, true];
		ctrlEnable [1002, true];
		ctrlEnable [1003, true];
		ctrlEnable [1004, true];
		ctrlSetText [_control,_orig];
	};
};
