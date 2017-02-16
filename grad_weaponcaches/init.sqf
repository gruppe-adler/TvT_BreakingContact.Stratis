/*
 *
 *
 *
 params ["_position", "_side", "_code", "_minDistance", "_maxDistance"];
 [getpos player, west, {}, 1000,2000] call GRAD_weaponcaches_fnc_prepareCache;
 *
 */


_cargoNetBox = "B_CargoNet_01_ammo_F";
_camoNetBoxes = ["Box_FIA_Ammo_F", "Box_FIA_Support_F"];

_classicCratesCUP = [
	"AmmoCrate_NoInteractive_",
	"AmmoCrates_NoInteractive_Large",
	"AmmoCrates_NoInteractive_Medium",
	"AmmoCrates_NoInteractive_Small"
];


missionNamespace setVariable ["grad_weaponcaches_classnames", _classicCratesCUP, true];

grad_weaponcaches_minDistance = 1000;