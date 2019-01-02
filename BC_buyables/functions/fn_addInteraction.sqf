if (!hasInterface) exitWith {};

["startVehicle", { 

        params ["_startVehicle", "_cone", "_side"];

        BUYABLES_OPFOR_INDEX = ["BUYABLES_OPFOR", -1] call BIS_fnc_getParamValue;
        BUYABLES_BLUFOR_INDEX = ["BUYABLES_BLUFOR", -1] call BIS_fnc_getParamValue;

        private _buyablesOpfor = missionConfigFile >> "CfgGradBuymenu" >> (BUYABLES_OPFOR_VALUES select BUYABLES_OPFOR_INDEX);
        private _buyablesBlufor = missionConfigFile >> "CfgGradBuymenu" >> (BUYABLES_BLUFOR select BUYABLES_BLUFOR_INDEX);

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