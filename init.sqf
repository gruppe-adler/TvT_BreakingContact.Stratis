#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

enableDynamicSimulationSystem true;

0 = [] execVM "grad_buymenu\buymenu_init.sqf";

// optimize for PVP
disableRemoteSensors true; // disable ai combat ability
setViewDistance 3500;

if (IS_WOODLAND) then {
// us vs russians
	["BLU_F", "US_Woodland"] call GRAD_Loadout_fnc_FactionSetLoadout;
	["OPF_F", "RU_Woodland"] call GRAD_Loadout_fnc_FactionSetLoadout;
} else {
	["BLU_F", "US_Desert"] call GRAD_Loadout_fnc_FactionSetLoadout;
	["OPF_F", "RU_Desert"] call GRAD_Loadout_fnc_FactionSetLoadout;
};

call compile preprocessfile "loadouts\setLoadoutRandomization.sqf";


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


	checkSpawnButton = {
		_spawnSelector = "opfor_teamlead";
		if (str player != _spawnSelector) then {
			0 = [[worldSize/2,worldSize/2,0],"",1500] spawn BC_setup_fnc_establishingShot;
		} else {
		disableSerialization;
		waitUntil {!(isNull ([] call BIS_fnc_displayMission))};
			cheffeKeyEH = ([] call BIS_fnc_displayMission) displayAddEventHandler [
				"KeyDown",
				format ["
						if (OPFOR_TELEPORT_TARGET select 0 != 0) then {
							([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];

							playSound ['click', true];

						};

						if (_this select 1 == 57) then {0 = createDialog 'gui_spawn_opfor'; true};
					"]
			];
			0 = createDialog "gui_spawn_opfor";
			waitUntil {(OPFOR_TELEPORT_TARGET select 0 != 0)};
			([] call BIS_fnc_displayMission) displayRemoveEventHandler ['KeyDown', cheffeKeyEH];
		};
	};

	[] call BC_setup_fnc_addBriefing;

	waitUntil {!isNil "OPFOR_TELEPORT_TARGET"};
	waitUntil {!isNil "BLUFOR_TELEPORT_TARGET"};

	if (playerSide == west) then {
		[] spawn checkJIP;
	};

	if (playerSide == east) then {
		[] spawn checkJIP; diag_log format ["setup: createStartHints initiated"];
		player setVariable ["radioAttached",false]; // for use in detaching radio from radio truck
	};

};
