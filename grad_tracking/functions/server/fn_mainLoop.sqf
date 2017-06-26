params ["_radioVeh", "_terminal", "_endCondition"];

private ["_result"]; 

_result = [1,0];

grad_tracking_currentLoop = 0;

/* waitUntil { (count (missionNamespace getVariable ["GRAD_tracking_radioPositions", []])) > 0 }; */

GRAD_tracking_mainLoop = [{

    params ["_args", "_handle"];
    _args params ["_radioVeh", "_terminal", "_endCondition", "_result"];

    private ["_vehicleEnterChange", "_currentLocation", "_currentLocationName"];

    _vehicleEnterChange = false;
    _vehicleEnterChangeTemp = false;
    _isCloseEnough = false;
    _terminalIsCloseEnough = false;
    _locationsAvailable = false;

    _localRadioLocations = missionNamespace getVariable ["GRAD_tracking_radioPositions", []];
    
    // nearestPosition wont work well with empty input
    if (count _localRadioLocations > 0) then {
        _locationsAvailable = true;

        _currentLocation = [_localRadioLocations, _radioVeh] call BIS_fnc_nearestPosition;
        /* diag_log format ["currentLocation is %1, _localRadioLocations are %2", text _currentLocation, _localRadioLocations];*/

        _currentLocationName = text _currentLocation;
    
        _currentActiveMarkerProgress = missionNameSpace getVariable [_currentLocationName, 0];

        /* diag_log format ["_currentActiveMarkerProgress is %1 / %2", _currentActiveMarkerProgress, _currentLocationName]; */

        GRAD_TICKS_DONE = _currentActiveMarkerProgress;
    };


    // check if no location is left over
    if (_locationsAvailable) then {
        if ((getPos _currentLocation) distance _radioVeh < GRAD_MIN_DISTANCE_TO_RADIOPOSITION) then {
            _isCloseEnough = true;
        };

        if (GRAD_TERMINAL_ACTIVE) then {
            if ((getPos _currentLocation) distance _terminal < GRAD_MIN_DISTANCE_TO_RADIOPOSITION) then {
                _terminalIsCloseEnough = true;
            };
        };
    };

    diag_log format ["_isCloseEnough is %1, _terminalIsCloseEnough is %2", _isCloseEnough, _terminalIsCloseEnough];

    // make everything red which isnt in use
    _allOtherLocations = _localRadioLocations;

    if (_isCloseEnough || _terminalIsCloseEnough) then {
        _allOtherLocations = _localRadioLocations - [_currentLocation];
    };

    if (count _allOtherLocations > 0) then {
        {
            [
                    text _x, 
                    "ColorOpfor", 
                    ""
            ] remoteExec ["GRAD_tracking_fnc_setMarkerColorAndText", east, false];
        } forEach _allOtherLocations;
    };


    // _terminalPos = getPos _terminal;

    ///////////////////////////////

    // stop loop if necessary
    if (call _endCondition) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    // if all ticks and intervals are reached, end mission
    if (GRAD_INTERVALS_DONE >= GRAD_INTERVALS_NEEDED) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;   // remove PFH
        
        if (!TRACKING_PERSON) then {
            [] call GRAD_tracking_fnc_bluforSurrendered;
        } else {
            [] call GRAD_tracking_fnc_bluforCaptured;    // call Mission End
        };
    };

    // if vehicles are destroyed, end mission
    if (!alive _radioVeh && {(_radioVeh getVariable ["detachableRadio", 0] != 2)} && {!CONQUER_MODE}) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;

        if (!TRACKING_PERSON) then {
            [] call GRAD_tracking_fnc_bluforCaptured;    // call Mission End
        } else {
            [] call GRAD_tracking_fnc_bluforSurrendered;
        };
        
    };

    if (!alive _radioVeh && {(_radioVeh getVariable ["detachableRadio", 0] != 2)} && {CONQUER_MODE}) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        
        if (!TRACKING_PERSON) then {
            TRUCK_DESTROYED_NOT_CONQUERED = true;    // call Mission End
            publicVariable "TRUCK_DESTROYED_NOT_CONQUERED";
        } else {
            [] call GRAD_tracking_fnc_bluforSurrendered;
        };
    };

    // check if cookoff needs fixing
    [_radioVeh] call GRAD_tracking_fnc_radioTruckCookoffFix;

    // who the fuck is sending a signal currently
    _radioVehIsSending = [_radioVeh] call GRAD_tracking_fnc_radioVehIsSending;    
    _terminalIsSending = [_terminal] call GRAD_tracking_fnc_terminalIsSending;

    // check if radio truck is sending alone with terminal detached (he cant do that anymore)
    // GRAD_TERMINAL_ACTIVE
    if (GRAD_TERMINAL && !_terminalIsSending && _radioVehIsSending) then {
        _radioVehIsSending = false;
    };

    _bothAreSending = (_terminalIsSending && _radioVehIsSending);

    // add one tick  if only vehicle is sending
    if (_radioVehIsSending && !_bothAreSending && !GRAD_TERMINAL && _isCloseEnough) then {
        GRAD_TICKS_DONE = GRAD_TICKS_DONE + 1;

        missionNameSpace setVariable [_currentLocationName, GRAD_TICKS_DONE];

        _ticksRatio = GRAD_TICKS_DONE/GRAD_TICKS_NEEDED;

        if (_locationsAvailable) then {
            [
                _currentLocationName, 
                "ColorYellow", 
                (" " + (str (round(_ticksRatio * 100))) + " %")
            ] remoteExec ["GRAD_tracking_fnc_setMarkerColorAndText", east, false];
        };
        
    };

    // add only terminal is sending, add half a tick
    if (!_radioVehIsSending && _terminalIsSending && _terminalIsCloseEnough) then {
        GRAD_TICKS_DONE = GRAD_TICKS_DONE + 0.5;
        missionNameSpace setVariable [_currentLocationName, GRAD_TICKS_DONE];

        _ticksRatio = GRAD_TICKS_DONE/GRAD_TICKS_NEEDED;
        
        if (_locationsAvailable) then {
            [
                _currentLocationName, 
                "ColorYellow", 
                (" " + (str (round(_ticksRatio * 100))) + " %")
            ] remoteExec ["GRAD_tracking_fnc_setMarkerColorAndText", east, false];
        };
    };

    // if truck and terminal are sending, add terminal to truck distance dependent tick
    if (_bothAreSending && _terminalIsCloseEnough) then {
        _tempModifier = _result select 0;
        _tempDistance = _result select 1;

        _result = [_radioVeh distance _terminal] call GRAD_tracking_fnc_terminalDistanceToVehCalc;
        _modifier = _result select 0;
        _distanceToRadioTruck = _result select 1;

        // check if distance changed, if yes, broadcast for client hint
	    [_modifier, _tempModifier, _tempDistance, _result] call GRAD_tracking_fnc_terminalCalculateDistanceModifier;
	
        GRAD_TICKS_DONE = GRAD_TICKS_DONE + (1 * _modifier);

        missionNameSpace setVariable [_currentLocationName, GRAD_TICKS_DONE];

        _ticksRatio = GRAD_TICKS_DONE/GRAD_TICKS_NEEDED;

        if (_locationsAvailable) then {
            [
                _currentLocationName, 
                "ColorYellow", 
                (" " + (str (round(_ticksRatio * 100))) + " %")
            ] remoteExec ["GRAD_tracking_fnc_setMarkerColorAndText", east, false];
        };
    };

    // toggle marker visbility
    _radioVehMarkerStatusChange = [!_radioVehIsSending, _radioVeh] call GRAD_tracking_fnc_setRadioVehMarkerStatus;
    _terminalMarkerStatusChange = [!_terminalIsSending, _terminal] call GRAD_tracking_fnc_setTerminalMarkerStatus;

    if (GRAD_TICKS_DONE >= GRAD_TICKS_NEEDED && (time > 10)) then {
        GRAD_INTERVALS_DONE = GRAD_INTERVALS_DONE + 1;
        publicVariable "GRAD_INTERVALS_DONE";

        if (_locationsAvailable) then {
            [
                _currentLocationName, 
                "ColorGreen", 
                " DONE"
            ] remoteExec ["GRAD_tracking_fnc_setMarkerColorAndText", east, false];

        _localRadioLocations = _localRadioLocations - [_currentLocation];
        missionNamespace setVariable ["GRAD_tracking_radioPositions", _localRadioLocations, true];
        
        };

        GRAD_TICKS_DONE = 0;
        publicVariable "GRAD_TICKS_DONE";
        if (TRACKING_PERSON) then {
            _randomSpawnPos = [position blufor_teamlead, [1000,3000], random 360, 0, [1,100]] call SHK_POS;
            [
            _randomSpawnPos, 
            150, 
            "rhsusf_launcher_crate", 
            {
                (_this select 0) addWeaponCargoGlobal ['rhs_weap_fim92',1]; 
                (_this select 0) addMagazineCargoGlobal ['rhs_fim92_mag',1];    
            },
            west] spawn grad_supplydrops_fnc_createCarrier;
        };
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

	       if (TRACKING_PERSON) then {
	            _radioVehX = getPos (vehicle _radioVeh) select 0;
	            _radioVehY = getPos (vehicle _radioVeh) select 1;
	            _markerPos = [_radioVehX, _radioVehY];

                [str vehicle _radioVeh != str _radioVeh] call GRAD_tracking_fnc_setRadioVehMarkerSize;

	            _markerPos = [[_radioVehX, _radioVehY], GRAD_SIGNAL_SIZE] call GRAD_tracking_fnc_randomizeMarker;
                [] remoteExec ["grad_tracking_fnc_showMarkerUpdateHint", 0, false];

	            GRAD_SIGNAL_DELAY = GRAD_SIGNAL_DELAY + (random GRAD_SIGNAL_DELAY_RANDOM);
	       };

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

    "mrk_spawn_blufor_land_1" setMarkerPos (call US_VEHICLE_SPAWN);
    "mrk_spawn_opfor_land_1" setMarkerPos (call RUS_VEHICLE_SPAWN);
    publicVariable "GRAD_TICKS_DONE";

},5,[]] call CBA_fnc_addPerFrameHandler;
