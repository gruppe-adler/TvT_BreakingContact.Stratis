#include "\z\ace\addons\main\script_component.hpp"

if (!MISSION_COMPLETED) then {
	[true] call ace_spectator_fnc_setSpectator;
};
[player, true] call TFAR_fnc_forceSpectator;

_killer = player getVariable ["ace_medical_lastDamageSource", objNull];

if (!isNull _killer) then {
	_pos = getPos _killer;
	_pos set [1,10];
	_pos set [2,3];

	[0, _killer, -2, _pos] call ace_spectator_fnc_setCameraAttributes;
};

_string = format ['Killed by %1',_killer];
[_string] call EFUNC(common,displayTextStructured);