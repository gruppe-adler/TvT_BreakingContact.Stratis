#include "\z\ace\addons\main\script_component.hpp"

if (MISSION_COMPLETED) exitWith {};



[player, true] call TFAR_fnc_forceSpectator;

_killer = player getVariable ["ace_medical_lastDamageSource", objNull];

if (!isNull _killer) then {

	_string = format ['Killed by %1',_killer];
	[_string] call EFUNC(common,displayTextStructured);

	if (!FACTIONS_DEFAULT) then {
		[player, _killer] call GRAD_wr_onPlayerKilled;
	};
} else {
	["Initialize", [player, [], true, true, false, false, false, true, false, true]] call BIS_fnc_EGSpectator;
};

