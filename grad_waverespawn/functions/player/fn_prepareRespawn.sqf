diag_log format ["Ready to respawn. Preparing..."];

//respawn not possible
if (player getVariable ["waveRespawn_interrupted", false]) exitWith {

    player allowDamage true;
    player setDamage 1;
    setPlayerRespawnTime 99999;
    [player, true] call TFAR_fnc_forceSpectator;
    hintsilent format ["sorry, mission over"];
};

_respawns = player getVariable ["GRAD_waveRespawn_respawnCount",0];
player setVariable ["GRAD_waveRespawn_respawnCount", (_respawns + 1) , true];
setPlayerRespawnTime 1;
forceRespawn player;
_vehClass = player getVariable ["GRAD_waveRespawn_vehicleRespawnClass", ""];
_vehClass createVehicle position player;

player allowDamage true;
[player, false] call TFAR_fnc_forceSpectator;
[false] call ace_spectator_fnc_setSpectator;