params ["_heli"];

diag_log format ["starting fuelDrain for %1", _heli];

[{
    params ["_args", "_handle"];
    _args params ["_heli"];

    if (!alive _heli) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    if (!local _heli) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        [_heli] remoteExec ["BC_setup_fnc_fuelDrain", _heli];
    };

    private _fuel = fuel _heli;
    if (_fuel > 0 && isEngineOn _heli) then {
        _heli setFuel (_fuel -0.001);
    };

},1,[_heli]] call CBA_fnc_addPerFrameHandler;