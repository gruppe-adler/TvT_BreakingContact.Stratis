waitUntil {!isNil "funkwagen"};


bluforCaptured = {
	BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";
};

bluforSurrendered = {
	BLUFOR_SURRENDERED = true; publicVariable "BLUFOR_SURRENDERED";
	publicVariable "RUSSIAN_POINTS";
};


radioTruckIsSending = {
	(funkwagen getVariable ["tf_range",0]) == 50000)
};

radioBoxIsSending = {
	(RADIO_BOX_ACTIVE)
};

// get multiplier for distance penalty radio box to truck
distanceToRadioNerf = {
	_mod = 1;
	if ((RADIO_BOX_DISTANCE > 50) && (RADIO_BOX_DISTANCE < 500)) then {
		_substractor = RADIO_BOX_DISTANCE/1000;
		// round value
		_substractor = _substractor * 100;
		_substractor = floor (_substractor);
		_substractor = _substractor / 100;

		_mod = _mod - _substractor;
	};
	if (RADIO_BOX_DISTANCE >= 500) then {
		_mod = 0.5;
	};
	_mod
};


booleanEqual = {
	_a = _this select 0;
	_b = _this select 1;

	(_a && _b) || (!_a && !_b)
};


// radio truck functions
setRadioTruckMarkerStatus = {
	_previous = RADIO_TRUCK_MARKER_HIDDEN;
	RADIO_TRUCK_MARKER_HIDDEN = _this;
	if (MISSION_COMPLETED) then {RADIO_TRUCK_MARKER_HIDDEN = true;};
	if (!alive funkwagen) then {RADIO_TRUCK_MARKER_HIDDEN = true;};
	if (!([RADIO_TRUCK_MARKER_HIDDEN, _previous] call booleanEqual)) then {
		 publicVariable "RADIO_TRUCK_MARKER_HIDDEN";
	};
};

setRadioTruckMarkerPosition = {
	_prev = RADIO_TRUCK_MARKER_POS;
	RADIO_TRUCK_MARKER_POS = _this;
	if ((_prev select 0 != RADIO_TRUCK_MARKER_POS select 0) ||
		 (_prev select 1 != RADIO_TRUCK_MARKER_POS select 1)) then {
		 publicVariable "RADIO_TRUCK_MARKER_POS";
	};
};


// radio box functions
setRadioBoxMarkerStatus = {
	_previous = RADIO_BOX_MARKER_HIDDEN;
	RADIO_BOX_MARKER_HIDDEN = _this;
	if (MISSION_COMPLETED) then {RADIO_BOX_MARKER_HIDDEN = true;};
	if (!isNil "portableRadioBox" && {!alive portableRadioBox}) then {RADIO_BOX_MARKER_HIDDEN = true;};
	if (!([RADIO_BOX_MARKER_HIDDEN, _previous] call booleanEqual)) then {
		publicVariable "RADIO_BOX_MARKER_HIDDEN";
	};
};

setRadioBoxMarkerPosition = {
	_prev = RADIO_BOX_MARKER_POS;
	RADIO_BOX_MARKER_POS = _this;
	if ((_prev select 0 != RADIO_BOX_MARKER_POS select 0) ||
		 (_prev select 1 != RADIO_BOX_MARKER_POS select 1)) then {
		 publicVariable "RADIO_BOX_MARKER_POS";
	};
};



[] spawn {
	while {RUSSIAN_POINTS <= POINTS_NEEDED_FOR_VICTORY} do  {
		publicVariable "RUSSIAN_POINTS";
		sleep 5;
	};
};

sleep 2; // give it time, boy - possible fix for "Undefined variable in expression: radioTruckIsSending"

[] spawn {
	while {true} do { // could be optimized and synced to real time - b/c as it is, there WILL be delays
		_radioTruckIsSending = call radioTruckIsSending;
		_radioBoxIsSending = call radioBoxIsSending;
		_bothAreSending = (_radioBoxIsSending && _radioTruckIsSending);

		if (_radioTruckIsSending && !_bothAreSending) then {
			RUSSIAN_POINTS = RUSSIAN_POINTS + 1;
			diag_log format ["debug: radio truck is sending alone"];
		};

		if (!_radioTruckIsSending && _radioBoxIsSending) then {
			RUSSIAN_POINTS = RUSSIAN_POINTS + 0.5;
			diag_log format ["debug: radio box is sending alone"];
		};

		if (_radioTruckIsSending && _bothAreSending) then {
			_tempModifier = _modifier;
			_modifier = call distanceToRadioNerf;
			// check if distance changed, if yes, broadcast for client hint
			if (_modifier != _tempModifier) then {
				RADIO_BOX_DISTANCE = _modifier * 100;
				publicVariable "RADIO_BOX_DISTANCE";
			};
			RUSSIAN_POINTS = RUSSIAN_POINTS + (1 * _modifier);
			diag_log format ["debug: radio box is sending alone"];
		};



		!_radioTruckIsSending call setRadioTruckMarkerStatus;
		!_radioBoxIsSending call setRadioBoxMarkerStatus;

		if (RUSSIAN_POINTS >= POINTS_NEEDED_FOR_VICTORY) exitWith {
			[] call bluforSurrendered;
		};

		if (!alive funkwagen && {(funkwagen getVariable ["detachableRadio", 0] != 2)}) exitWith {
			[] call bluforCaptured;
		};

		if (!alive funkwagen && {(funkwagen getVariable ["detachableRadio", 0] == 2)} && {!alive portableRadioBox}) exitWith {
			[] call bluforCaptured;
		};

		if (!RADIO_BOX_ACTIVE) then {
			[getPos funkwagen select 0, getPos funkwagen select 1] call setRadioTruckMarkerPosition;
			// diag_log format ["logging funkwagen: %1", funkwagen];
		} else {
			[getPos funkwagen select 0, getPos funkwagen select 1] call setRadioTruckMarkerPosition;
			[getPos portableRadioBox select 0, getPos portableRadioBox select 1] call setRadioBoxMarkerPosition;
			// diag_log format ["logging portableRadioBox: %1", portableRadioBox];
		};
		sleep 1;
	};
};
