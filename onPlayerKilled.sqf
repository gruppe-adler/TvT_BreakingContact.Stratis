if (!MISSION_COMPLETED) then {
[true] call ace_spectator_fnc_setSpectator;
};
[player, true] call TFAR_fnc_forceSpectator;
