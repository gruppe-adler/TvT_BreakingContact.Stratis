params ["_deadPlayer", ["_deadPlayerSide", sideUnknown]];

// dont let player add themselves if they died already x times
if (_deadPlayer getVariable ["GRAD_waveRespawn_respawnCount",0] > 3) exitWith {
    [] remoteExec ["GRAD_waveRespawn_fnc_removeFromWaveRespawn", _deadPlayer, false];
};

switch (_deadPlayerSide) do {
    case (WEST): {
        deadPlayersBlu pushBackUnique _deadPlayer;
        diag_log format ["Added player %1 to deadPlayersBlu. %2 dead blufor total.", _deadPlayer, count deadPlayersBlu];
    };
    case (EAST): {
        deadPlayersOpf pushBackUnique _deadPlayer;
        diag_log format ["Added player %1 to deadPlayersOpf. %2 dead opfor total.", _deadPlayer, count deadPlayersOpf];
    };
    default {
        diag_log format ["Unknown side for player %1", _deadPlayer];
    };
};