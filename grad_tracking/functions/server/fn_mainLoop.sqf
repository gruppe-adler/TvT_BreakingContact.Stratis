params ["_radioVeh", "_terminal", "_endCondition"];

private ["_result"]; 

_result = [1,0];

grad_tracking_currentLoop = 0;



GRAD_tracking_mainLoop = [{

    params ["_args", "_handle"];
    _args params ["_radioVeh", "_terminal", "_endCondition", "_result"];

    private [
        "_activeItem",
        "_isCloseEnough",
        "_currentLocation", 
        "_currentLocationName", 
        "_locationsCreated", 
        "_finishedCloserThanUnfinished"
    ];

    _isCloseEnough = false;
    _allLocations = missionNamespace getVariable ["GRAD_tracking_radioPositions", []];
    _locationsCreated = (count _allLocations) > 0;
    _finishedCloserThanUnfinished = false;
    _currentLocation = [];

     // who the fuck is sending a signal currently
    _radioVehIsSending = [_radioVeh] call GRAD_tracking_fnc_radioVehIsSending;    
    _terminalIsSending = [] call GRAD_tracking_fnc_terminalIsSending;

    if (_terminalIsSending) then {
        _activeItem = _terminal;
    } else {
        _activeItem = _radioVeh;
    };
    _finishedCloserThanUnfinished = [_activeItem] call GRAD_tracking_fnc_nearestIsFinished;

    

    // diag_log format ["_finishedCloserThanUnfinished is %1", _finishedCloserThanUnfinished];
   
    // nearestPosition wont work well with empty input
   

    if (!_finishedCloserThanUnfinished && _locationsCreated) then {
        _currentLocation =  [_allLocations, getPos _activeItem] call BIS_fnc_nearestPosition;
        
        if (_radioVehIsSending || _terminalIsSending) then {
            _isCloseEnough = _activeItem distance _currentLocation <= GRAD_MIN_DISTANCE_TO_RADIOPOSITION/2;
        };
    };

    if (_radioVehIsSending || _terminalIsSending && !_finishedCloserThanUnfinished) then {
        if (_currentLocation distance _activeItem > GRAD_MIN_DISTANCE_TO_RADIOPOSITION || !_locationsCreated) then {
            _currentLocation = [getPos _activeItem] call GRAD_tracking_fnc_createRadioPositionMarker;
        };
    };

    _currentLocationName = str _currentLocation;
    _currentActiveMarkerProgress = missionNameSpace getVariable [_currentLocationName, 0];
    GRAD_TICKS_DONE = _currentActiveMarkerProgress;
    // diag_log format ["currentLocationName is %1, _locationsCreated is %2", _currentLocation, _locationsCreated];
    
 

    /* diag_log format ["_radioVehIsCloseEnough is %1, _terminalIsCloseEnough is %2", _radioVehIsCloseEnough, _terminalIsCloseEnough];*/

    // make everything red which isnt in use
    _allOtherLocations = _allLocations;

    if (_isCloseEnough) then {
        _allOtherLocations = _allOtherLocations - [_currentLocation];

        if (count _allOtherLocations > 0) then {
            {
                [
                        str _x, 
                        "ColorOpfor", 
                        ""
                ] remoteExec ["GRAD_tracking_fnc_setMarkerColorAndText", east, false];
            } forEach _allOtherLocations;
        };
    };

    


    // _terminalPos = getPos _terminal;

    ///////////////////////////////

    

    // stop loop if necessary
    if (call _endCondition) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler;

        [true, _radioVeh] call GRAD_tracking_fnc_setRadioVehMarkerStatus;
        [true, _terminal] call GRAD_tracking_fnc_setTerminalMarkerStatus;
    };

    // if all ticks and intervals are reached, end mission
    if (GRAD_INTERVALS_DONE >= GRAD_INTERVALS_NEEDED) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;   // remove PFH

        [true, _radioVeh] call GRAD_tracking_fnc_setRadioVehMarkerStatus;
        [true, _terminal] call GRAD_tracking_fnc_setTerminalMarkerStatus;
        
        [] call GRAD_tracking_fnc_bluforSurrendered;
    };

    // if vehicles are destroyed, end mission
    if (!alive _radioVeh && {(_radioVeh getVariable ["detachableRadio", 0] != 2)} && {!CONQUER_MODE}) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        
        [] call GRAD_tracking_fnc_bluforCaptured;    // call Mission End
        [true, _radioVeh] call GRAD_tracking_fnc_setRadioVehMarkerStatus;
        [true, _terminal] call GRAD_tracking_fnc_setTerminalMarkerStatus;      
    };

    if (!alive _radioVeh && {(_radioVeh getVariable ["detachableRadio", 0] != 2)} && {CONQUER_MODE}) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        
        TRUCK_DESTROYED_NOT_CONQUERED = true;    // call Mission End
        publicVariable "TRUCK_DESTROYED_NOT_CONQUERED";
    };

    // check if cookoff needs fixing
    [_radioVeh] call GRAD_tracking_fnc_radioTruckCookoffFix;

   

    // check if radio truck is sending alone with terminal detached (he cant do that anymore)
    // GRAD_TERMINAL_ACTIVE
    if (GRAD_TERMINAL && !_terminalIsSending && _radioVehIsSending) then {
        _radioVehIsSending = false;
    };

    _bothAreSending = (_terminalIsSending && _radioVehIsSending);

    // add one tick  if only vehicle is sending
    if (_radioVehIsSending && !_bothAreSending && !GRAD_TERMINAL && !_finishedCloserThanUnfinished && _isCloseEnough) then {
           // diag_log ["entering onetick snippet radioveh"];

            GRAD_TICKS_DONE = GRAD_TICKS_DONE + 1;

            missionNameSpace setVariable [_currentLocationName, GRAD_TICKS_DONE, true];

            _ticksRatio = GRAD_TICKS_DONE/GRAD_TICKS_NEEDED;
        
            [
                _currentLocationName, 
                "ColorYellow", 
                (" " + (str (round(_ticksRatio * 100))) + " %")
            ] remoteExec ["GRAD_tracking_fnc_setMarkerColorAndText", east, false];
    };  
    

    // add only terminal is sending, add half a tick
    if (!_radioVehIsSending && _terminalIsSending && !_finishedCloserThanUnfinished && _isCloseEnough) then {
        // diag_log ["entering halftick snippet"];

        GRAD_TICKS_DONE = GRAD_TICKS_DONE + 0.5;

        missionNameSpace setVariable [_currentLocationName, GRAD_TICKS_DONE, true];

        _ticksRatio = GRAD_TICKS_DONE/GRAD_TICKS_NEEDED;

        [
            _currentLocationName, 
            "ColorYellow", 
            (" " + (str (round(_ticksRatio * 100))) + " %")
        ] remoteExec ["GRAD_tracking_fnc_setMarkerColorAndText", east, false];  
    };

    // if truck and terminal are sending, add terminal to truck distance dependent tick
    if (_bothAreSending && !_finishedCloserThanUnfinished && _isCloseEnough) then {
        // diag_log ["entering onetick snippet both"];
        _tempModifier = _result select 0;
        _tempDistance = _result select 1;

        _result = [_radioVeh distance _terminal] call GRAD_tracking_fnc_terminalDistanceToVehCalc;
        _modifier = _result select 0;
        _distanceToRadioTruck = _result select 1;
        
        // check if distance changed, if yes, broadcast for client hint
         [_modifier, _tempModifier, _tempDistance, _result] call GRAD_tracking_fnc_terminalCalculateDistanceModifier;
     
        GRAD_TICKS_DONE = GRAD_TICKS_DONE + (1 * _modifier);

        missionNameSpace setVariable [_currentLocationName, GRAD_TICKS_DONE, true];

        _ticksRatio = GRAD_TICKS_DONE/GRAD_TICKS_NEEDED;

   
        [
            _currentLocationName, 
            "ColorYellow", 
            (" " + (str (round(_ticksRatio * 100))) + " %")
        ] remoteExec ["GRAD_tracking_fnc_setMarkerColorAndText", east, false];
         
    };

    // toggle marker visbility
    _radioVehMarkerStatusChange = [!_radioVehIsSending, _radioVeh] call GRAD_tracking_fnc_setRadioVehMarkerStatus;
    _terminalMarkerStatusChange = [!_terminalIsSending, _terminal] call GRAD_tracking_fnc_setTerminalMarkerStatus;

    if (GRAD_TICKS_DONE >= GRAD_TICKS_NEEDED && (time > 10) && !_finishedCloserThanUnfinished) then {
            
        _finishedRadioLocations = missionNamespace getVariable ["GRAD_tracking_radioPositionsFinished", []];
        _finishedRadioLocations = _finishedRadioLocations + [_currentLocation];
        missionNamespace setVariable ["GRAD_tracking_radioPositionsFinished", _finishedRadioLocations, true];

        _allOtherLocations = _allLocations - [_currentLocation];
        missionNamespace setVariable ["GRAD_tracking_radioPositions", _allOtherLocations, true];

        GRAD_INTERVALS_DONE = GRAD_INTERVALS_DONE + 1;
        publicVariable "GRAD_INTERVALS_DONE";

        if (_locationsCreated) then {
            [
                _currentLocationName, 
                "ColorGreen",
                " DONE"
            ] remoteExec ["GRAD_tracking_fnc_setMarkerColorAndText", east, true];        
        };

        GRAD_TICKS_DONE = 0;
        publicVariable "GRAD_TICKS_DONE";
    };

    if (_terminalIsSending || _radioVehIsSending) then {

             if  (grad_tracking_currentLoop < GRAD_SIGNAL_DELAY && 
            (!_radioVehMarkerStatusChange || !_terminalMarkerStatusChange)) then {

            grad_tracking_currentLoop = grad_tracking_currentLoop + 1;

         } else {

             grad_tracking_currentLoop = 0; // reset delay for position update

             _radioVehX = getPos _radioVeh select 0;
             _radioVehY = getPos _radioVeh select 1;
             _markerPos = [_radioVehX, _radioVehY];

             if (!GRAD_TERMINAL_ACTIVE) then {
                 _markerPos call GRAD_tracking_fnc_setRadioVehMarkerPosition;
             } else {
                 _markerPos call GRAD_tracking_fnc_setRadioVehMarkerPosition;
                 [getPos _terminal select 0, getPos _terminal select 1] call GRAD_tracking_fnc_setTerminalMarkerPosition;
             };
         };
    };

},1,[_radioVeh, _terminal, _endCondition, _result]] call CBA_fnc_addPerFrameHandler;


GRAD_tracking_syncLoop = [{
    params ["_args", "_handle"];

    "mrk_spawn_blufor_land_1" setMarkerPos BLUFOR_TELEPORT_TARGET;
    "mrk_spawn_opfor_land_1" setMarkerPos OPFOR_TELEPORT_TARGET;
    publicVariable "GRAD_TICKS_DONE";

},5,[]] call CBA_fnc_addPerFrameHandler;
