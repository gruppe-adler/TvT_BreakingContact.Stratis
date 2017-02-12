#include "\z\ace\addons\main\script_component.hpp"

params ["_victim", "_killer"];

[_victim] remoteExec ["GRAD_wr_addPlayerToWaiting", 2, false];

["You are now in the respawn list."] call EFUNC(common,displayTextStructured); 

switch (playerSide) do {
	case (west) do {
		[[west], [east, civilian, independent]] call ace_spectator_fnc_updateSpectatableSides;
		[[1], [0,2]] call ace_spectator_fnc_updateCameraModes;
	};
	case (east) do {
		[[east], [west, civilian, independent]] call ace_spectator_fnc_updateSpectatableSides;
		[[1], [0,2]] call ace_spectator_fnc_updateCameraModes;
	};
	default {
		[[east,west,civilian, independent], []] call ace_spectator_fnc_updateSpectatableSides;
		[[1], [0,2]] call ace_spectator_fnc_updateCameraModes;
	};
};