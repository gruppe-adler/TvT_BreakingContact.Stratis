params ["_radioVeh", "_terminal", "_endCondition"];

private ["_result"]; 

_result = [1,0];

grad_tracking_currentLoop = 0;

GRAD_tracking_mainLoop = [{

    params ["_args", "_handle"];
    _args params ["_radioVeh", "_terminal", "_endCondition", "_result"];

    private ["_vehicleEnterChange"];

    _vehicleEnterChange = false;
    _vehicleEnterChangeTemp = false;

    // stop loop if necessary
    if (_endCondition) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

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
    if (_radioVehIsSending && !_bothAreSending && !GRAD_TERMINAL) then {
        GRAD_TICKS_DONE = GRAD_TICKS_DONE + 1;
    };

    // add only terminal is sending, add half a tick
    if (!_radioVehIsSending && _terminalIsSending) then {
        GRAD_TICKS_DONE = GRAD_TICKS_DONE + 0.5;
    };

    // if truck and terminal are sending, add terminal to truck distance dependent tick
    if (_bothAreSending) then {
        _tempModifier = _result select 0;
        _tempDistance = _result select 1;

        _result = [_radioVeh distance _terminal] call GRAD_tracking_fnc_terminalDistanceToVehCalc;
        _modifier = _result select 0;
        _distanceToRadioTruck = _result select 1;

        // check if distance changed, if yes, broadcast for client hint
        if ((_distanceToRadioTruck != _tempDistance) || (_modifier != _tempModifier)) then {
            GRAD_TERMINAL_DISTANCE = _modifier * 100;
            publicVariable "GRAD_TERMINAL_DISTANCE";
        };

        GRAD_TICKS_DONE = GRAD_TICKS_DONE + (1 * _modifier);
    };

    // toggle marker visbility
    _radioVehMarkerStatusChange = [!_radioVehIsSending, _radioVeh] call GRAD_tracking_fnc_setRadioVehMarkerStatus;
    _terminalMarkerStatusChange = [!_terminalIsSending, _terminal] call GRAD_tracking_fnc_setTerminalMarkerStatus;

    if (GRAD_TICKS_DONE >= GRAD_TICKS_NEEDED && (time > 10)) then {
        GRAD_INTERVALS_DONE = GRAD_INTERVALS_DONE + 1;
        publicVariable "GRAD_INTERVALS_DONE";
        GRAD_TICKS_DONE = 0;
        publicVariable "GRAD_TICKS_DONE";
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