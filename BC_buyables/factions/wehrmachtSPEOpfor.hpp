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
            displayName = "Flask 38";
            description = "20mm Gun on Truck";
            price = 10;
            stock = 2;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
            code = "[(_this select 0), ['SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38']] call BC_ww2_fnc_removeMagazine;";
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
            code = "[(_this select 0), ['SPE_40x_PzGr39_Pak40_AP','SPE_10x_PzGr40_Pak40_APCR','SPE_50x_SprGr34_Pak40_HE']] call BC_ww2_fnc_removeMagazine;";
        };

        class SPE_FlaK_36 {
            displayName = "Flak 36";
            description = "8,8cm FLAK";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
            code = "[(_this select 0), ['SPE_30x_PzGr39_FLAK36_AP','SPE_21x_SprGr_FLAK36_HE']] call BC_ww2_fnc_removeMagazine;";
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
            code = "[(_this select 0), ['SPE_50x_Shell_50L42_PzGr_AP','SPE_34x_Shell_50L42_SprGr38_HE']] call BC_ww2_fnc_removeMagazine;";
        };

        class SPE_PzKpfwIII_N {
            displayName = "Panzerkampfwagen III Ausf. N";
            description = "Tank with short canon";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
            code = "[(_this select 0), ['SPE_12x_75mm_K51_HLGr38c_HEAT','SPE_23x_75mm_K51_SprGr34_HE']] call BC_ww2_fnc_removeMagazine;";
        };
    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 2;

        class SPE_MG34_Lafette_low_Deployed {
            kindOf = "Special";
            displayName = "Defense Pack";
            description = "1 MG34, Sandbag-Fortificatons, Hedghogs and 2 Axes for cutting vegetation in Radio Truck.";
            stock = 1;
            code = "private _mg = 'SPE_MG34_Lafette_low_Deployed' createVehicle [0,0,0];_mg attachTo [(_this select 1), [0,0,0]];[_mg, (_this select 1)] call ace_cargo_fnc_loadItem; (_this select 1) addItemCargoGlobal ['grad_axe', 2]; [(_this select 1), 'Land_CzechHedgehog_01_new_F', 9] call grad_fortifications_fnc_addFort; [(_this select 1), 'Land_BagFence_Long_F', 9] call grad_fortifications_fnc_addFort;";
            spawnEmpty = 1;
        };
    };
};