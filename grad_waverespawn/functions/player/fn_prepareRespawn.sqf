#include "\z\ace\addons\main\script_component.hpp"

diag_log format ["Ready to respawn. Preparing..."];

_respawns = player getVariable ["GRAD_waveRespawn_respawnCount",0];
player setVariable ["GRAD_waveRespawn_respawnCount", (_respawns + 1) , true];
setPlayerRespawnTime 0;
// forceRespawn player;
_vehClass = player getVariable ["GRAD_waveRespawn_vehicleRespawnClass", ""];
_vehClass createVehicle position player;

["Respawned"] call EFUNC(common,displayTextStructured);

[player, false] call TFAR_fnc_forceSpectator;
[false] call ace_spectator_fnc_setSpectator;