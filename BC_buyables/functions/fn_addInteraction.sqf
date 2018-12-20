if (!hasInterface) exitWith {};

diag_log "added CBA eh";

["startVehicle", { 

        params ["_startVehicle", "_cone", "_side"];

        if (_side == west) then {
            [_startVehicle,
            "AmericanStuff",
            _startVehicle,
            getPos _cone,
            "Vehicle Supply",
            "Buy Vehicles",
            {side player == WEST}
            ] call grad_lbm_fnc_addInteraction;

            diag_log "added CBA lbm addInteraction";
        } else {
            [_startVehicle,
            "RussianStuff",
            _startVehicle,
            getPos _cone,
            "Vehicle Supply",
            "Buy Vehicles",
            {side player == EAST}
            ] call grad_lbm_fnc_addInteraction;

            diag_log "added CBA lbm addInteraction";
        };

    }] call CBA_fnc_addEventHandler;