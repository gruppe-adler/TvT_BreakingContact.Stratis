if (!OPFOR_TELEPORTED && (_this select 0 == east)) exitWith {
	0 = createDialog "gui_spawn_opfor";
	waitUntil {dialog};
	[] call checkSpawnButton;
	titleCut ["", "BLACK FADED", 999];
};

if (!BLUFOR_TELEPORTED && (_this select 0 == west)) exitWith {
	0 = createDialog "gui_spawn_blufor";
	waitUntil {dialog};
	[] call checkSpawnButton;
	titleCut ["", "BLACK FADED", 999];
};