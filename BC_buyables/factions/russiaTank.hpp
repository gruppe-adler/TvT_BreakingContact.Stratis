//a different set of buyables
class RussiaTank {
    side = "Opfor";
    loadout = "russia";
    mode = "destroy";


    // needs to be in every faction
    class StartVehicle {
        deployAction = "";
        retractAction = "";
        condition = "false";
        driverGps = "true";
        crewHelmet = "rhs_tsh4";
        disableTIEquipment = "true";
        canMoveDuringTransmission = "true";

        class gm_gc_army_t55a {
            displayName = "T-55A";
            description = "";
            price = 10;
            stock = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['gm_gc_oli',1], ['camoNet_01_unhide',0]]";
            crewHelmet = "gm_gc_army_headgear_crewhat_80_blk";
            terminalPositionOffset = "[0.3,-2.85,0.7]";
            terminalVectorDirAndUp = "[[0,1,0.3],[0,0,0.7]]";
            antennaOffset = "[0,-3.2,-0.1]";
            code = "[(_this select 0)] call BC_buyables_fnc_configureOpforStartVehicle; (_this select 0) addWeaponCargoGlobal ['rhs_weap_rpg26', 12];";
            canMoveDuringTransmission = "true";
        };
    };

    class Light {
        displayName = "Light";
        kindOf = "Vehicles";
        maxBuyCount = 3;
        minPlayerCount = 0;
        driverGps = "true";
        crewHelmet = "rhs_tsh4";
        disableTIEquipment = "true";

        class gm_gc_army_bmp1sp2_oli {
            displayName = "BMP1-D";
            description = "Carries more soldiers than T-55A but is less protected.";
            price = 10;
            stock = 3;
            spawnEmpty = 1;
            condition = "true";
            code = "(_this select 0) addWeaponCargoGlobal ['rhs_weap_rpg26', 6];";
            itemCargo = "";
            magazineCargo = "[['HandGrenade', 5]]";
            trackCargo = 2;
            crewHelmet = "gm_gc_army_headgear_crewhat_80_blk";
            vehicleInit = "[['gm_gc_oli',1],['spareTracks_1_1_unhide',0,'spareTracks_1_2_unhide',0,'spareTracks_2_1_unhide',0,'wheelChock_1_1_unhide',0,'wheelChock_1_2_unhide',0,'woodenBeam_01_unhide',0,'tarpRoll_01_unhide',0]]";
       };
    };


    class Heavy {
        displayName = "Heavy";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 0;
        driverGps = "true";
        crewHelmet = "rhs_tsh4";
        disableTIEquipment = "true";

        class gm_gc_army_t55a_oli {
            displayName = "T-55A";
            description = "";
            price = 10;
            stock = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['gm_gc_oli',1], ['camoNet_01_unhide',0]]";
            crewHelmet = "gm_gc_army_headgear_crewhat_80_blk";
            antennaOffset = "[0,-3.2,-0.1]";
            code = "(_this select 0) addWeaponCargoGlobal ['rhs_weap_rpg26', 6];";
        };
    };


    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 0;
        driverGps = "true";
        crewHelmet = "rhs_tsh4";
        disableTIEquipment = "true";

        class rhsgref_BRDM2_ATGM_msv {
            displayName = "BRDM-AT";
            description = "";
            stock = 2;
            code = "(_this select 0) addWeaponCargoGlobal ['rhs_weap_rpg26', 6];";
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['olive', 1], ['driverViewHatch',0,'commanderViewHatch',0,'hatchCommander',1]]";
        };
    };
};
