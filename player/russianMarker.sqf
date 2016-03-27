
xxx = createMarkerLocal ["opfor_marker", [0, 0, 0]];
"opfor_marker" setMarkerShapeLocal "ELLIPSE";
"opfor_marker" setMarkerTypeLocal "mil_unknown";
"opfor_marker" setMarkerColorLocal "ColorOpfor";
"opfor_marker" setMarkerAlphaLocal 0;
"opfor_marker" setMarkerSizeLocal [1, 1];
"opfor_marker" setMarkerBrushLocal "SolidFull";

markerAnimationIsRunning = false;

markerAnimation = {
	private ["_pulseSpeed","_pulsesize","_pulseMaxSize", "_modifier"];

	playSound "beep";
	if (playerSide == west) then {
		cutRsc ["gui_intel_paper_us","PLAIN",0];
	} else {
		cutRsc ["gui_intel_paper_rus","PLAIN",0];
	};

	markerAnimationIsRunning = true;
	_pulsesize = _this select 0;
	_pulseMaxSize = _this select 1;
	_pulseSpeed = _this select 2;
	_modifier = 1;

	

	"opfor_marker" setMarkerAlphaLocal 1;
	while {!RUSSIAN_MARKER_HIDDEN} do {
		if (_pulsesize > _pulseMaxSize) then {
			_pulsesize = 0.01;
			_modifier = 0.3;
			if (RADIO_PORTABLE_ACTIVE && RADIO_PORTABLE) then {
				sleep 4; // if radio is carried or dropped, it sends much slower
				"opfor_marker" setMarkerColorLocal "ColorGrey";
				_pulseSpeed = 0.02;
			};
			if (RADIO_PORTABLE_ACTIVE && !RADIO_PORTABLE && (funkwagen getVariable ["tf_range",0]) == 50000)) then {
				sleep 1;
				_pulseSpeed = 0.01; // if radio is combined with radio truck, it sends  faster
				"opfor_marker" setMarkerColorLocal "ColorRed";
			};

			if (RADIO_PORTABLE_ACTIVE && !RADIO_PORTABLE && (funkwagen getVariable ["tf_range",0]) != 50000)) then {
				sleep 4; // if radio is carried or dropped, it sends much slower
				"opfor_marker" setMarkerColorLocal "ColorGrey";
				_pulseSpeed = 0.02;
			};
			if ((RADIO_PORTABLE && !RADIO_PORTABLE_ACTIVE) || (!RADIO_PORTABLE && !RADIO_PORTABLE_ACTIVE)) then {
				sleep 1;
				"opfor_marker" setMarkerColorLocal "ColorOpfor";
				_pulseSpeed = 0.02;
			};
		};

		_pulsesize = _pulsesize + _modifier;
		_modifier = _modifier + 0.1;
		"opfor_marker" setMarkerAlphaLocal 1 - (_pulsesize/_pulseMaxSize);
		"opfor_marker" setMarkerSizeLocal [_pulsesize, _pulsesize];
		
		sleep _pulseSpeed;
	};

	markerAnimationIsRunning = false;
	call endTransmissionEffects;
	
};

ensureMarkerAnimation = {
	_maxSize = 250; //marker precision (radius)
	_size = 0.01;
	_animationSpeed = 0.02;

	if (!markerAnimationIsRunning) then {
		
		[_size, _maxSize, _animationSpeed] spawn markerAnimation;
	};
};

endTransmissionEffects = {
	playSound "signal_lost";
	if (playerSide == west) then {
		cutRsc ["gui_intel_paper_us_lost","PLAIN",0];
	} else {
		cutRsc ["gui_intel_paper_rus_lost","PLAIN",0];
	};

};

_RUSSIAN_MARKER_POS_listener = {
	"opfor_marker" setMarkerPosLocal (_this select 1);
};

_RUSSIAN_MARKER_HIDDEN_listener = {
	if (_this select 1) then {
		"opfor_marker" setMarkerAlphaLocal 0;
	} else {
		call ensureMarkerAnimation;	
	};
};

"RUSSIAN_MARKER_POS" addPublicVariableEventHandler _RUSSIAN_MARKER_POS_listener;
"RUSSIAN_MARKER_HIDDEN" addPublicVariableEventHandler _RUSSIAN_MARKER_HIDDEN_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	[_RUSSIAN_MARKER_HIDDEN_listener, _RUSSIAN_MARKER_POS_listener] spawn {
		while {true} do {
			[0, RUSSIAN_MARKER_HIDDEN] call (_this select 0);
			[0, RUSSIAN_MARKER_POS] call (_this select 1);
			sleep 2;
		};
	};
};
