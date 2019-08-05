if (player getVariable ["grad_gcamspec_firstSpawn", true]) exitWith {
     player setVariable ["grad_gcamspec_firstSpawn", false, true];
     player setVariable ["GRAD_replay_track", true, true];

     hint "";
     openMap [false, false];
};

// move player to side civilian
[player] joinsilent SPEC_GROUP;

// disable damage
player allowDamage false;
player setVariable ["ace_medical_allowDamage", false];

if (missionNamespace getVariable ["GRAD_replay_isRunning", false]) exitWith {
     [] call GRAD_replay_fnc_preparePlaybackClient;
};


setPlayerRespawnTime 999999;
[true] call ace_spectator_fnc_setSpectator;
#ifndef GRAD_FACTIONS_USE_ACRE
[player, true] call TFAR_fnc_forceSpectator;
#endif
