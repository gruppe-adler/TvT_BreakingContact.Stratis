#include "\z\ace\addons\main\script_component.hpp"

["server_GRAD_INTERVALS_DONE", {
    params ["_value"];

    GRAD_INTERVALS_DONE = _value;
    _value call GRAD_tracking_fnc_showIntervalWarning;

}] call CBA_fnc_addEventhandler;
