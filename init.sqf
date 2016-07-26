#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

// islandconfig must be before initgui!
call compile preprocessFile "islandConfig.sqf";
clearInventory = compile preprocessFile "helpers\clearInventory.sqf";
spawnStuff = compile preprocessFile "helpers\spawnStuff.sqf";
[] execVM "spawn\initGUI.sqf";

// optimize for PVP
// disableRemoteSensors true; // ai driving behaviour affected?
setViewDistance 3500;


// paramsarray select 12 is BFT module in editor
waitUntil {!isNil "JIP_TIME_ALLOWED"};
jipTime = JIP_TIME_ALLOWED;

waitUntil {!isNil "CIVILIAN_TRAFFIC"};
if (CIVILIAN_TRAFFIC == 1) then {
	[] execVM "Engima\Traffic\Init.sqf";
};

waitUntil {!isNil "REPLAY_ACCURACY"};
[REPLAY_ACCURACY] execVM "node_modules\grad_replay\GRAD_replay_init.sqf";

if (hasInterface) then {
	call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";

  ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

	player allowDamage false;
	[] execVM "player\setup\adjustInitialSpawnPosition.sqf"; diag_log format ["setup: initial spawn position initiated"];


	checkJIP = {
		if ((OPFOR_TELEPORT_TARGET select 0 != 0) && didJIP && serverTime > jipTime) then {
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
		if (str player != "opfor_teamlead") then {
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

	[] execVM "player\allXXXSurrenderedListener.sqf"; diag_log format ["setup: surrenderlistener initiated"];
	// [player] execVM "loadouts\_client.sqf";
	[] spawn {
		sleep (random 10);
		[player] execVM "loadouts\_client.sqf"; diag_log format ["setup: loadout %1 initiated",player];
		enableSentences false;
		showSubtitles false;
		0 fadeRadio 0;
	};

	[] execVM "spawn\hedgehogAssemblingSystem.sqf";
	[] execVM "spawn\assaultBoatAssemblingSystem.sqf";
	[] execVM "spawn\addInteractions.sqf";
	[] execVM "player\civKillListener.sqf";
	[] execVM "player\civGunfightListener.sqf";
	[] execVM "player\startMarkerListener.sqf";

	waitUntil {!isNil "OPFOR_TELEPORT_TARGET"};
	waitUntil {!isNil "BLUFOR_TELEPORT_TARGET"};

	if (playerSide == west) then {
		[] execVM "player\russianMarker.sqf";
		[] execVM "player\bluforBluforTeleportListener.sqf";
		[] execVM "player\bluforRussianPointsListener.sqf";
		[] spawn checkJIP;
	};

	if (playerSide == east) then {
		[] execVM "player\russianMarker.sqf"; diag_log format ["setup: russianmarker initiated"];
		[] execVM "player\opforOpforTeleportListener.sqf"; diag_log format ["setup: opforOpforTeleportListener initiated"];
		[] execVM "player\bluforRussianPointsListener.sqf";
		[] execVM "player\radioBoxDistanceListener.sqf";
		[] spawn checkJIP; diag_log format ["setup: createStartHints initiated"];
		player setVariable ["radioAttached",false]; // for use in detaching radio from radio truck
	};

	player addEventHandler ["WeaponAssembled", {[_this select 1] execVM "helpers\nerfDrone.sqf"}];		//Darter nerf fuel and TIE


	/*waitUntil {!isNull player && !isNil "ST_STHud_ToRestart"};
	// disable sthud for intro
	0 call fn_sthud_usermenu_changeMode;*/
};
