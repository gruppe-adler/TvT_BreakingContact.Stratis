
if (hasInterface) then {
    ["startVehicle", { 

        params ["_startVehicle", "_cone", "_side"];

        if (_side == west) then {
            [_startVehicle,
            "AmericanStuff",
            _startVehicle,
            _cone,
            "Vehicle Supply",
            "Buy Vehicles",
            {side player == WEST}
            ] call grad_lbm_fnc_addInteraction;
        } else {
            [_startVehicle,
            "RussianStuff",
            _startVehicle,
            _cone,
            "Vehicle Supply",
            "Buy Vehicles",
            {side player == WEST}
            ] call grad_lbm_fnc_addInteraction;
        };

    }] call CBA_fnc_addEventHandler;
};