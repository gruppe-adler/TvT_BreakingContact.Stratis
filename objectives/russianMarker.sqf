_target = _this select 0;

_maxSize = 200; //marker precision (radius)
_size = 1;
_animationSpeed = 0.05;


_points = 0;
_maxPoints = 5400; // 1.5h
hideMarker = false;

// waitUntil { ((OPFOR_TELEPORTED) && (BLUFOR_TELEPORTED)) };
bluforCaptured = {
	BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";
};

bluforSurrendered = {
	BLUFOR_SURRENDERED = true; publicVariable "BLUFOR_SURRENDERED";
};



[_size,_maxSize,_animationSpeed] spawn 
	{
	private ["_pulsemarker","_pulsesize","_pulseMaxSize"];
	_pulsesize = _this select 0;
	_pulseMaxSize = _this select 1;
	_pulseSpeed = _this select 2;
	
	_modifier = 1;

	inner_marker = createMarkerLocal ["opfor_marker", [0,0,0]];
	"opfor_marker" setMarkerShapeLocal "ELLIPSE";
	"opfor_marker" setMarkerTypeLocal "mil_unknown";
	"opfor_marker" setMarkerColorLocal "ColorRed";
	"opfor_marker" setMarkerAlphaLocal 1;
	"opfor_marker" setMarkerSizeLocal [_pulsesize, _pulsesize];
	"opfor_marker" setMarkerBrushLocal "Border";

	while {true} do {
			if (_pulsesize > _pulseMaxSize) then {
			_pulsesize = 1;
			_modifier = 0.3;
			};
			_pulsesize = _pulsesize + _modifier;
			_modifier = _modifier + 0.3;
		if (!RUSSIAN_MARKER_HIDDEN) then {
			"opfor_marker" setMarkerAlphaLocal _pulsesize/_pulseMaxSize;
			} else {
			 "opfor_marker" setMarkerAlphaLocal 0;
		};
		"opfor_marker" setMarkerSizeLocal [_pulsesize,_pulsesize];
		"opfor_marker" setMarkerPosLocal RUSSIAN_MARKER_POS;
		sleep _pulseSpeed;
		
		};
};

	



// SERVER ZÄHLT PUNKTE
if (isServer || isDedicated) then {
	while {true} do {
		if ((funkwagen getVariable ["tf_range",0]) == 50000) then 
			{
			_points = _points + 1;
			RUSSIAN_MARKER_HIDDEN = false;
			publicVariable "RUSSIAN_MARKER_HIDDEN";
			//hintSilent format ["%1 Minuten gesendet",round (_points/60)];
			} else {
			RUSSIAN_MARKER_HIDDEN = true;
			publicVariable "RUSSIAN_MARKER_HIDDEN";
		};
		if (_points > _maxPoints) exitWith {
			[] call bluforSurrendered;
			 [[[localize "str_GRAD_winmsg_points","all"],"mp_helpers\hint.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP; 
			};
		if (
			(_points == 60) ||
			(_points == 600) ||
			(_points == 1200) ||
			(_points == 1800) ||
			(_points == 2400) ||
			(_points == 3000) ||
			(_points == 3600) ||
			(_points == 4200) ||
			(_points == 4800)
			) then {
			_string = "Die Russen haben schon " + str (round((_points/_maxPoints)*100)) + " Prozent gesendet.";
			//hintSilent format ["%1",_string];
			 [[[_string,"blufor"],"mp_helpers\hint.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP; 
		};

		if (!alive funkwagen) exitWith {
			[] call bluforCaptured;
		};
		sleep 1;
		_targetPosition = [getPos funkwagen select 0,getPos funkwagen select 1];
		RUSSIAN_MARKER_POS = _targetPosition; publicVariable "RUSSIAN_MARKER_POS";
	};
};

