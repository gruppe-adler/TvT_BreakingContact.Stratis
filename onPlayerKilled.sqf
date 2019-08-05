#include "\z\ace\addons\main\script_component.hpp"

params ["_player", "_killer"];

#ifndef GRAD_FACTIONS_USE_ACRE
[_player, true] call TFAR_fnc_forceSpectator;
#endif

if (!(_killer isEqualTo player)) then {

     private _string = format ['Killed by %1',name _killer];
     //systemChat _string;
     [_string] call EFUNC(common,displayTextStructured);
};

[true] call ace_spectator_fnc_setSpectator;
