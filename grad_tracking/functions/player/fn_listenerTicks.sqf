#include "\z\ace\addons\main\script_component.hpp"

["server_GRAD_TICKS_DONE", {
    params ["_value"];

    GRAD_TICKS_DONE = _value;
    _value call GRAD_tracking_fnc_showTicksWarning;

}] call CBA_fnc_addEventhandler;
