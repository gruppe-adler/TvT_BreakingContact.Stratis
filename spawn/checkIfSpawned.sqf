if ((OPFOR_TELEPORT_TARGET select 0 == 0) && (_this select 0 == east)) exitWith {
	0 = createDialog "gui_spawn_opfor";
	waitUntil {dialog};
	[] call checkSpawnButton;
	cutText ["", "BLACK FADED"];
};

if ((BLUFOR_TELEPORT_TARGET select 0 == 0) && (_this select 0 == west)) exitWith {
	0 = createDialog "gui_spawn_blufor";
	waitUntil {dialog};
	[] call checkSpawnButton;
	cutText ["", "BLACK FADED"];
};