_BLU_VEHICLE_ON_RESPAWN = "RDS_JAWA353_Civ_01";
_OPF_VEHICLE_ON_RESPAWN = "RHS_UAZ_MSV_01";


if (isServer) exitWith {

	deadPlayersBlu = [];
	deadPlayersOpf = [];

	RESPAWN_AVAILABLE_BLU = 0;
	RESPAWN_AVAILABLE_OPF = 0;

	[deadPlayersBlu, deadPlayersOpf] call GRAD_waveRespawn_fnc_checkWaiting;
};

switch (playerSide) do {
	case west: {
		player setVariable ["GRAD_waveRespawn_vehicleRespawnClass", _BLU_VEHICLE_ON_RESPAWN];
	};

	case east: {
		player setVariable ["GRAD_waveRespawn_vehicleRespawnClass", _OPF_VEHICLE_ON_RESPAWN];
	};

	default {};
};