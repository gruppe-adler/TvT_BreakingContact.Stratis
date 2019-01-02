if (!hasInterface) exitWith {};

["startVehicle", { 

        params ["_startVehicle", "_cone", "_side"];

        BUYABLES_OPFOR_INDEX = ["BUYABLES_OPFOR", -1] call BIS_fnc_getParamValue;
        BUYABLES_BLUFOR_INDEX = ["BUYABLES_BLUFOR", -1] call BIS_fnc_getParamValue;

        private _factionsBlufor = "getText (_x >> 'side') == 'Blufor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
        private _buyablesBlufor = configName (_factionsBlufor select BUYABLES_BLUFOR_INDEX);

        private _factionsOpfor = "getText (_x >> 'side') == 'Opfor'" configClasses (missionConfigFile >> "CfgGradBuymenu");
        private _buyablesOpfor = configName (_factionsOpfor select BUYABLES_OPFOR_INDEX);
        
        diag_log format ["_factionsOpfor %1", _factionsOpfor];
        diag_log format ["_buyablesOpfor %1", _buyablesOpfor];

        if (_side == west) then {
            [_startVehicle,
            _buyablesBlufor,
            _cone,
            "Vehicle Supply",
            "Buy Vehicles",
            {side player == WEST}
            ] call BC_buymenu_fnc_addInteraction;

            diag_log "added BC_buymenu_fnc_addInteraction";
        } else {
            [_startVehicle,
            _buyablesOpfor,
            _cone,
            "Vehicle Supply",
            "Buy Vehicles",
            {side player == EAST}
            ] call BC_buymenu_fnc_addInteraction;

            diag_log "added BC_buymenu_fnc_addInteraction";
        };

}] call CBA_fnc_addEventHandler;