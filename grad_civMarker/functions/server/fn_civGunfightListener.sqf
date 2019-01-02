_CIV_GUNFIGHT_POS_listener = {
    publicVariable "CIV_GUNFIGHT_POS";

    [CIV_GUNFIGHT_POS] remoteExec ["grad_civMarker_fnc_civGunfightCreateClient", [0, -2] select isDedicated];

};


"CIV_GUNFIGHT_POS" addPublicVariableEventhandler _CIV_GUNFIGHT_POS_listener;
