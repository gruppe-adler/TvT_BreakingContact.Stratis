if (hasInterface) then {
    if ((typeOf player) == "VirtualSpectator_F") then {
        player setVariable ["tf_forcedCurator", false, true];
        player setVariable ["TFAR_forceSpectator", false, true];
        player setVariable ["tf_voiceVolume", 0, true];
        player setVariable ["tf_voiceVolume", 0, true];
        player setVariable ["tf_unable_to_use_radio", true];

        diag_log format ["streaming spectator: disabling tfar spectator channel for %1", player];

        [ "Initialize",
            [player,  [west, east, independent, civilian],true,true,true,true,false,false,true,true] 
        ] call BIS_fnc_EGSpectator;

        [] spawn {
            waitUntil {(OPFOR_TELEPORT_TARGET select 0 != 0)};
            private _truck = missionNameSpace getVariable ["GRAD_tracking_radioVehObj", objNull];
            private _position = getPos _truck;
            private _camPos = _truck getRelPos [180,50];
            _camPos set [2,50];
            private _camera = ["GetCamera"] call BIS_fnc_EGSpectator; 
            _camera setPos _camPos;
            _camera camSetTarget _truck;
            _camera camCommit 2;
        };
        // as we dont have any events we force spectator false here in a cheap local loop
        [{
            player setVariable ["TFAR_forceSpectator", false];
        }, 0, []] call CBA_fnc_addPerFrameHandler;
    };
};