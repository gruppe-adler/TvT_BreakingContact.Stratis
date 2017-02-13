endTransmissionEffects = {
	playSound "signal_lost";
	if (playerSide == west) then {
		cutRsc ["gui_intel_paper_us_lost","PLAIN",0];
	} else {
		cutRsc ["gui_intel_paper_rus_lost","PLAIN",0];
	};

};

// create initial markers
_nul = createMarkerLocal ["radio_truck_marker", [0, 0, 0]];
"radio_truck_marker" setMarkerShapeLocal "ELLIPSE";
"radio_truck_marker" setMarkerColorLocal "ColorRed";
"radio_truck_marker" setMarkerAlphaLocal 0;
"radio_truck_marker" setMarkerSizeLocal [1, 1];
"radio_truck_marker" setMarkerBrushLocal "SolidFull";

_nul2 = createMarkerLocal ["radio_box_marker", [0, 0, 0]];
"radio_box_marker" setMarkerShapeLocal "ELLIPSE";
"radio_box_marker" setMarkerColorLocal "ColorOpfor";
"radio_box_marker" setMarkerAlphaLocal 0;
"radio_box_marker" setMarkerSizeLocal [1, 1];
"radio_box_marker" setMarkerBrushLocal "SolidFull";

_nul3 = createMarkerLocal ["last_seen", [0, 0, 0]];
"last_seen" setMarkerShapeLocal "ICON";
"last_seen" setMarkerColorLocal "ColorOpfor";
"last_seen" setMarkerAlphaLocal 0;
"last_seen" setMarkerTypeLocal "hd_dot";
"last_seen" setMarkerTextLocal "last transmission";

radioTruckMarkerAnimationIsRunning = false;
radioBoxMarkerAnimationIsRunning = false;

radioTruckMarkerAnimation = {
	private ["_pulseSpeed","_pulsesize","_pulseMaxSize", "_modifier"];

	playSound "beep";
	if (playerSide == west) then {
		cutRsc ["gui_intel_paper_us","PLAIN",0];
	} else {
		cutRsc ["gui_intel_paper_rus","PLAIN",0];
	};

	radioTruckMarkerAnimationIsRunning = true;
	_pulsesize = _this select 0;
	_pulseMaxSize = _this select 1;
	_pulseSpeed = _this select 2;
	_pulseDelayBetween = _this select 3;
	_modifier = 1;

	if (!FACTIONS_DEFAULT) then {
		"last_seen" setMarkerAlphaLocal 1;
	};

	"radio_truck_marker" setMarkerAlphaLocal 1;
	while {!RADIO_TRUCK_MARKER_HIDDEN} do {
		if (_pulsesize > _pulseMaxSize) then {
			_pulsesize = 0.01;
			_modifier = 0.3;
			sleep _pulseDelayBetween;
		};



		_pulsesize = _pulsesize + _modifier;
		_modifier = _modifier + 0.1;
		"radio_truck_marker" setMarkerAlphaLocal 1 - (_pulsesize/_pulseMaxSize);
		"radio_truck_marker" setMarkerSizeLocal [_pulsesize, _pulsesize];

		
		
		sleep _pulseSpeed;
	};

	radioTruckMarkerAnimationIsRunning = false;
	call endTransmissionEffects;
	
};

radioBoxMarkerAnimation = {
	private ["_pulseSpeed","_pulsesize","_pulseMaxSize", "_modifier"];

	playSound "beep";
	if (playerSide == west) then {
		cutRsc ["gui_intel_paper_us","PLAIN",0];
	} else {
		cutRsc ["gui_intel_paper_rus","PLAIN",0];
	};

	radioBoxMarkerAnimationIsRunning = true;
	_pulsesize = _this select 0;
	_pulseMaxSize = _this select 1;
	_pulseSpeed = _this select 2;
	_pulseDelayBetween = _this select 3;
	_modifier = 1;

	"radio_box_marker" setMarkerAlphaLocal 1;
	while {!RADIO_BOX_MARKER_HIDDEN} do {
		if (_pulsesize > _pulseMaxSize) then {
			_pulsesize = 0.01;
			_modifier = 0.3;
			sleep _pulseDelayBetween;
		};

		_pulsesize = _pulsesize + _modifier;
		_modifier = _modifier + 0.1;
		"radio_box_marker" setMarkerAlphaLocal 1 - (_pulsesize/_pulseMaxSize);
		"radio_box_marker" setMarkerSizeLocal [_pulsesize, _pulsesize];
		
		sleep _pulseSpeed;
		if (!FACTIONS_DEFAULT) then {} else {"last_seen" setMarkerPosLocal RADIO_TRUCK_MARKER_POS;};
	};

	radioBoxMarkerAnimationIsRunning = false;
	call endTransmissionEffects;
	
};

// 
ensureRadioTruckMarkerAnimation = {
	_maxSize = 250; // marker radius
	_size = 0.01; // intial size
	_animationSpeed = 0.02; // delay between growth steps
	_delayBetweenPulse = 0; // delay between cycles

	if (!FACTIONS_DEFAULT) then {
		_delayBetweenPulse = 1;
	} else {
		_delayBetweenPulse = 20;
	};

	if (!radioTruckMarkerAnimationIsRunning) then {
		
		[_size, _maxSize, _animationSpeed,_delayBetweenPulse] spawn radioTruckMarkerAnimation;
	};
};

ensureRadioBoxMarkerAnimation = {
	_maxSize = 150; 
	_size = 0.01;
	_animationSpeed = 0.02;
	_delayBetweenPulse = 1;
	
	if (!FACTIONS_DEFAULT) then {
		_delayBetweenPulse = 1;
	} else {
		_delayBetweenPulse = 20;
	};

	if (!radioBoxMarkerAnimationIsRunning) then {
		
		[_size, _maxSize, _animationSpeed,_delayBetweenPulse] spawn radioBoxMarkerAnimation;
	};
};



_RADIO_TRUCK_MARKER_POS_listener = {
	"radio_truck_marker" setMarkerPosLocal (_this select 1);
	// diag_log format ["radio truck marker moved to %1", (_this select 1)];
};

_RADIO_TRUCK_MARKER_HIDDEN_listener = {
	if (_this select 1) then {
		"radio_truck_marker" setMarkerAlphaLocal 0;
	} else {
		call ensureRadioTruckMarkerAnimation;	
	};
};

_RADIO_BOX_MARKER_POS_listener = {
	"radio_box_marker" setMarkerPosLocal (_this select 1);
};

_RADIO_BOX_MARKER_HIDDEN_listener = {
	if (_this select 1) then {
		"radio_box_marker" setMarkerAlphaLocal 0;
	} else {
		call ensureRadioBoxMarkerAnimation;	
	};
};

"RADIO_TRUCK_MARKER_POS" addPublicVariableEventHandler _RADIO_TRUCK_MARKER_POS_listener;
"RADIO_TRUCK_MARKER_HIDDEN" addPublicVariableEventHandler _RADIO_TRUCK_MARKER_HIDDEN_listener;

"RADIO_BOX_MARKER_POS" addPublicVariableEventHandler _RADIO_BOX_MARKER_POS_listener;
"RADIO_BOX_MARKER_HIDDEN" addPublicVariableEventHandler _RADIO_BOX_MARKER_HIDDEN_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	[_RADIO_TRUCK_MARKER_HIDDEN_listener, _RADIO_TRUCK_MARKER_POS_listener, _RADIO_BOX_MARKER_HIDDEN_listener, _RADIO_BOX_MARKER_POS_listener] spawn {
		while {true} do {
			[0, RADIO_TRUCK_MARKER_HIDDEN] call (_this select 0);
			[0, RADIO_TRUCK_MARKER_POS] call (_this select 1);
			[0, RADIO_BOX_MARKER_HIDDEN] call (_this select 2);
			[0, RADIO_BOX_MARKER_POS] call (_this select 3);
			sleep 2;
		};
	};
};
