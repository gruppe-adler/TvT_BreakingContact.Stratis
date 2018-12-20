#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

enableDynamicSimulationSystem true;

[] execVM "grad_buymenu\buymenu_init.sqf";

// optimize for PVP
disableRemoteSensors true; // disable ai combat ability

if (BC_IS_WOODLAND) then {
// us vs russians
	["BLU_F", "US_Woodland"] call GRAD_Loadout_fnc_FactionSetLoadout;
	["OPF_F", "RU_Woodland"] call GRAD_Loadout_fnc_FactionSetLoadout;
} else {
	["BLU_F", "US_Desert"] call GRAD_Loadout_fnc_FactionSetLoadout;
	["OPF_F", "RU_Desert"] call GRAD_Loadout_fnc_FactionSetLoadout;
};

call compile preprocessfile "BC_loadouts\setLoadoutRandomization.sqf";


waitUntil {!isNil "JIP_TIME_ALLOWED"};
jipTime = JIP_TIME_ALLOWED;

waitUntil {!isNil "REPLAY_ACCURACY"};

if (hasInterface) then {
	call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";

	/* SERVER TIME is taken from server pv */
	checkJIP = {
		if ((OPFOR_TELEPORT_TARGET select 0 != 0) && didJIP && CBA_missionTime > jipTime) then {
			player setDamage 1;
		} else {
		if (!didJIP) exitWith {
			[] call checkSpawnButton;
		};
		};
	};

	[] call BC_setup_fnc_addBriefing;

	waitUntil {!isNil "OPFOR_TELEPORT_TARGET"};
	waitUntil {!isNil "BLUFOR_TELEPORT_TARGET"};

	[[worldSize/2,worldSize/2,0],"",1500] spawn BC_setup_fnc_establishingShot;

};
