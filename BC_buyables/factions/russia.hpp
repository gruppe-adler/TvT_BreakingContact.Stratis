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

        class rhs_gaz66_r142_vdv {
            condition = "BC_IS_WOODLAND";
            terminalPositionOffset = "[0.3,-2.85,0.7]";
            terminalVectorDirAndUp = "[[0,1,0.3],[0,0,0.7]]";
            vehicleInit = "[['rhs_sand',1], ['mast_handler',0,'cover_hide',0,'spare_hide',0,'bench_hide',0,'rear_numplate_hide',1,'light_hide',1]]";
        };

        class rhs_gaz66_r142_vv {
            condition = "!BC_IS_WOODLAND";
            terminalPositionOffset = "[0.3,-2.85,0.7]";
            terminalVectorDirAndUp = "[[0,1,0.3],[0,0,0.7]]";
            vehicleInit = "[['standard',1], ['mast_handler',0,'cover_hide',0,'spare_hide',0,'bench_hide',0,'rear_numplate_hide',1,'light_hide',1]]";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class RHS_Ural_MSV_01 {
            displayName = "Ural";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['standard',1], ['light_hide',1]]";
        };

        class RHS_Ural_VV_01: RHS_Ural_MSV_01 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['rhs_sand',1], ['light_hide',1]]";
        };

        class rhs_uaz_open_MSV_01 {
            displayName = "UAZ";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[], ['cabinlights_hide',0,'light_hide',1]]";
        };

        class rhs_uaz_open_vdv: rhs_uaz_open_MSV_01 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['Camo3',1], ['cabinlights_hide',0,'light_hide',1]]";
        };
    };


    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class rhs_tigr_m_vdv {
            displayName = "Tigr-M";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class rhs_tigr_m_3camo_vdv: rhs_tigr_m_vdv {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class rhsgref_nat_uaz_dshkm {
            displayName = "UAZ Dshkm";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[], ['cabinlights_hide',0,'light_hide',1]]";
        };

        class rhsgref_cdf_b_reg_uaz_dshkm: rhsgref_nat_uaz_dshkm {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['Camo3',1], ['cabinlights_hide',0,'light_hide',1]]";
        };


        class rhsgref_ins_uaz_spg9 {
            displayName = "UAZ SPG9";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[], ['cabinlights_hide',0,'light_hide',1]]";
        };

        class rhsgref_nat_uaz_spg9: rhsgref_ins_uaz_spg9 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['Camo3',1], ['cabinlights_hide',0,'light_hide',1]]";
        };

    };


    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 40;

        class rhsgref_BRDM2_HQ_msv {
            displayName = "BRDM-HQ";
            description = "The workhorse of your army.";
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['olive', 1], ['driverViewHatch',0,'commanderViewHatch',0,'hatchCommander',1]]";
        };

        class rhsgref_BRDM2_HQ_vdv: rhsgref_BRDM2_HQ_msv {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['3tone', 1], ['driverViewHatch',0,'commanderViewHatch',0,'hatchCommander',1]]";
        };

        class rhsgref_BRDM2_ATGM_msv {
            displayName = "BRDM-AT";
            description = "The workhorse of your army.";
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['olive', 1], ['driverViewHatch',0,'commanderViewHatch',0,'hatchCommander',1]]";
        };

        class rhsgref_BRDM2_ATGM_vdv: rhsgref_BRDM2_ATGM_msv {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['3tone', 1], ['driverViewHatch',0,'commanderViewHatch',0,'hatchCommander',1]]";
        };

        class rhsgref_BRDM2_msv {
            displayName = "BRDM-2";
            description = "The workhorse of your army.";
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['olive', 1], ['driverViewHatch',0,'commanderViewHatch',0,'hatchCommander',1]]";
        };

        class rhsgref_BRDM2_vdv: rhsgref_BRDM2_msv {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['3tone', 1], ['driverViewHatch',0,'commanderViewHatch',0,'hatchCommander',1]]";
    
        };
    };

    class Armor {
        displayName = "Armor";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class rhs_t80bvk {
            displayName = "T80-BVK";
            description = "The workhorse of your army.";
            stock = 1;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['standard',1], ['hide_com_shield',1,'sightElevationAPFSDS',0]]";
        };

        class rhs_t80bk: rhs_t80bvk {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['rhs_sand',1], ['hide_com_shield',1,'sightElevationAPFSDS',0]]";
        };

        class rhs_bmp1d_msv {
            displayName = "BMP1-D";
            description = "The workhorse of your army.";
            stock = 1;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['standard',1], ['crate_l1_unhide',1,'crate_l2_unhide',1,'crate_l3_unhide',1,'crate_r1_unhide',1,'crate_r2_unhide',1,'crate_r3_unhide',1,'wood_1_unhide',1,'maljutka_hide_source',1,'cargoHandler1',0]]";
        };

        class rhs_bmp1d_vdv: rhs_bmp1d_msv {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['rhs_sand',1], ['crate_l1_unhide',1,'crate_l2_unhide',1,'crate_l3_unhide',1,'crate_r1_unhide',1,'crate_r2_unhide',1,'crate_r3_unhide',1,'wood_1_unhide',1,'maljutka_hide_source',1,'cargoHandler1',0]]";
        };
    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 2;

        class Land_DataTerminal_01_F {
            displayName = "Radio Relay Terminal";
            description = "Replaces radio truck internal module.\nIs attached to the radio truck but can be detached.\nSends with 50-100% strength depending on distance to radio truck.";
            stock = 1;
            code = "diag_log str (_this); private _terminal = missionNameSpace getVariable ['GRAD_tracking_terminalObj', objNull]; [_terminal, (_this select 0)] call GRAD_tracking_fnc_terminalAttachToVeh;";
        };

        class Land_BagFence_Round_F {
            displayName = "Defense Pack";
            description = "One KORD MG and Fortifications in Radio Truck.";
            stock = 1;
            code = "diag_log str (_this);private _mg = 'rhs_KORD_high_VDV' createVehicle [0,0,0];_mg attachTo [(_this select 0), [0,0,0]];[_mg, (_this select 0)] call ace_cargo_fnc_loadItem;";
            spawnEmpty = 1;
        };

        class Land_WeldingTrolley_01_F {
            displayName = "Radio Truck Armor";
            description = "Selfmade armor for radio truck to protect its tires against small arms fire.";
            stock = 2;
            code = "diag_log str (_this); [(_this select 0)] call BC_buymenu_fnc_applyTruckArmor;";
        };
    };
};