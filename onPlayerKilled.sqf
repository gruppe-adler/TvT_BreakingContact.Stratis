#include "\z\ace\addons\main\script_component.hpp"

[player, true] call TFAR_fnc_forceSpectator;
setPlayerRespawnTime 999999;

if (!FACTIONS_DEFAULT) then {
		[player, true] call ace_spectator_fnc_stageSpectator;
	} else {
		[player] call GRAD_waverespawn_fnc_onPlayerKilled;
		[player, true] call ace_spectator_fnc_stageSpectator;
	};

_killer = player getVariable ["ace_medical_lastDamageSource", objNull];
if (!isNull _killer) then {

	_string = format ['Killed by %1',_killer];
	[_string] call EFUNC(common,displayTextStructured);

};