[{
    params ["_args", "_handle"];

    if (MISSION_COMPLETED) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    _playerPositions = call GRAD_civs_fnc_getPlayerPositions;

    // panic cooldown for all units
    {
    	_panic = _x getVariable ["GRAD_civs_brainPanic", 0];

    	if (_panic > 0) then {
    		_x setVariable ["GRAD_civs_brainPanic", _panic - 0.05];
    	};

        _stopOrder = _x getVariable ["GRAD_civs_brainStop", 0];

        if (_stopOrder > 0) then {
            _x setVariable ["GRAD_civs_brainStop", _stopOrder - 0.05];
        } else {
            if (count (_x getVariable ["GRAD_civs_isPointedAtBy",[]]) == 0) then {

                if (GRAD_CIV_DEBUG) then {
                    _x setVariable ["GRAD_civs_currentlyThinking", "i can goooo", true];
                };

                if (_x getVariable ["GRAD_civs_stopScriptRunning", false]) then {
                    [_x] call GRAD_civs_fnc_stopCivAbort;
                };

                _x doFollow _x;
            };
        };

	} forEach (allunits - playableUnits - switchableUnits);

    /*
    if (GRAD_CIV_ONFOOT_COUNT < GRAD_CIV_MAX_COUNT) then {
    	[_playerPositions] call GRAD_civs_fnc_addNewCivilian;
    };
    */


},10,[]] call CBA_fnc_addPerFrameHandler;