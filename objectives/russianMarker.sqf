_target = _this select 0;

_maxSize = 200; //marker precision (radius)
_size = 1;
_animationSpeed = 0.05;


_points = 0;
hideMarker = false;

// waitUntil { ((OPFOR_TELEPORTED) && (BLUFOR_TELEPORTED)) };
bluforCaptured = {
	BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";
};

bluforSurrendered = {
	BLUFOR_SURRENDERED = true; publicVariable "BLUFOR_SURRENDERED";
};

funkwagenIsSending = {
	(funkwagen getVariable ["tf_range",0]) == 50000;
};

setRussianMarkerStatus = {
	_previous = RUSSIAN_MARKER_HIDDEN;
	RUSSIAN_MARKER_HIDDEN = _this select 0;
	if (RUSSIAN_MARKER_HIDDEN != _previous) then {
		publicVariable "RUSSIAN_MARKER_HIDDEN";
	};
};

setRussianMarkerPosition = {
	_prev = RUSSIAN_MARKER_POS;
	RUSSIAN_MARKER_POS = _this;
	if ((_prev select 0 != RUSSIAN_MARKER_POS select 0) || (_prev select 1 != RUSSIAN_MARKER_POS select 1)) then { // TODO um arrays zu vergleichen  gibts doch bsetimmt ne schönere funktion
		publicVariable "RUSSIAN_MARKER_POS";
	};
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
if (isServer) then {
	_tenPercentOfPointsNeededForVictory = floor (POINTS_NEEDED_FOR_VICTORY / 10);
	while {true} do {
		_isSending = call funkwagenIsSending;
		if (_isSending) then {
			_points = _points + 1;
		};
		!_isSending call setRussianMarkerStatus;

		if (_points > POINTS_NEEDED_FOR_VICTORY) exitWith {
			[] call bluforSurrendered;
			// TODO auch hier: publicVariableEventHandler aufm client -- oder wenn man nur scripte aufm server machen will, kann mans auch lassen mit den globalen variablen, und nur remoteExec verwenden... hm...
			[[[localize "str_GRAD_winmsg_points","all"],"helpers\hint.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
		};

		// TODO: diese warnung sollte besser vom Client erstellt werden, der sich über einen publicVariable-EventHandler an den Wert von POINTS_NEEDED_FOR_VICTORY hängt :)
		if ((_points % _tenPercentOfPointsNeededForVictory) == 0) then // alle 10% die Warnung
			_string = "Die Russen haben schon " + str (round((_points/POINTS_NEEDED_FOR_VICTORY)*100)) + " Prozent gesendet.";
			 [[[_string,"blufor"],"helpers\hint.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
		};

		if (!alive funkwagen) exitWith {
			[] call bluforCaptured;
		};

		[getPos funkwagen select 0, getPos funkwagen select 1] call setRussianMarkerPosition;

		sleep 1;
	};
};

