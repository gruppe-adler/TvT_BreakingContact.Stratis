
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

booleanEqual = {
	_a = _this select 0;
	_b = _this select 1;

	(_a && _b) || (!_a && !_b)
};

setRussianMarkerStatus = {
	_previous = RUSSIAN_MARKER_HIDDEN;
	RUSSIAN_MARKER_HIDDEN = _this;
	if (!([RUSSIAN_MARKER_HIDDEN, _previous] call booleanEqual)) then {
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




// SERVER ZÄHLT PUNKTE
if (isServer) then {
	_tenPercentOfPointsNeededForVictory = floor (POINTS_NEEDED_FOR_VICTORY / 10);
	while {true} do {
		_isSending = call funkwagenIsSending;
		if (_isSending) then {
			RUSSIAN_POINTS = RUSSIAN_POINTS + 1;
		};
		!_isSending call setRussianMarkerStatus;

		if (RUSSIAN_POINTS > POINTS_NEEDED_FOR_VICTORY) exitWith {
			[] call bluforSurrendered;
			// TODO auch hier: publicVariableEventHandler aufm client -- oder wenn man nur scripte aufm server machen will, kann mans auch lassen mit den globalen variablen, und nur remoteExec verwenden... hm...
			[[[localize "str_GRAD_winmsg_points","all"],"helpers\hint.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
		};

		// TODO: diese warnung sollte besser vom Client erstellt werden, der sich über einen publicVariable-EventHandler an den Wert von POINTS_NEEDED_FOR_VICTORY hängt :)
		if ((RUSSIAN_POINTS % _tenPercentOfPointsNeededForVictory) == 0) then { // alle 10% die Warnung
			_string = "Die Russen haben schon " + (str (round((RUSSIAN_POINTS / POINTS_NEEDED_FOR_VICTORY) * 100))) + " Prozent gesendet.";
			 [[[_string,"blufor"],"helpers\hint.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
		};

		if (!alive funkwagen) exitWith {
			[] call bluforCaptured;
		};

		[getPos funkwagen select 0, getPos funkwagen select 1] call setRussianMarkerPosition;

		sleep 1;
	};
};

