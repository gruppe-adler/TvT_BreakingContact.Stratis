hint "";
openMap [false, false];

if (player getVariable ["grad_gcamspec_firstSpawn", true]) exitWith {
	player setVariable ["grad_gcamspec_firstSpawn", false];
};
["Terminate"] call BIS_fnc_EGSpectator;
// put player somewhere

player setPos [0,0,100];

if (isMultiplayer) then {
	player enableSimulationGlobal false;
	player hideObjectGlobal true;
} else {
	player enableSimulation false;
	player hideObject true;
};

player allowDamage false;
player setVariable ["ace_medical_allowDamage", false];

_focus = player getVariable ["GRAD_gcamspec_currentFocus", player];

if (player getVariable ["grad_gcamspec", false]) then {
	
	[_focus] execVM "grad_gcamspec\gcam\gcam.sqf";
	player setVariable ["grad_gcamspec", false];
	[player] joinsilent SPEC_GROUP; 

} else {
	setPlayerRespawnTime 999999;
	["Initialize", [player, [west, east], true, true, true, false, true, true, true, true]] call BIS_fnc_EGSpectator;
	player setVariable ["grad_gcamspec", true];
};