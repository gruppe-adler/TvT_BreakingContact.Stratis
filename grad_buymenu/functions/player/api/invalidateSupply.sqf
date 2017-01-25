fnc_api_invalidateSupply = {
    _supplyVarName = _this select 0;
    _supplySelector = _this select 1;

    if ((player getVariable 'GRAD_buymenu_supplies_name') == _supplyVarName) then {
        call fnc_refreshGUI;
    };
};
