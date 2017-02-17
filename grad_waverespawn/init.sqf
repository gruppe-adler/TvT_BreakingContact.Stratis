_BLU_VEHICLE_ON_RESPAWN = "RDS_JAWA353_Civ_01";
_OPF_VEHICLE_ON_RESPAWN = "RHS_UAZ_MSV_01";


if (isServer) then {

	deadPlayersBlu = [];
	deadPlayersOpf = [];

	RESPAWN_AVAILABLE_BLU = 0;
	RESPAWN_AVAILABLE_OPF = 0;

	[deadPlayersBlu, deadPlayersOpf] call GRAD_waverespawn_fnc_checkWaiting;
};

if (hasInterface) then {
	switch (playerSide) do {
		case west: {
			player setVariable ["GRAD_waveRespawn_vehicleRespawnClass", _BLU_VEHICLE_ON_RESPAWN];
		};

		case east: {
			player setVariable ["GRAD_waveRespawn_vehicleRespawnClass", _OPF_VEHICLE_ON_RESPAWN];
		};

		default {};
	};
};