//a different set of buyables
class RussiaTank {
    side = "Opfor";
    mode = "destroy";
    driverGps = "true";
    crewHelmet = "rhs_tsh4";
    disableTIEquipment = "true";

    // needs to be in every faction
    class StartVehicle {
        deployAction = "";
        retractAction = "";
        condition = "false";
        terminalPositionOffset = [0.3,-2.85,0.7];
        terminalVectorDirAndUp = [[0,1,0.3],[0,0,0.7]];

        class rhs_sprut_vdv {
            condition = "true";
            itemCargo = "[['itemGPS', 3], ['itemMap',3]]";
            magazineCargo = "[['']]";
            trackCargo = 2;
        };
    };

    class Light {
        displayName = "Light";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class rhs_bmp2d_vmf {
            displayName = "BMP2-D";
            description = "";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            condition = "true";
            itemCargo = "[['itemGPS', 3], ['itemMap',3]]";
            magazineCargo = "[['HandGrenade', 5]]";
            trackCargo = 2;
            removeMagazines = "['rhs_mag_og15v_20', [0]]";
            vehicleInit = "[['standard',1], ['crate_l1_unhide',1,'crate_l2_unhide',1,'crate_l3_unhide',1,'crate_r1_unhide',1,'crate_r2_unhide',1,'crate_r3_unhide',1,'wood_1_unhide',1,'maljutka_hide_source',1,'cargoHandler1',0]]";
        };

        class rhs_bmp2k_vmf: rhs_bmp2d_vmf {
            displayName = "BMP2-K";
        };
    };


    class Heavy {
        displayName = "Heavy";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class rhs_t80bvk {
            displayName = "T-80BVK";
            description = "";
            price = 10;
            stock = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[[], ['kshield_unhide',0,'kdeck_unhide',0,'sideskirt_unhide',0,'fbskirt_unhide',0,'ftskirt_unhide',1,'log_unhide',1,'snorkel_unhide',0]]";
            removeMagazines = "['rhs_mag_3of26_5', [0]]";
        };

        class rhs_t80bk: rhs_t80bvk {
            displayName = "T-80BK";    
        };
    };


    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class rhsgref_BRDM2_ATGM_msv {
            displayName = "BRDM-AT";
            description = "";
            stock = 7;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['olive', 1], ['driverViewHatch',0,'commanderViewHatch',0,'hatchCommander',1]]";
        };
    };
};