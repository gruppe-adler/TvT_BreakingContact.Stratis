
GRAD_wr_addPlayerToWaiting = compile preprocessFileLineNumbers "server\waveRespawn\addPlayerToWaiting.sqf";
GRAD_wr_checkWaiting = compile preprocessFileLineNumbers "server\waveRespawn\GRAD_wr_checkWaiting.sqf";
GRAD_wr_removePlayerToWaiting = compile preprocessFileLineNumbers "server\waveRespawn\removePlayerToWaiting.sqf";
GRAD_wr_canRespawn = compile preprocessFileLineNumbers "server\waveRespawn\GRAD_wr_canRespawn.sqf";

deadPlayersBlu = [];
deadPlayersOpf = [];

RESPAWN_AVAILABLE_BLU = 0;
RESPAWN_AVAILABLE_OPF = 0;

[deadPlayersBlu, deadPlayersOpf] call GRAD_wr_checkWaiting;