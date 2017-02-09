_CIV_KILLED_listener = {
    publicVariable "CIV_KILLED";

    _killer = CIV_KILLED select 1;

    if (!isNull _killer) then {

	    if (side _killer == west) then {
	    	RESPAWN_AVAILABLE_OPF = RESPAWN_AVAILABLE_OPF + 1;
	    	diag_log format ["killer is from west, setting respawn for opfor to %1", RESPAWN_AVAILABLE_OPF];
	    };
	    if (side _killer == east) then {
	    	RESPAWN_AVAILABLE_BLU = RESPAWN_AVAILABLE_BLU + 1;
	    	diag_log format ["killer is from east, setting respawn for blufor to %1", RESPAWN_AVAILABLE_BLU];
		};

   	};
};


"CIV_KILLED" addPublicVariableEventhandler _CIV_KILLED_listener;