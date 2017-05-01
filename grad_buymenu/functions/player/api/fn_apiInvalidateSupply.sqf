params ["_supplyVarName"];

diag_log format ["invalidating supply locally"];

if ((player getVariable 'GRAD_buymenu_supplies_name') == _supplyVarName) then {
    [] call GRAD_buymenu_fnc_refreshGUI;
};