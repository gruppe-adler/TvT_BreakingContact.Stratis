params ["_side"];

switch (_side) do {
	case west: {
		RESPAWN_AVAILABLE_BLU = RESPAWN_AVAILABLE_BLU + 1;
		diag_log format ["killer is from west, setting respawn for opfor to %1", RESPAWN_AVAILABLE_BLU];
		[west] remoteExec ["grad_waverespawn_fnc_respawnOnePlusHint", 0, false];
	};
	case east: {
		RESPAWN_AVAILABLE_OPF = RESPAWN_AVAILABLE_OPF + 1;
		diag_log format ["killer is from east, setting respawn for blufor to %1", RESPAWN_AVAILABLE_OPF];
		[east] remoteExec ["grad_waverespawn_fnc_respawnOnePlusHint", 0, false];
	};
	default { diag_log format ["killer is from unknown side"]; };
};