#include "\z\ace\addons\main\script_component.hpp"

params ["_player", "_killer"];

[player, true] call TFAR_fnc_forceSpectator;

if (!(_killer isEqualTo player)) then {

	_string = format ['Killed by %1',name _killer];
	//systemChat _string;
	[_string] call EFUNC(common,displayTextStructured);
};

[true] call ace_spectator_fnc_setSpectator;