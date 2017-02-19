#include "\z\ace\addons\main\script_component.hpp"

params ["_victim"];

[_victim, playerSide] remoteExec ["GRAD_waveRespawn_fnc_addPlayerToWaiting", 0, false];

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