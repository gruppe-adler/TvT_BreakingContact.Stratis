#include "\z\ace\addons\main\script_component.hpp"

params ["_player", "_killer"];

[_player, true] call TFAR_fnc_forceSpectator;

if (!(_killer isEqualTo player)) then {

     private _string = format ['Killed by %1',name _killer];
     //systemChat _string;
     [_string] call EFUNC(common,displayTextStructured);
};

[true] call ace_spectator_fnc_setSpectator;
[true] call BC_setup_fnc_spectatorDraw3D;