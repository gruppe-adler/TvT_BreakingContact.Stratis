GRAD_wr_onPlayerKilled = compile preprocessFileLineNumbers "player\wave_respawn\onPlayerKilled.sqf";
GRAD_wr_prepareRespawn = compile preprocessFileLineNumbers "player\wave_respawn\prepareRespawn.sqf";
GRAD_wr_removeFromWaveRespawn = compile preprocessFileLineNumbers "player\wave_respawn\removeFromWaveRespawn.sqf";


switch (playerSide) do {
	case (west) do: {
		player setVariable ["GRAD_wr_vehicleRespawnClass", "RDS_JAWA353_Civ_01"];
	};

	case (east) do {
		player setVariable ["GRAD_wr_vehicleRespawnClass", "RHS_UAZ_MSV_01"];
	};

	default {};
};