private ["_pulseSpeed","_pulsesize","_pulseMaxSize", "_modifier"];

playSound "beep";
if (playerSide == west) then {
	cutRsc ["gui_intel_paper_us","PLAIN",0];
} else {
	cutRsc ["gui_intel_paper_rus","PLAIN",0];
};

player setVariable ["GRAD_tracking_terminalAnimation", true];
_pulsesize = _this select 0;
_pulseMaxSize = _this select 1;
_pulseSpeed = _this select 2;
_pulseDelayBetween = _this select 3;
_modifier = 1;

mrk_terminal setMarkerAlphaLocal 1;

while {!GRAD_TERMINAL_MARKER_HIDDEN} do {
	if (_pulsesize > _pulseMaxSize) then {
		_pulsesize = 0.01;
		_modifier = 0.3;
		sleep _pulseDelayBetween;
	};

	_pulsesize = _pulsesize + _modifier;
	_modifier = _modifier + 0.1;
	mrk_terminal setMarkerAlphaLocal 1 - (_pulsesize/_pulseMaxSize);
	mrk_terminal setMarkerSizeLocal [_pulsesize, _pulsesize];
	
	sleep _pulseSpeed;
	
};

player setVariable ["GRAD_tracking_terminalAnimation", false];
call GRAD_tracking_fnc_hintEndTransmission;
