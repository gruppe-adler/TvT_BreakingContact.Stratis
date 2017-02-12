["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
0 = execVM "spawn\addInteractions.sqf";

[{!isNil "FACTIONS_DEFAULT"}, {

	if (!FACTIONS_DEFAULT) then {
		
	} else {
		0 = execVM "player\wave_respawn\init.sqf";
	};

}, []] call CBA_fnc_waitUntilAndExecute;

