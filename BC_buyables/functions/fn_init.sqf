moneyBlufor = ["BLUFOR_MONEY", 3000] call BIS_fnc_getParamValue;
moneyOpfor = ["OPFOR_MONEY", 2000] call BIS_fnc_getParamValue;

publicVariable "moneyBlufor";
publicVariable "moneyOpfor";

{
    private _potentToBuy = [_x] call BC_setup_fnc_getHighestRankOfSide;
    _potentToBuy setVariable ["BC_potentToBuy", true, true];
    [_potentToBuy, _x] remoteExec ["GRAD_buyables_fnc_setPlayerPotentToBuy", _potentToBuy];
} forEach [west, east];