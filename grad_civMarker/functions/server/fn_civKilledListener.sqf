_CIV_KILLED_listener = {
    publicVariable "CIV_KILLED";

    [CIV_KILLED] remoteExec ["grad_civMarker_fnc_civKilledCreateClient", [0, -2] select isDedicated];
};


"CIV_KILLED" addPublicVariableEventhandler _CIV_KILLED_listener;
