if (hasInterface) then {
    if ((typeOf player) == "VirtualSpectator_F" ||
        (typeOf player ) == "VirtualCurator_F") then {
        player setVariable ["tf_forcedCurator", false, true];
        player setVariable ["TFAR_forceSpectator", false, true];
        player setVariable ["tf_voiceVolume", 0, true];
        player setVariable ["tf_voiceVolume", 0, true];
        player setVariable ["tf_unable_to_use_radio", true];


        diag_log format ["streaming spectator: disabling tfar spectator channel for %1", player];

        if ((typeOf player) == "VirtualSpectator_F") then {
            [ "Initialize",
                [player,  [west, east, independent, civilian],true,true,true,true,false,false,true,true] 
            ] call BIS_fnc_EGSpectator;
        };

        [] spawn {
            waitUntil {!isNull (missionNameSpace getVariable ["GRAD_tracking_radioVehObj", objNull])};
            private _truck = missionNameSpace getVariable ["GRAD_tracking_radioVehObj", objNull];
            private _position = getPos _truck;
            private _camPos = _truck getPos [50,0];
            _camPos set [2,30];
            private _camera = ["GetCamera"] call BIS_fnc_EGSpectator; 
            _camera setPos _camPos;
            _camera camSetTarget _truck;
            _camera camCommit 0;
        };

        // as we dont have any events we force spectator false here in a cheap local loop
        [{
            player setVariable ["TFAR_forceSpectator", false];

            if (["HasCustomIcon",["truckIcon"]] call BIS_fnc_EGSpectator) then {
                ["RemoveCustomIcon",["truckIcon"]] call BIS_fnc_EGSpectator;
            };

            if (["HasCustomIcon",["terminalIcon"]] call BIS_fnc_EGSpectator) then {
                ["RemoveCustomIcon",["terminalIcon"]] call BIS_fnc_EGSpectator;
            };

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


            [ 
                "AddCustomIcon",  
                [ 
                    "truckIcon",  
                    _truck,  
                    [getText (configFile >> "CfgVehicles" >> (typeOf _truck) >> "icon"), _colorTruck, getPos _truck, 1, 1, 0, _string, 2, 0.03, "RobotoCondensed"],  
                    [false, [1,1,1,0.5]],  
                    {true} 
                ] 
            ] call BIS_fnc_EGSpectator;

            if (!isNull _terminal) then {
                private _strength = (str GRAD_TERMINAL_DISTANCE + " % strength");
                [ 
                    "AddCustomIcon",  
                    [ 
                        "terminalIcon",  
                        _terminal,  
                        [getText (configFile >> "CfgVehicles" >> (typeOf _terminal) >> "icon"), _colorTerminal, [0,0,0], 1, 1, 0, _strength, 2, 0.03, "RobotoCondensed"],  
                        [false, [1,1,1,0.5]],  
                        {true} 
                    ] 
                ] call BIS_fnc_EGSpectator;
            };

        }, 1, []] call CBA_fnc_addPerFrameHandler;
    };
};

/*
private _truck = missionNamespace getVariable ["GRAD_tracking_radioVehObj", objNull];
        [
            "AddCustomIcon", 
            [
                "truckIcon2", 
                _truck, 
                ["\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa", [1,1,1,1], [0,0,0], 4.0, -0.7, 0, "", 2, 0.035, "PuristaLight", "center"], 
                [false, [1,1,1,0.5]], 
                {true}
            ]
        ] call BIS_fnc_EGSpectator;
*/