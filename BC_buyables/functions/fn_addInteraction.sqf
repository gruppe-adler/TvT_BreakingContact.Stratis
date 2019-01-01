if (!hasInterface) exitWith {};

diag_log "added CBA eh";

["startVehicle", { 

        params ["_startVehicle", "_cone", "_side"];

        if (_side == west) then {
            [_startVehicle,
            "AmericanStuff",
            _cone,
            "Vehicle Supply",
            "Buy Vehicles",
            {side player == WEST}
            ] call BC_buymenu_fnc_addInteraction;

            diag_log "added BC_buymenu_fnc_addInteraction";
        } else {
            [_startVehicle,
            "RussianStuff",
            _cone,
            "Vehicle Supply",
            "Buy Vehicles",
            {side player == EAST}
            ] call BC_buymenu_fnc_addInteraction;

            diag_log "added BC_buymenu_fnc_addInteraction";
        };

    }] call CBA_fnc_addEventHandler;