//a different set of buyables
class mudscha {
    side = "Opfor";
    loadout = "mudscha";
    mode = "conquer";
    
    // needs to be in every faction
    class StartVehicle {
        deployAction = "";
        retractAction = "";
        condition = "false";
        driverGps = "false";
        disableTIEquipment = "true";
        terminalPositionOffset = "[0.3,-2.85,0.7]";
        terminalVectorDirAndUp = "[[0,1,0.3],[0,0,0.7]]";


        class gm_gc_army_ural44202_ols {
            condition = "true";
            vehicleInit = "[[],[]]";
            code = "[(_this select 0)] call BC_buyables_fnc_configureOpforStartVehicle; (_this select 0) setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.2,0.1,0.1,1)'];";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class RDS_Lada_Civ_03 {
            displayName = "Lada";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[['gm_gc_oli',1], ['cover_hide_unhide',0,'winch_unhide',0,'roofRack_unhide',0,'camonet_01_unhide',0,'coldWeatherKit_unhide',0,'fuelcan_1_1_unhide',0,'fuelcan_1_2_unhide',0,'lightGuard_unhide',1,'toolbox_unhide',1,'tools_unhide',1]]";
        };

        class RDS_JAWA353_Civ_01 {
            displayName = "Motorcycle";
            description = "Faster and smaller footprint but cant transport as many.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[['gm_gc_oli',1], ['sirenLights_01_unhide',0]]";
        };
    };


    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 0;

        class LOP_ISTS_OPF_T34 {
            displayName = "T-34";
            description = "Armored but fucking bad tank.";
            price = 10;
            stock = 3;
            wheelCargo = 2;
            spawnEmpty = 1;
            condition = "true";
        };

    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 1;

        class Land_BagFence_Round_F {
            kindOf = "Special";
            displayName = "Defense Pack";
            description = "Sandbag-Fortificatons and 2 Axes for cutting vegetation in Radio Truck.";
            stock = 1;
            code = "diag_log str (_this); (_this select 1) addItemCargoGlobal ['grad_axe', 2]; [(_this select 1), 'land_gm_tanktrap_01', 9] call grad_fortifications_fnc_addFort; [(_this select 1), 'land_gm_sandbags_01_low_01', 9] call grad_fortifications_fnc_addFort; [(_this select 1), 'land_gm_sandbags_01_round_01', 3] call grad_fortifications_fnc_addFort;";
            spawnEmpty = 1;
        };
    };
};