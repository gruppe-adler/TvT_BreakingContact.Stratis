#include "\z\ace\addons\main\script_component.hpp"

[player, true] call TFAR_fnc_forceSpectator;
setPlayerRespawnTime 999999;

[true] call ace_spectator_fnc_setSpectator;

_killer = player getVariable ["ace_medical_lastDamageSource", objNull];
if (!isNull _killer) then {

	_string = format ['Killed by %1',name _killer];
	_stringHint = "Entering Spectator. Press Key UP for free cam.";
	systemChat _string;
	systemChat _stringHint;
	/* [_string] call EFUNC(common,displayTextStructured);*/

};