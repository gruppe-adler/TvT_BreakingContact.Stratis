//a different set of buyables
class usSPEOpfor {
    side = "Opfor";
    loadout = "usSPE";
    mode = "conquer";

    // needs to be in every faction
    class StartVehicle {
        deployAction = "";
        retractAction = "";
        condition = "false";
        driverGps = "true";
        crewHelmet = "rhs_tsh4";
        disableTIEquipment = "true";
        terminalPositionOffset = "[0.3,-2.85,0.7]";
        terminalVectorDirAndUp = "[[0,1,0.3],[0,0,0.7]]";

        class SPE_US_M3_Halftrack_Repair {
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
            code = "[(_this select 0)] call BC_buyables_fnc_configureOpforStartVehicle;";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class SPE_US_M3_Halftrack_Unarmed_Open {
            displayName = "M3 Unarmed";
            description = "Carries soldiers decently armored.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 4;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class UK3CB_CW_US_B_EARLY_Willys_Jeep_Open {
            displayName = "Willys Jeep";
            description = "Carries soldiers decently armored.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 4;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

    };

    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class SPE_US_M3_Halftrack {
            displayName = "M3 Halftrack";
            description = "";
            price = 10;
            stock = 2;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

    };

    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 40;
 
        class SPE_US_M16_Halftrack {
            displayName = "M16 Halftrack, AA";
            description = "";
            price = 10;
            stock = 1;
            spawnEmpty = 1;
            vehicleInit = "[[],[]]";
        };

        class SPE_57mm_M1 {
            displayName = "M1 AT Gun";
            description = "";
            price = 10;
            stock = 1;
            spawnEmpty = 1;
            vehicleInit = "[[],[]]";
        };
    };

    class Armor {
        displayName = "Armor";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

       class SPE_M18_Hellcat {
            displayName = "M18 Hellcat";
            description = "Tank hunter";
            stock = 1;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class SPE_M10 {
            displayName = "M10 Wolverine";
            description = "Tank hunter";
            stock = 1;
            spawnEmpty = 1;
            vehicleInit = "[[],[]]";
        };
    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 2;

        class SPE_M1919_M2 {
            kindOf = "Special";
            displayName = "Defense Pack";
            description = "1 M2 MG, Sandbag-Fortificatons and 2 Axes for cutting vegetation in Radio Truck.";
            stock = 1;
            code = "diag_log str (_this);private _mg = 'SPE_M1919_M2' createVehicle [0,0,0];_mg attachTo [(_this select 1), [0,0,0]];[_mg, (_this select 1)] call ace_cargo_fnc_loadItem; (_this select 1) addItemCargoGlobal ['grad_axe', 2]; [(_this select 1), 'Land_CzechHedgehog_01_new_F', 9] call grad_fortifications_fnc_addFort; [(_this select 1), 'Land_BagFence_Long_F', 9] call grad_fortifications_fnc_addFort;";
            spawnEmpty = 1;
        };

    };
};