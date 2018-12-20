//a different set of buyables
class RussianStuff {        
    class Vehicles {
        displayName = "Vehicles";
        kindOf = "Vehicles";

        class rhsgref_nat_ural {
            displayName = "Ural";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            code = "
                private _vehicle = (_this select 2);
                _vehicle addItemCargoGlobal ['ItemGPS',1];
                ['AddCargoByClass', ['ACE_wheel', _vehicle, 2], _vehicle] call CBA_fnc_targetEvent;
                ";
            spawnEmpty = true;
            condition = "!BC_IS_WOODLAND";
        };

        class rhsgref_nat_ural {
            displayName = "Ural";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            code = "
                private _vehicle = (_this select 2);
                _vehicle addItemCargoGlobal ['ItemGPS',1];
                ['AddCargoByClass', ['ACE_wheel', _vehicle, 2], _vehicle] call CBA_fnc_targetEvent;
                ";
            spawnEmpty = true;
            condition = "BC_IS_WOODLAND";
        };

        class rhsgref_BRDM2_HQ_b {
            displayName = "BRDM PKT";
            description = "A decent armored allround vehicle.";
            price = 10;
            stock = 7;
            code = "
                private _vehicle = (_this select 2);
                _vehicle addItemCargoGlobal ['ItemGPS',1];
                ['AddCargoByClass', ['ACE_wheel', _vehicle, 2], _vehicle] call CBA_fnc_targetEvent;
                ";
            spawnEmpty = true;
            condition = "!BC_IS_WOODLAND";
        };
    };
};