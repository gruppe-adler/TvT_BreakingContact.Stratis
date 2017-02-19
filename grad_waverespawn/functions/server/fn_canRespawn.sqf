params ["_unit", "_side"];


switch (_side) do {
    case (WEST): {
		if (RESPAWN_AVAILABLE_BLU > 0) exitWith {
			RESPAWN_AVAILABLE_BLU = RESPAWN_AVAILABLE_BLU - 1;
			[] remoteExec ["GRAD_waveRespawn_fnc_prepareRespawn", _unit, false];
		};
	};
	case (EAST): {
		if (RESPAWN_AVAILABLE_OPF > 0) exitWith {
			RESPAWN_AVAILABLE_OPF = RESPAWN_AVAILABLE_OPF - 1;
			[] remoteExec ["GRAD_waveRespawn_fnc_prepareRespawn", _unit, false];
		};
	};
};