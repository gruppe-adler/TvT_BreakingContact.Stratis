if (!isServer) exitWith {};
    
{
    private _potentToBuy = [_x] call BC_setup_fnc_getHighestRankOfSide;
    _potentToBuy setVariable ["BC_potentToBuy", true, true];
    [_potentToBuy, _x] remoteExec ["BC_buyables_fnc_setPlayerPotentToBuy", _potentToBuy];
} forEach [west, east];

["startVehicle", { 

        params ["_startVehicle", "_cone", "_side"];

        BUYABLES_OPFOR_INDEX = ["BUYABLES_OPFOR", -1] call BIS_fnc_getParamValue;
        private _factionsOpfor = "getText (_x >> 'side') == 'Opfor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
        private _buyablesOpfor = configName (_factionsOpfor select BUYABLES_OPFOR_INDEX);
        
        private _conquerMode = ([((_factionsOpfor select BUYABLES_OPFOR_INDEX) >> "mode"), "text", "conquer"] call CBA_fnc_getConfigEntry) isEqualTo "conquer";

        if (!_conquerMode) then {
            CONQUER_MODE = false;
            publicVariable "CONQUER_MODE";
        } else {
            CONQUER_MODE = true;
            publicVariable "CONQUER_MODE";
        };
        
}] call CBA_fnc_addEventHandler;