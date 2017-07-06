#include "\z\ace\addons\main\script_component.hpp"

params ["_player", "_killer"];

[player, true] call TFAR_fnc_forceSpectator;
setPlayerRespawnTime 0;

player setVariable ["GRAD_replay_persistentName", name player, true];

if (!(_killer isEqualTo player)) then {

	_string = format ['Killed by %1',name _killer];
	_stringHint = "Entering Spectator. Respawn to switch to GCAM.";
	systemChat _string;
	systemChat _stringHint;
	player setVariable ["GRAD_gcamspec_currentFocus", _killer];
};

/* [true] call ace_spectator_fnc_setSpectator; */