params ["_canHearSpectators"];

// as we dont have any events we force spectator false here in a cheap local loop
[{
    params ["_args", "_handle"];
    _args params ["_canHearSpectators"];

    if (!_canHearSpectators) then {
        player setVariable ["TFAR_forceSpectator", false];
    };

    if (!visibleMap) then {

        private _truck = missionNamespace getVariable ["GRAD_tracking_radioVehObj", objNull]; 
        private _terminal = missionNamespace getVariable ["GRAD_tracking_terminalObj", objNull]; 
        private _colorTruck = [1,1,1,1];
        private _colorTerminal = [1,1,1,1];

        if ([_truck] call GRAD_tracking_fnc_radioVehIsSending) then {
            _colorTruck = [1,0.2,0.2,1];
        };

        if (call GRAD_tracking_fnc_terminalIsSending) then {
            _colorTerminal = [0.2,0.2,1,1];
        };

        private _ticksRatio = GRAD_TICKS_DONE / GRAD_TICKS_NEEDED;
        private _string_2 = " | Done: " + str GRAD_INTERVALS_DONE + "/" + str GRAD_INTERVALS_NEEDED;
        private _string = " " + (str (round(_ticksRatio * 100))) + " " + localize "str_GRAD_transmissionTime_2" + _string_2;


         
        drawIcon3D [getText (configFile >> "CfgVehicles" >> (typeOf _truck) >> "icon"), _colorTruck, getPos _truck, 1, 1, 0, _string, 2, 0.03, "RobotoCondensed"];

        if (GRAD_TERMINAL) then {
            private _strength = (str GRAD_TERMINAL_DISTANCE + " % strength");
            drawIcon3D [getText (configFile >> "CfgVehicles" >> (typeOf _terminal) >> "icon"), _colorTerminal, [0,0,0], 1, 1, 0, _strength, 2, 0.03, "RobotoCondensed"];
        };
    };
}, 0, [_canHearSpectators]] call CBA_fnc_addPerFrameHandler;