

diag_log format ["checkifspawned executed"];

if (!OPFOR_TELEPORTED && (_this select 0 == east)) exitWith {
	if (player == opfor_teamlead) then {
		0 = createDialog "gui_spawn_opfor";
		waitUntil {dialog};
		titleCut ["Mission Setup", "BLACK", 999];
		[] call checkSpawnButton;
	} else {
		0 = createDialog "gui_spawn_waitplease";
		titleCut ["Mission Setup", "BLACK", 999];
		waitUntil {BLUFOR_TELEPORTED};
		cutText ["", "BLACK IN", 1];
	};
};

if (!BLUFOR_TELEPORTED && (_this select 0 == west)) exitWith {
	0 = createDialog "gui_spawn_blufor";
	waitUntil {dialog || (BLUFOR_TELEPORTED)};
	if (BLUFOR_TELEPORTED) exitWith {cutText ["", "BLACK IN", 1];};
	titleCut ["Mission Setup", "BLACK", 999];
	[] call checkSpawnButton;
};