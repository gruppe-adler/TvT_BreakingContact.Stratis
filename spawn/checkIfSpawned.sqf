if (!OPFOR_TELEPORTED && (_this select 0 == east)) exitWith {
	if (player == opfor_teamlead) then {
		titleCut ["Mission Setup", "BLACK", 999];
		0 = createDialog "gui_spawn_opfor";
		waitUntil {dialog};
		titleCut ["Mission Setup", "BLACK", 999];
		[] call checkSpawnButton;
	} else {
		titleCut ["Mission Setup", "BLACK", 999];
		0 = createDialog "gui_spawn_waitplease";
		titleCut ["Mission Setup", "BLACK", 999];
		waitUntil {BLUFOR_TELEPORTED};
		cutText ["", "BLACK IN", 1];
	};
};

if (!BLUFOR_TELEPORTED && (_this select 0 == west)) exitWith {
	titleCut ["Mission Setup", "BLACK", 999];
	0 = createDialog "gui_spawn_waitplease";
	waitUntil {dialog};
	if (BLUFOR_TELEPORTED) exitWith {cutText ["", "BLACK IN", 1];};
	titleCut ["Mission Setup", "BLACK", 999];
	[] call checkSpawnButton;
};