params ["_unit", "_side"];

diag_log "executing setplayerpotenttobuy";

private _money = if (_side == west) then {
    ["BLUFOR_MONEY", 3000] call BIS_fnc_getParamValue
} else {
    ["OPFOR_MONEY", 2000] call BIS_fnc_getParamValue
};

[_unit, _money] call grad_lbm_fnc_setFunds;