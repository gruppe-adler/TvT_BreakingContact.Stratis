if (hasInterface) then {
    if ((typeOf player) == "VirtualSpectator_F") then {
        player setVariable ["tf_forcedCurator", false, true];
        player setVariable ["TFAR_forceSpectator", false, true];
        player setVariable ["tf_voiceVolume", 0, true];
        player setVariable ["tf_voiceVolume", 0, true];
        player setVariable ["tf_unable_to_use_radio", true];

        diag_log format ["streaming spectator: disabling tfar spectator channel for %1", player];

        [] spawn {
            waitUntil {(OPFOR_TELEPORT_TARGET select 0 != 0)};
            private _truck = missionNameSpace getVariable ["GRAD_tracking_radioVehObj", objNull];
            [0, _truck, -2, [0,20,50], getDir _truck] call ace_spectator_fnc_setCameraAttributes;
        };
        // as we dont have any events we force spectator false here in a cheap local loop
        [{
            player setVariable ["TFAR_forceSpectator", false];
        }, 0, []] call CBA_fnc_addPerFrameHandler;
    };
};