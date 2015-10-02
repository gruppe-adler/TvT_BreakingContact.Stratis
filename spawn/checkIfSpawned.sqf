if (!OPFOR_TELEPORTED && (_this select 0 == east)) exitWith {
	if (player == opfor_teamlead) then {
		waitUntil {dialog};
		[] call checkSpawnButton;
	} else {
		openMap [true,false];
		cutRsc ["gui_opfor_pleasewait","PLAIN",0];
		waitUntil {!visibleMap};
		if (OPFOR_TELEPORT_TARGET select 0 != 0) exitWith {};
		hintsilent "Please dont move. Showing map...";
		sleep 3;
		if (BLUFOR_TELEPORT_TARGET select 0 != 0) exitWith {};
		[] call checkSpawnButton;
	};
};

if (!BLUFOR_TELEPORTED && (_this select 0 == west)) exitWith {
	openMap [true,false];
	cutRsc ["gui_blufor_pleasewait","PLAIN",0];
	waitUntil {!visibleMap};
	if (BLUFOR_TELEPORT_TARGET select 0 != 0) exitWith {};
	hintsilent "Please dont move. Showing map...";
	sleep 3;
	if (BLUFOR_TELEPORT_TARGET select 0 != 0) exitWith {};
	[] call checkSpawnButton;
};