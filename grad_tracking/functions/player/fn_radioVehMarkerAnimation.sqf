private ["_pulseSpeed","_pulsesize","_pulseMaxSize", "_modifier"];

playSound "beep";
if (playerSide == west) then {
	cutRsc ["gui_intel_paper_us","PLAIN",0];
} else {
	cutRsc ["gui_intel_paper_rus","PLAIN",0];
};

player setVariable ["GRAD_tracking_radioVehAnimation", true];
_pulsesize = _this select 0;
_pulseMaxSize = _this select 1;
_pulseSpeed = _this select 2;
_pulseDelayBetween = _this select 3;
_modifier = 1;

if (FACTIONS_DEFAULT) then {
	mrk_lastseen setMarkerAlphaLocal 1;
};

mrk_radioVeh setMarkerAlphaLocal 1;

while {!GRAD_RADIO_VEH_MARKER_HIDDEN} do {
	if (_pulsesize > _pulseMaxSize) then {
		_pulsesize = 0.01;
		_modifier = 0.3;
		sleep _pulseDelayBetween;
	};

	_pulsesize = _pulsesize + _modifier;
	_modifier = _modifier + 0.1;
	mrk_radioVeh setMarkerAlphaLocal 1 - (_pulsesize/_pulseMaxSize);
	mrk_radioVeh setMarkerSizeLocal [_pulsesize, _pulsesize];
	

	sleep _pulseSpeed;
	if (FACTIONS_DEFAULT) then {
		mrk_lastseen setMarkerPosLocal GRAD_RADIO_VEH_MARKER_POS;
	};
};

player setVariable ["GRAD_tracking_radioVehAnimation", false];
call GRAD_tracking_fnc_hintEndTransmission;