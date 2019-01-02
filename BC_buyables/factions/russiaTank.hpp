//a different set of buyables
class RussiaTank {
    side = "Opfor";
    mode = "destroy";

    // needs to be in every faction
    class StartVehicle {
        deployAction = "";
        retractAction = "";
        condition = "false";
        terminalPositionOffset = [0.3,-2.85,0.7];
        terminalVectorDirAndUp = [[0,1,0.3],[0,0,0.7]];

        class rhs_sprut_vdv {
            condition = "true";
            code = "(_this select 0) disableTIEquipment true;";
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
            code = "(_this select 0) addItemCargoGlobal ['ItemGPS',1];['AddCargoByClass', ['ACE_track', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;(_this select 0) setVariable ['(_this select 0) ace_vehiclelock_lockSide', east, true]; (_this select 0) disableTIEquipment true;";
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['standard',1], ['crate_l1_unhide',1,'crate_l2_unhide',1,'crate_l3_unhide',1,'crate_r1_unhide',1,'crate_r2_unhide',1,'crate_r3_unhide',1,'wood_1_unhide',1,'maljutka_hide_source',1,'cargoHandler1',0]]";
        };

        class rhs_bmp2k_vmf {
            displayName = "BMP2-K";
            description = "";
            price = 10;
            stock = 7;
            code = "(_this select 0) addItemCargoGlobal ['ItemGPS',1];['AddCargoByClass', ['ACE_track', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;(_this select 0) setVariable ['(_this select 0) ace_vehiclelock_lockSide', east, true]; (_this select 0) disableTIEquipment true;";
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['standard',1], ['crate_l1_unhide',1,'crate_l2_unhide',1,'crate_l3_unhide',1,'crate_r1_unhide',1,'crate_r2_unhide',1,'crate_r3_unhide',1,'wood_1_unhide',1,'maljutka_hide_source',1,'cargoHandler1',0]]";
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
            code = "(_this select 0) addItemCargoGlobal ['ItemGPS',1];['AddCargoByClass', ['ACE_track', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;(_this select 0) setVariable ['(_this select 0) ace_vehiclelock_lockSide', east, true]; (_this select 0) disableTIEquipment true;";
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[[], ['kshield_unhide',0,'kdeck_unhide',0,'sideskirt_unhide',0,'fbskirt_unhide',0,'ftskirt_unhide',1,'log_unhide',1,'snorkel_unhide',0]]";
        };

        class rhs_t80bk {
            displayName = "T-80BK";
            description = "";
            price = 10;
            stock = 7;
            code = "(_this select 0) addItemCargoGlobal ['ItemGPS',1];['AddCargoByClass', ['ACE_track', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;(_this select 0) setVariable ['(_this select 0) ace_vehiclelock_lockSide', east, true]; (_this select 0) disableTIEquipment true;";
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[[], ['kshield_unhide',0,'kdeck_unhide',0,'sideskirt_unhide',0,'fbskirt_unhide',0,'ftskirt_unhide',0,'log_unhide',1,'snorkel_unhide',0]]";
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
            code = "['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;(_this select 0) addItemCargoGlobal ['rhs_tsh4',3];(_this select 0) addItemCargoGlobal ['ItemGPS',1];(_this select 0) setVariable ['(_this select 0) ace_vehiclelock_lockSide', east, true]; (_this select 0) disableTIEquipment true;";
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['olive', 1], ['driverViewHatch',0,'commanderViewHatch',0,'hatchCommander',1]]";
        };
    };
};