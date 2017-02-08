params ["_victim", "_killer"];

[_victim] remoteExec ["GRAD_wr_addPlayerToWaiting", 2, false];
[[1], [0,2]] call ace_spectator_fnc_updateCameraModes;