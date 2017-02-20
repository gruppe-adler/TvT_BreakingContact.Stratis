params ["_unit", "_side"];


switch (_side) do {
    case (WEST): {
    	// send to respawn
		if (RESPAWN_AVAILABLE_BLU > 0) exitWith {
			RESPAWN_AVAILABLE_BLU = RESPAWN_AVAILABLE_BLU - 1;
			[] remoteExec ["GRAD_waveRespawn_fnc_prepareRespawn", _unit, false];
			[_unit] call GRAD_waveRespawn_fnc_removePlayerWaiting;

			diag_log format ["canRespawn sends prepare to %1", _unit];
		};
		// send to free cam if no respawn available
		[] remoteExec ["GRAD_waveRespawn_fnc_removeFromWaveRespawn", _unit, false];
		[_unit] call GRAD_waveRespawn_fnc_removePlayerWaiting;		
	};
	case (EAST): {
		// send to respawn
		if (RESPAWN_AVAILABLE_OPF > 0) exitWith {
			RESPAWN_AVAILABLE_OPF = RESPAWN_AVAILABLE_OPF - 1;
			[] remoteExec ["GRAD_waveRespawn_fnc_prepareRespawn", _unit, false];
			[_unit] call GRAD_waveRespawn_fnc_removePlayerWaiting;

			diag_log format ["canRespawn sends prepare to %1", _unit];			
		};
		// send to free cam if no respawn available
		[] remoteExec ["GRAD_waveRespawn_fnc_removeFromWaveRespawn", _unit, false];
		[_unit] call GRAD_waveRespawn_fnc_removePlayerWaiting;
	};
};