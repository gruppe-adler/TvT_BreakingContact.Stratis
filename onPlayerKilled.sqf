#include "\z\ace\addons\main\script_component.hpp"

[player, true] call TFAR_fnc_forceSpectator;
setPlayerRespawnTime 999999;

if (!TRACKING_PERSON || player getVariable ["GRAD_isVIP", false]) then {
		[true] call ace_spectator_fnc_setSpectator;
	} else {
		[player] call GRAD_waverespawn_fnc_onPlayerKilled;
		[true] call ace_spectator_fnc_setSpectator;
	};

_killer = player getVariable ["ace_medical_lastDamageSource", objNull];
if (!isNull _killer) then {

	_string = format ['Killed by %1',name _killer];
	_stringHint = "Entering Spectator. Press Key UP for free cam.";
	systemChat _string;
	systemChat _stringHint;
	/* [_string] call EFUNC(common,displayTextStructured);*/

};