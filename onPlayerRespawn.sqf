if (player getVariable ["grad_gcamspec_firstSpawn", true]) exitWith {
	player setVariable ["grad_gcamspec_firstSpawn", false, true];
	player setVariable ["GRAD_replay_track", true, true];

	hint "";
	openMap [false, false];
};

// float above death position
_deathPos = player getVariable ["GRAD_replay_playerPosition", getPosATL (selectRandom (playableUnits + switchableUnits))];
// move player to side logic
// _spectator = (createGroup sideLogic) createUnit ["VirtualCurator_F", _deathPos, [], 0, "FORM"];
// selectPlayer _spectator;
[player] joinsilent SPEC_GROUP;


// disable simulation, hide player
if (!isMultiplayer) then {
	player enableSimulation false;
	player hideObject true;
} else {
	[player, _deathPos] remoteExec ["GRAD_replay_fnc_setMeSpectator", 2, false];
};


// disable damage
player allowDamage false;
player setVariable ["ace_medical_allowDamage", false];


_focus = player getVariable ["GRAD_gcamspec_currentFocus", player];

if (missionNamespace getVariable ["GRAD_replay_isRunning", false]) exitWith {
	[] call GRAD_replay_fnc_preparePlaybackClient;
};

if (missionNamespace getVariable ["grad_replay_player_gcamspec", false]) then {
	// ["Terminate"] call BIS_fnc_EGSpectator;


	[_focus] execVM "grad_gcamspec\gcam\gcam.sqf";
	missionNamespace setVariable ["grad_replay_player_gcamspec", false];
	[player, true] call TFAR_fnc_forceSpectator;

} else {
	setPlayerRespawnTime 999999;
	[true] call ace_spectator_fnc_setSpectator;
	// ["Initialize", [player, [west, east], true, true, true, false, true, true, true, true]] call BIS_fnc_EGSpectator;
	missionNamespace setVariable ["grad_replay_player_gcamspec", true];
	[player, true] call TFAR_fnc_forceSpectator;
};