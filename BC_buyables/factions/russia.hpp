//a different set of buyables
class Russia {
    side = "Opfor";
    loadout = "russia";
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

        class Christmas_Sleigh_Red_GE {
            condition = "true";
            vehicleInit = "[[],[]]";
            code = "[(_this select 0)] call BC_buyables_fnc_configureOpforStartVehicle;";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class Truck_02_covered_F_Christmas {
            displayName = "Christmas Truck";
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

        class B_MRAP_F_Christmas {
            displayName = "Christmas MRAP";
            description = "Fast & Agile";
            price = 10;
            stock = 2;
            wheelCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[[],[]]";
        };


        

    };


    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 40;

        
        class Sparken_F {
            displayName = "Kick Sleigh";
            description = "Sneaky sleigh.";
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[[],[]]";
        };
    };

    class Armor {
        displayName = "Armor";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class Sparken_F {
            displayName = "Kick Sleigh";
            description = "Sneaky sleigh.";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "true";
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
            description = "1 KORD MG, Sandbag-Fortificatons and 2 Axes for cutting vegetation in Radio Truck.";
            stock = 1;
            code = "diag_log str (_this);private _mg = 'rhs_KORD_high_VDV' createVehicle [0,0,0];_mg attachTo [(_this select 1), [0,0,0]];[_mg, (_this select 1)] call ace_cargo_fnc_loadItem; (_this select 1) addItemCargoGlobal ['grad_axe', 2]; [(_this select 1), 'Land_CzechHedgehog_01_new_F', 9] call grad_fortifications_fnc_addFort; [(_this select 1), 'Land_BagFence_Long_F', 9] call grad_fortifications_fnc_addFort;";
            spawnEmpty = 1;
        };

        class Land_WeldingTrolley_01_F {
            kindOf = "Special";
            displayName = "Radio Truck Armor";
            description = "Selfmade armor for radio truck to protect its tires against small arms fire.";
            stock = 2;
            code = "diag_log str (_this); [(_this select 1)] call BC_buymenu_fnc_applyTruckArmor;";
        };
    };
};