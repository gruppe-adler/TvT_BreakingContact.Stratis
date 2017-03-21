["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
0 = execVM "spawn\addInteractions.sqf";

[{!isNil "TRACKING_PERSON"}, {

	if (!TRACKING_PERSON) then {
		
	} else {
		0 = execVM "grad_waverespawn\init.sqf";
	};

}, []] call CBA_fnc_waitUntilAndExecute;

player addEventHandler ["handleRating", {
	0
}];