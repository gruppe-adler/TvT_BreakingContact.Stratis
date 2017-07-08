#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

enableDynamicSimulationSystem true;

0 = [] execVM "grad_buymenu\buymenu_init.sqf";

clearInventory = compile preprocessFile "helpers\clearInventory.sqf";
spawnStuff = compile preprocessFile "helpers\spawnStuff.sqf";


// optimize for PVP
disableRemoteSensors true; // disable ai combat ability
setViewDistance 3500;


// loadout + wave respawn added
IS_WOODLAND = ["woodland",true] call BC_objectives_fnc_getIslandCfgEntry;

if (IS_WOODLAND) then {
// us vs russians
	["BLU_F", "US_Woodland"] call GRAD_Loadout_fnc_FactionSetLoadout;
	["OPF_F", "RU_Woodland"] call GRAD_Loadout_fnc_FactionSetLoadout;
} else {
	["BLU_F", "US_Desert"] call GRAD_Loadout_fnc_FactionSetLoadout;
	["OPF_F", "RU_Desert"] call GRAD_Loadout_fnc_FactionSetLoadout;
};


call compile preprocessfile "loadouts\setLoadoutRandomization.sqf";

// paramsarray select 12 is BFT module in editor
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

		waitUntil {!isNull player};

		if (playerSide == east) then {
				[OPFOR_TELEPORT_TARGET, 50] execVM "player\teleportPlayer.sqf";
			}
			else {
				[BLUFOR_TELEPORT_TARGET, 50] execVM "player\teleportPlayer.sqf";
			};
		};
	};


	checkSpawnButton = {
		_spawnSelector = "opfor_teamlead";
		if (str player != _spawnSelector) then {
			0 = [[worldSize/2,worldSize/2,0],"",1500] execVM "player\setup\establishingShot.sqf";
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

	[] execVM "player\setup\helpBriefing.sqf"; diag_log format ["setup: briefing initiated"];

	[] execVM "spawn\assaultBoatAssemblingSystem.sqf";
	[] execVM "player\civKillListener.sqf";
	[] execVM "player\civGunfightListener.sqf";
	[] execVM "player\startMarkerListener.sqf";

	waitUntil {!isNil "OPFOR_TELEPORT_TARGET"};
	waitUntil {!isNil "BLUFOR_TELEPORT_TARGET"};

	if (playerSide == west) then {
		[] execVM "player\bluforBluforTeleportListener.sqf";
		[] spawn checkJIP;
	};

	if (playerSide == east) then {
		[] execVM "player\opforOpforTeleportListener.sqf"; diag_log format ["setup: opforOpforTeleportListener initiated"];
		[] spawn checkJIP; diag_log format ["setup: createStartHints initiated"];
		player setVariable ["radioAttached",false]; // for use in detaching radio from radio truck
	};

};
