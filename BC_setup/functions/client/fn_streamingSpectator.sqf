if (hasInterface) then {
    if ((typeOf player) == "VirtualSpectator_F") then {
        player setVariable ["tf_forcedCurator", false, true];
        player setVariable ["TFAR_forceSpectator", false, true];
        player setVariable ["tf_voiceVolume", 0, true];
        player setVariable ["tf_voiceVolume", 0, true];
        player setVariable ["tf_unable_to_use_radio", true];

        diag_log format ["streaming spectator: disabling tfar spectator channel for %1", player];
    };
};