if (player getVariable ["grad_gcamspec", false]) then {
	[true] call ace_spectator_fnc_setSpectator;
	player setVariable ["grad_gcamspec", false];
} else {
	[player, true] call ace_spectator_fnc_stageSpectator;
	[player] execVM "grad_gcamspec\gcam\gcam.sqf";
	player setVariable ["grad_gcamspec", true];
};