waitUntil {!isNil "funkwagen"};

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
	while {true} do { // could be optimized and synced to real time - b/c as it is, there WILL be delays
		_isSending = call funkwagenIsSending;
		if (_isSending) then {
			RUSSIAN_POINTS = RUSSIAN_POINTS + 1;
		};
		!_isSending call setRussianMarkerStatus;

		if (RUSSIAN_POINTS > POINTS_NEEDED_FOR_VICTORY) exitWith {
			[] call bluforSurrendered;
		};

		if (!alive funkwagen) exitWith {
			[] call bluforCaptured;
		};

		[getPos funkwagen select 0, getPos funkwagen select 1] call setRussianMarkerPosition;

		sleep 1;
	};
};

