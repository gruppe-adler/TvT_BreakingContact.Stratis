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

if (!TRACKING_PERSON) then {
	mrk_radioVeh setMarkerAlphaLocal 1;
} else {
	mrk_radioVeh setMarkerSizeLocal [GRAD_SIGNAL_SIZE,GRAD_SIGNAL_SIZE];
	mrk_radioVeh setMarkerAlphaLocal 0.3;
};

/* _radioPositionMarkers = missionNamespace getVariable ["BC_objectives_radioPositionMarkers", []];*/

while {!GRAD_RADIO_VEH_MARKER_HIDDEN} do {

	// find nearest marker
	/*{
		if ((getMarkerPos _x) distance GRAD_RADIO_VEH_MARKER_POS < GRAD_MIN_DISTANCE_TO_RADIOPOSITION) then {
			_x setMarkerColorLocal "ColorYellow";
		} else {
			_x setMarkerColorLocal "ColorOpfor";
		};
	} forEach _radioPositionMarkers;
	*/

	if (!TRACKING_PERSON) then {
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

	} else {
		mrk_lastseen setMarkerPosLocal GRAD_RADIO_VEH_MARKER_POS;
		mrk_radioVeh setMarkerPosLocal GRAD_RADIO_VEH_MARKER_POS;
		mrk_radioVeh setMarkerSizeLocal [GRAD_SIGNAL_SIZE,GRAD_SIGNAL_SIZE];
		sleep 1;
	};
};

// reset radioposition marker color
/*
{
	_x setMarkerColorLocal "ColorOpfor";	
} forEach _radioPositionMarkers;
*/

player setVariable ["GRAD_tracking_radioVehAnimation", false];
call GRAD_tracking_fnc_hintEndTransmission;