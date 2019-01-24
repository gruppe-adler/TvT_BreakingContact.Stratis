[] call BC_setup_fnc_initialSpawnClient;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
[] call BC_setup_fnc_addInteractions; // add interactions

waitUntil {!isNil "CIVILIAN_TRAFFIC"};

// todo activate grad civs


player addEventHandler ["handleRating", {
    0
}];

// disable spectating the fucking civs
[[west, east], [civilian, independent]] call ace_spectator_fnc_updateSides;

["grad_loadout_loadoutApplied",{
	
	
    private _uid = getPlayerUID player;

	// BI ROB
	if (_uid isEqualTo "76561198063952624" || _uid isEqualTo "_SP_PLAYER_") then {
        [player] call GRAD_slingHelmet_fnc_actionSling;
        [{
		  player addHeadgear "kio_p_helmet";
        }, [], 1] call CBA_fnc_waitAndExecute;
	};

}] call CBA_fnc_addEventhandler;