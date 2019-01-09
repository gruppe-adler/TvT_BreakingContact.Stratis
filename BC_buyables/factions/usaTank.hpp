//a different set of buyables
class USATank {
    side = "Blufor";
    loadout = "usa";
    mode = "destroy";
    
    // needs to be in every faction
    class StartVehicle {
        deployAction = "";
        retractAction = "";
        condition = "false";
        terminalPositionOffset = [0.3,-2.85,0.7];
        terminalVectorDirAndUp = [[0,1,0.3],[0,0,0.7]];
        driverGps = "true";
        crewHelmet = "";
        disableTIEquipment = "true";

        class rhsusf_m1a2sep1wd_usarmy {
            condition = "true";
            code = "[_this] call BC_buyables_fnc_configureBluforStartVehicle;";
        };
    };

    class Light {
        displayName = "Light";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 0;
        driverGps = "true";
        crewHelmet = "";
        disableTIEquipment = "true";

        class RHS_M2A3_wd {
            displayName = "M2A3";
            description = "";
            price = 10;
            stock = 1;
            itemCargo = "";
            code = "(_this select 2) addWeaponCargoGlobal ['rhs_weap_m72a7', 3];";
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
        minPlayerCount = 10;
        driverGps = "true";
        crewHelmet = "";
        disableTIEquipment = "true";

        class rhsusf_m1a1aimwd_usarmy {
            displayName = "M1A1";
            description = "";
            price = 10;
            stock = 2;
            code = "(_this select 2) addWeaponCargoGlobal ['rhs_weap_m72a7', 3];";
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
        maxBuyCount = 1;
        minPlayerCount = 20;
        driverGps = "true";
        crewHelmet = "";
        disableTIEquipment = "true";

        class rhsusf_m966_w {
            displayName = "HMMWV-TOW";
            description = "";
            code = "(_this select 2) addWeaponCargoGlobal ['rhs_weap_m72a7', 3];";
            stock = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[[standard,1], [hide_snorkel,1,hide_CIP,0,hide_BFT,0,hide_Antenna,0,hide_A2_Parts,0,Hide_A2Bumper,1,Hide_Brushguard,1]]";
        };
    };
};