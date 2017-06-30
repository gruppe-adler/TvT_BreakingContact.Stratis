hint "";
openMap [false, false];

if (player getVariable ["grad_gcamspec_firstSpawn", true]) exitWith {
	player setVariable ["grad_gcamspec_firstSpawn", false];
};

_killer = player getVariable ["ace_medical_lastDamageSource", objNull];
_randomGuy = selectRandom (playableUnits + switchableUnits - allDeadMen);

if (!isNull _killer) then {

	_string = format ['Killed by %1',name _killer];
	_stringHint = "Entering Spectator. Press Key UP for free cam.";
	systemChat _string;
	systemChat _stringHint;
};

if (player getVariable ["grad_gcamspec", false]) then {
	[true] call ace_spectator_fnc_setSpectator;
	player setVariable ["grad_gcamspec", false];
} else {
	[player, true] call ace_spectator_fnc_stageSpectator;

	if (!isNull _killer) then {
		[_killer] execVM "grad_gcamspec\gcam\gcam.sqf";
	} else {
		[_randomGuy] execVM "grad_gcamspec\gcam\gcam.sqf";
	};
	
	player setVariable ["grad_gcamspec", true];
};