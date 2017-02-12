GRAD_wr_removeFromWaveRespawn = {
	[[west, east, civilian, independent], []] call ace_spectator_fnc_updateSpectatableSides;
	[[0,1,2], []] call ace_spectator_fnc_updateCameraModes;
	hintSilent "You died too often. Respawns are disabled now. Free Cam enabled.";
};