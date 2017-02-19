_CIV_KILLED_listener = {
    publicVariable "CIV_KILLED";

    _killer = CIV_KILLED select 1;

    if (!isNull _killer) then {

	    if (side _killer == west) then {
	    	[west] call grad_waverespawn_fnc_addRespawnForSide;
	    };
	    if (side _killer == east) then {
	    	[east] call grad_waverespawn_fnc_addRespawnForSide;
		};

   	};
};


"CIV_KILLED" addPublicVariableEventhandler _CIV_KILLED_listener;