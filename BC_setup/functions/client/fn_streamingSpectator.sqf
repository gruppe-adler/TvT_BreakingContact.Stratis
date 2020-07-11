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
        [false] call BC_setup_fnc_spectatorDraw3D;
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