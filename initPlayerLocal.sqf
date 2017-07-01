[] execVM "player\setup\adjustInitialSpawnPositionNew.sqf";

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
0 = execVM "spawn\addInteractions.sqf";

waitUntil {!isNil "CIVILIAN_TRAFFIC"};

if (CIVILIAN_TRAFFIC == 1) then {
	0 = execVM "grad_civs\init.sqf";
};


player addEventHandler ["handleRating", {
	0
}];

// disable spectating the fucking civs
[[west, east], [civilian, independent]] call ace_spectator_fnc_updateSpectatableSides;