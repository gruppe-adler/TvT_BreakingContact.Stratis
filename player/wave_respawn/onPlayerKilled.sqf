params ["_victim", "_killer"];

[_victim] remoteExec ["GRAD_wr_addPlayerToWaiting", 2, false];

switch (playerSide) do {
	case (west) do {
		["Initialize", [player, [west], true, false, false, false, false, true, false, true]] call BIS_fnc_EGSpectator;
		missionNamespace setVariable [VAR_CAMERA_DUMMY_TARGET, _killer];
	};
	case (east) do {
		["Initialize", [player, [east], true, false, false, false, false, true, false, true]] call BIS_fnc_EGSpectator;
		missionNamespace setVariable [VAR_CAMERA_DUMMY_TARGET, _killer];
	};
	default {
		["Initialize", [player, [west], true, false, false, false, false, true, false, true]] call BIS_fnc_EGSpectator;
	};
};