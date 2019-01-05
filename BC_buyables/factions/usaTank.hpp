//a different set of buyables
class USATank {
    side = "Blufor";
    loadout = "usa";
    mode = "destroy";
    driverGps = "true";
    crewHelmet = "";
    disableTIEquipment = "true";
    
    // needs to be in every faction
    class StartVehicle {
        deployAction = "";
        retractAction = "";
        condition = "false";
        terminalPositionOffset = [0.3,-2.85,0.7];
        terminalVectorDirAndUp = [[0,1,0.3],[0,0,0.7]];

        class rhsusf_m1a2sep1wd_usarmy {
            condition = "true";
            code = "";
        };
    };

    class Light {
        displayName = "Light";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class RHS_M2A3_wd {
            displayName = "M2A3";
            description = "";
            price = 10;
            stock = 7;
            itemCargo = "";
            magazineCargo = "";
            trackCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['standard',1],['IFF_Panels_Hide',1,'Select_TOW',1,'Select_Stinger',0]]";
        };

        class RHS_M2A2_wd {
            displayName = "M2A2";
            description = "";
            price = 10;
            stock = 7;
            itemCargo = "";
            magazineCargo = "";
            trackCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['standard',1],['IFF_Panels_Hide',1,'Select_TOW',1,'Select_Stinger',0]]";
        };


    };


    class Heavy {
        displayName = "Heavy";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class rhsusf_m1a1aimwd_usarmy {
            displayName = "M1A1";
            description = "";
            price = 10;
            stock = 2;
            itemCargo = "";
            magazineCargo = "";
            trackCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['woodland',1],['IFF_Panels_Hide',1,'Miles_Hide',1]]";
        };

        class rhsusf_m1a1aim_tuski_wd {
            displayName = "M1A1 Tusk I";
            description = "";
            price = 10;
            stock = 7;
            itemCargo = "";
            magazineCargo = "";
            trackCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['woodland',1],['IFF_Panels_Hide',1,'Miles_Hide',1]]";
        };
    };


    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class rhsusf_m966_w {
            displayName = "HMMWV-TOW";
            description = "";
            stock = 7;
            code = "";
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[[standard,1], [hide_snorkel,1,hide_CIP,0,hide_BFT,0,hide_Antenna,0,hide_A2_Parts,0,Hide_A2Bumper,1,Hide_Brushguard,1]]";
        };
    };
};