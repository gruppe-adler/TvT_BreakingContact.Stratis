_target = _this select 0;

if (!isServer) exitWith {};

// CONQUER TIME
_timeout = 30;

// TRIGGER SIZE
_trig_size = 3;



// BLUFOR WINS WHEN TRIGGER FIRED
bluforCaptured = {
	BLUFOR_CAPTURED = TRUE; publicVariable "BLUFOR_CAPTURED";
};

bluforAtBarrel = {
	_targ = _this select 0;
	_pos = getPos _targ;

	//hintSilent format ["%1",_targ];
	_smoke = [[[_targ,"wood","small",{!BLUFOR_AT_BARREL}],"helpers\createSmokeColumn.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
};

// TRACKING
_trigTracking = createTrigger["EmptyDetector",getPos _target];
_trigTracking setTriggerArea[_trig_size,_trig_size,0,false];
_trigTracking setTriggerActivation["ANY","PRESENT",true];
_trigTracking setTriggerTimeout [_timeout,_timeout,_timeout,true];

// CONDITION ON ACT ON DEACT
_trigTracking setTriggerStatements["WEST countSide thislist > 0 && EAST countSide thislist == 0","[] call bluforCaptured", ""];


// TRACKING
_feedbackTrigger = createTrigger["EmptyDetector",getPos _target];
_feedbackTrigger setTriggerArea[_trig_size,_trig_size,0,false];
_feedbackTrigger setTriggerActivation["WEST","PRESENT",true];
_feedbackTrigger setTriggerTimeout [0,0,0,true];

// CONDITION ON ACT ON DEACT
_feedbackTrigger setTriggerStatements["this","BLUFOR_AT_BARREL = TRUE; publicVariable 'BLUFOR_AT_BARREL'; [respawn_helper] call bluforAtBarrel;", "BLUFOR_AT_BARREL = FALSE;publicVariable 'BLUFOR_AT_BARREL';"];

mrk_tracking = createMarker ["trackingMarker",getPos _target];
mrk_tracking setMarkerShape "ICON";
mrk_tracking setMarkerType "n_installation"; // todo: find nice marker type
mrk_tracking setMarkerPos [0,0];
mrk_tracking setMarkerColor "colorOPFOR";



// LOOP TO UPDATE BARREL POSITION
[_target,mrk_tracking,_trigTracking,_feedbackTrigger] spawn {
	_targ = _this select 0;
	_marker = _this select 1;
	_trigger = _this select 2;
	_feedback = _this select 3;
	// if barrel exists
  	while {true} do {
  		
  		_marker setMarkerPos [(getPos _targ select 0),(getPos _targ select 1)];
  		_trigger setPos (getMarkerpos "trackingMarker");
  		_feedback setPos (getMarkerpos "trackingMarker");
		sleep 1;		
		};
};