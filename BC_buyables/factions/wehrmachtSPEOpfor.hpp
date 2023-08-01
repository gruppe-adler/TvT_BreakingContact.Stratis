//a different set of buyables
class WehrmachtSPEOpfor {
    side = "Opfor";
    loadout = "wehrmachtSPE";
    mode = "conquer";
    
    // needs to be in every faction
    class StartVehicle {
        deployAction = "";
        retractAction = "";
        condition = "false";
        driverGps = "false";
        crewHelmet = "rhs_tsh4";
        disableTIEquipment = "true";
        terminalPositionOffset = "[0.3,-2.85,0.7]";
        terminalVectorDirAndUp = "[[0,1,0.3],[0,0,0.7]]";

        class SPE_OpelBlitz_Repair {
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

        class SPE_OpelBlitz {
            displayName = "Opel Blitz";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[[],[]]";
        };
    };

    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class SPE_SdKfz250_1 {
            displayName = "SdKfz 250/1";
            description = "The perfect commander limousine.";
            price = 10;
            stock = 2;
            wheelCargo = 2;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class SPE_OpelBlitz_Flak38 {
            displayName = "UAZ Dshkm";
            description = "Fast and a deadly gun against ground and air targets.";
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

       class SPE_Pak40 {
            displayName = "Pak 40";
            description = "Big gun Pak";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class SPE_FlaK_36 {
            displayName = "Flak 36";
            description = "8,8cm FLAK";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };
    };

    class Armor {
        displayName = "Armor";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class SPE_PzKpfwIII_J {
            displayName = "Panzerkampfwagen III Ausf. J";
            description = "Big gun Pak";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class SPE_PzKpfwIII_N {
            displayName = "Panzerkampfwagen III Ausf. N";
            description = "8,8cm FLAK";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };
    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 2;

        class Land_BagFence_Round_F {
            kindOf = "Special";
            displayName = "Defense Pack";
            description = "1 MG34, Sandbag-Fortificatons, Hedghogs and 2 Axes for cutting vegetation in Radio Truck.";
            stock = 1;
            code = "diag_log str (_this);private _mg = 'SPE_MG34_Lafette_low_Deployed' createVehicle [0,0,0];_mg attachTo [(_this select 1), [0,0,0]];[_mg, (_this select 1)] call ace_cargo_fnc_loadItem; (_this select 1) addItemCargoGlobal ['grad_axe', 2]; [(_this select 1), 'Land_CzechHedgehog_01_new_F', 9] call grad_fortifications_fnc_addFort; [(_this select 1), 'Land_BagFence_Long_F', 9] call grad_fortifications_fnc_addFort;";
            spawnEmpty = 1;
        };
    };
};