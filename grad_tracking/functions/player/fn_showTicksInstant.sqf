#include "\z\ace\addons\main\script_component.hpp"

params ["_side"];

private ["_string_1", "_string_2"];

if (playerSide == _side) then {          _ticksRatio = GRAD_TICKS_DONE / GRAD_TICKS_NEEDED;
          _string_1 = localize "str_GRAD_transmissionTime_1";     
     _string_2 = " | " + str GRAD_INTERVALS_DONE + "/" + str GRAD_INTERVALS_NEEDED;
     _string = _string_1 + " " + (str (round(_ticksRatio * 100))) + " " + localize "str_GRAD_transmissionTime_2" + _string_2;     [_string] call EFUNC(common,displayTextStructured);
};