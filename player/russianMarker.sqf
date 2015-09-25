
xxx = createMarkerLocal ["opfor_marker", [0, 0, 0]];
"opfor_marker" setMarkerShapeLocal "ELLIPSE";
"opfor_marker" setMarkerTypeLocal "mil_unknown";
"opfor_marker" setMarkerColorLocal "ColorRed";
"opfor_marker" setMarkerAlphaLocal 1;
"opfor_marker" setMarkerSizeLocal [1, 1];
"opfor_marker" setMarkerBrushLocal "Border";

markerAnimationIsRunning = false;

markerAnimation = {
	private ["_pulseSpeed","_pulsesize","_pulseMaxSize", "_modifier"];

	markerAnimationIsRunning = true;
	_pulsesize = _this select 0;
	_pulseMaxSize = _this select 1;
	_pulseSpeed = _this select 2;
	_modifier = 1;

	"opfor_marker" setMarkerAlphaLocal 1;
	while {!RUSSIAN_MARKER_HIDDEN} do {
		if (_pulsesize > _pulseMaxSize) then {
			_pulsesize = 1;
			_modifier = 0.3;
		};
		_pulsesize = _pulsesize + _modifier;
		_modifier = _modifier + 0.3;
		"opfor_marker" setMarkerAlphaLocal 1 - (_pulsesize/_pulseMaxSize);
		"opfor_marker" setMarkerSizeLocal [_pulsesize, _pulsesize];
		sleep _pulseSpeed;
	};

	markerAnimationIsRunning = false;
};

ensureMarkerAnimation = {
	_maxSize = 200; //marker precision (radius)
	_size = 1;
	_animationSpeed = 0.05;

	if (!markerAnimationIsRunning) then {

		[_size, _maxSize, _animationSpeed] spawn markerAnimation;
	};
};

RUSSIAN_MARKER_POS_listener = {
	"opfor_marker" setMarkerPosLocal (_this select 1);
};

RUSSIAN_MARKER_HIDDEN_listener = {
	if (_this select 1) then {
		"opfor_marker" setMarkerAlphaLocal 0;
	} else {
		call ensureMarkerAnimation;
	};
};

"RUSSIAN_MARKER_POS" addPublicVariableEventHandler RUSSIAN_MARKER_POS_listener;
"RUSSIAN_MARKER_HIDDEN" addPublicVariableEventHandler RUSSIAN_MARKER_HIDDEN_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	[] spawn {
		while {true} do {
			[0, RUSSIAN_MARKER_HIDDEN] call RUSSIAN_MARKER_HIDDEN_listener;
			[0, RUSSIAN_MARKER_POS] call RUSSIAN_MARKER_POS_listener;
			sleep 2;
		};
	};
};
