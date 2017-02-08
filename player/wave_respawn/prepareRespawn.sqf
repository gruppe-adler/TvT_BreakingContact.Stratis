diag_log format ["Ready to respawn. Preparing..."];

//respawn not possible
if (player getVariable ["wr_interrupted", false]) exitWith {

    player allowDamage true;
    player setDamage 1;
    setPlayerRespawnTime 99999;
    [player, true] call TFAR_fnc_forceSpectator;
    [] call uo_common_fnc_startSpectator;
    hintsilent format ["sorry, mission over"];
};

player allowDamage true;
forceRespawn player;
[player, false] call TFAR_fnc_forceSpectator;


player setVariable ["GRAD_wr_respawnCount", player getVariable ["GRAD_wr_respawnCount",0] + 1, true];

_vehClass = player getVariable ["GRAD_wr_vehicleRespawnClass", ""];
_vehClass createVehicle position player;