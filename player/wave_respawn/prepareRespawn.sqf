diag_log format ["Ready to respawn. Preparing..."];

//respawn not possible
if (player getVariable ["wr_interrupted", false]) exitWith {

    player allowDamage true;
    player setDamage 1;
    setPlayerRespawnTime 99999;
    [player, true] call TFAR_fnc_forceSpectator;
    hintsilent format ["sorry, mission over"];
};

player allowDamage true;
forceRespawn player;
[player, false] call TFAR_fnc_forceSpectator;
[false] call ace_spectator_fnc_setSpectator;
_respawns = player getVariable ["GRAD_wr_respawnCount",0];
player setVariable ["GRAD_wr_respawnCount", (_respawns + 1) , true];
setPlayerRespawnTime 1;

_vehClass = player getVariable ["GRAD_wr_vehicleRespawnClass", ""];
_vehClass createVehicle position player;