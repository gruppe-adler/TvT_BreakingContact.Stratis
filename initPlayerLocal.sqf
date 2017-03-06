["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
0 = execVM "spawn\addInteractions.sqf";

[{!isNil "FACTIONS_DEFAULT"}, {

	if (!FACTIONS_DEFAULT) then {
		
	} else {
		0 = execVM "grad_waverespawn\init.sqf";
	};

}, []] call CBA_fnc_waitUntilAndExecute;

["hideHud", [true, true, true, true, true, true, true, true]] call ace_common_fnc_showHud; // fix for action menu crosshair info