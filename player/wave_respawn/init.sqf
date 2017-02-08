GRAD_wr_onPlayerKilled = compile preprocessFileLineNumbers "player\waveRespawn\onPlayerKilled.sqf";
GRAD_wr_prepareRespawn = compile preprocessFileLineNumbers "player\waveRespawn\prepareRespawn.sqf";
GRAD_wr_removeFromWaveRespawn = compile preprocessFileLineNumbers "player\waveRespawn\removeFromWaveRespawn.sqf";


switch (playerSide) do {
	case (west) do: {
		player setVariable ["GRAD_wr_vehicleRespawnClass", "RDS_JAWA353_Civ_01"];
	};

	case (east) do {
		player setVariable ["GRAD_wr_vehicleRespawnClass", "RHS_UAZ_MSV_01"];
	};

	default {};
};