waitUntil {!isNil "funkwagen"};

bluforCaptured = {
	BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";
};

bluforSurrendered = {
	BLUFOR_SURRENDERED = true; publicVariable "BLUFOR_SURRENDERED";
	publicVariable "RUSSIAN_POINTS";
};

funkwagenIsSending = {
	((funkwagen getVariable ["tf_range",0]) == 50000) || funkwagen getVariable ["detachableRadio", 0] == 2;
};

booleanEqual = {
	_a = _this select 0;
	_b = _this select 1;

	(_a && _b) || (!_a && !_b)
};

setRussianMarkerStatus = {
	_previous = RUSSIAN_MARKER_HIDDEN;
	RUSSIAN_MARKER_HIDDEN = _this;
	if (MISSION_COMPLETED) then {RUSSIAN_MARKER_HIDDEN = true;};
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

[] spawn {
	while {RUSSIAN_POINTS <= POINTS_NEEDED_FOR_VICTORY} do  {
		publicVariable "RUSSIAN_POINTS";
		sleep 5;
	};
};

sleep 2; // give it time, boy - possible fix for "Undefined variable in expression: funkwagenissending"

[] spawn {
	while {true} do { // could be optimized and synced to real time - b/c as it is, there WILL be delays
		_isSending = call funkwagenIsSending;
		if (_isSending) then {
			RUSSIAN_POINTS = RUSSIAN_POINTS + 1;
		};
		!_isSending call setRussianMarkerStatus;

		if (RUSSIAN_POINTS >= POINTS_NEEDED_FOR_VICTORY) exitWith {
			[] call bluforSurrendered;
		};

		if (!alive funkwagen) exitWith {
			[] call bluforCaptured;
		};
		if (funkwagen getVariable ["detachableRadio", 0] == 0 || funkwagen getVariable ["detachableRadio", 0] == 1) then {
			[getPos funkwagen select 0, getPos funkwagen select 1] call setRussianMarkerPosition;
		} else {
			if (!isNil "radioSuitcaseDropped") then {
				[getPos radioSuitcaseDropped select 0, getPos radioSuitcaseDropped select 1] call setRussianMarkerPosition;
			};
			if (!isNil "radioSuitcaseCarry") then {
				[getPos radioSuitcaseCarry select 0, getPos radioSuitcaseCarry select 1] call setRussianMarkerPosition;
			};
		};
		

		sleep 1;
	};
};
