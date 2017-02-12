#include "\z\ace\addons\main\script_component.hpp"

if (MISSION_COMPLETED) exitWith {};

[true] call ace_spectator_fnc_setSpectator;

[player, true] call TFAR_fnc_forceSpectator;

_killer = player getVariable ["ace_medical_lastDamageSource", objNull];

if (!isNull _killer) then {

	_string = format ['Killed by %1',_killer];
	[_string] call EFUNC(common,displayTextStructured);

	if (!FACTIONS_DEFAULT) then {
		[player, _killer] call GRAD_wr_onPlayerKilled;
	};
} else {
	[true] call ace_spectator_fnc_setSpectator;
};

