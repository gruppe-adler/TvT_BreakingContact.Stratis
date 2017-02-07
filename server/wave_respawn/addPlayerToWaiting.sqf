params ["_deadPlayer", ["_deadPlayerSide", sideUnknown]];

if (_deadPlayer getVariable ["GRAD_wr_respawnCount",0] > 5) exitWith {
    ["You died too often. Respawns are disabled now."] remoteExec ["hintSilent", _deadPlayer, false];
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