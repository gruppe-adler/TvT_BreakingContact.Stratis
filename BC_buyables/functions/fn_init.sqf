if (!isServer) exitWith {};
    
{
    private _potentToBuy = [_x] call BC_setup_fnc_getHighestRankOfSide;
    _potentToBuy setVariable ["BC_potentToBuy", true, true];
    [_potentToBuy, _x] remoteExec ["BC_buyables_fnc_setPlayerPotentToBuy", _potentToBuy];
} forEach [west, east];