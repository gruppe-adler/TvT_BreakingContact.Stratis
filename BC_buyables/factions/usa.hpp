//a different set of buyables
class USA {
    side = "Blufor";
    loadout = "usa";
    mode = "conquer";
    driverGps = "true";
    crewHelmet = "";
    disableTIEquipment = "true";

    // needs to be in every faction
    class StartVehicle {
        type = "rhsusf_m998_w_4dr";
        condition = "false";

        class rhsusf_m998_w_4dr {
            condition = "BC_IS_WOODLAND";
            code = "[(_this select 0)] call BC_buyables_fnc_configureBluforStartVehicle;";
        };

        class rhsusf_m998_d_4dr {
            condition = "!BC_IS_WOODLAND";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class rhsusf_M1083A1P2_WD_fmtv_usarmy {
            displayName = "FMTV M1083";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['rhs_woodland',1],['hide_cover',0,'hide_spare',0,'hide_scaffold',0,'hide_bench',0]]";
        };

        class rhsusf_M1083A1P2_D_fmtv_usarmy: rhsusf_M1083A1P2_WD_fmtv_usarmy {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['rhs_desert',1],['hide_cover',0,'hide_spare',0,'hide_scaffold',0,'hide_bench',0]]";
        };

        class rhsusf_mrzr4_d {
            displayName = "MRZR 4";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            condition = "true";
            code = "[(_this select 0), [['mud','mud_olive'] select BC_IS_WOODLAND,1], ['tailgateHide',0,'tailgate_open',0,'cage_fold',0]] call BIS_fnc_initVehicle;";
            vehicleInit = "[[],[]]";
        };
    };


    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class RHS_MELB_H6M {
            displayName = "OH-6M";
            description = "1 GPS\nNO Thermals\nNO Benches";
            price = 10;
            stock = 7;
            code = "(_this select 0) addItemCargoGlobal ['ACE_NVG_Wide',2];(_this select 0) addItemCargoGlobal ['ItemGPS',1];[(_this select 0)] call ace_fastroping_fnc_equipFRIES;_this disableTIEquipment true;";
            spawnEmpty = 1;
            vehicleInit = "[[],[]]";
        };

        class rhsusf_CGRCAT1A2_usmc_wd {
            displayName = "Cougar IMV";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['rhs_woodland',1],['DUKE_Hide',1]]";
        };

        class rhsusf_CGRCAT1A2_usmc_d: rhsusf_CGRCAT1A2_usmc_wd {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['rhs_desert',1],['DUKE_Hide',1]]";
        };


        class rhsusf_M1078A1R_SOV_M2_WD_fmtv_socom {
            displayName = "FMTV M2";
            description = "The workhorse of your army.";
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['rhs_woodland',1],['hide_spare',0]]";
        };

        class rhsusf_M1078A1R_SOV_M2_D_fmtv_socom: rhsusf_M1078A1R_SOV_M2_WD_fmtv_socom {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['rhs_desert',1],['hide_spare',0]]";
        };
        

    };


    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 40;

        class rhsusf_m1025_w_m2 {
            displayName = "HMMWV M2";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['standard',1],['hide_snorkel',1,'hide_CIP',1,'hide_BFT',0,'hide_Antenna',0,'hide_A2_Parts',0,'Hide_A2Bumper',0,'Hide_Brushguard',1]]";
        };

        class rhsusf_m1025_d_m2: rhsusf_m1025_w_m2 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['Desert',1],['hide_snorkel',1,'hide_CIP',1,'hide_BFT',0,'hide_Antenna',0,'hide_A2_Parts',0,'Hide_A2Bumper',0,'Hide_Brushguard',1]]";
        };

        class rhsusf_m113_usarmy_M2_90 {
            displayName = "M113 Alt";
            description = "The workhorse of your army.";
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "['standard',1],['IFF_Panels_Hide',1]";
        };

        class rhsgref_hidf_m113a3_mk19: rhsusf_m113_usarmy_M2_90 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "['Desert',1],['IFF_Panels_Hide',1]";
        };
    };

    class Heavy {
        displayName = "Heavy";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class rhsusf_m1045_w {
            displayName = "HMMWV TOW";
            description = "The workhorse of your army.";
            stock = 7;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "['standard',1], ['hide_snorkel',1,'hide_CIP',0,'hide_BFT',0,'hide_Antenna',0,'hide_A2_Parts',0,'Hide_A2Bumper',0,'Hide_Brushguard',1]";
        };

        class rhsusf_m1045_d: rhsusf_m1045_w {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "['Desert',1], ['hide_snorkel',1,'hide_CIP',0,'hide_BFT',0,'hide_Antenna',0,'hide_A2_Parts',0,'Hide_A2Bumper',0,'Hide_Brushguard',1]";
        };

        class RHS_UH60M2 {
            displayName = "UH-60M";
            description = "1 GPS\nFRIES equipped";
            stock = 7;
            code = "(_this select 0) addItemCargoGlobal ['ACE_NVG_Wide',2];(_this select 0) addItemCargoGlobal ['ItemGPS',1];[(_this select 0)] call ace_fastroping_fnc_equipFRIES;";
            spawnEmpty = 1;
            vehicleInit = "[['standard',1], ['crate_l1_unhide',1,'crate_l2_unhide',1,'crate_l3_unhide',1,'crate_r1_unhide',1,'crate_r2_unhide',1,'crate_r3_unhide',1,'wood_1_unhide',1,'maljutka_hide_source',1,'cargoHandler1',0]]";
        };
    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 2;

        class I_C_Boat_Transport_01_F {
            kindOf = "Special";
            displayName = "Boat + Diving Equipment inside * 4";
            description = "Get it in the Start Vehicle (ACE Interaction).";
            stock = 1;
            code = "(_this select 1) setVariable ['grad_carryBoatCargo', 1, true];[(_this select 1)] remoteExec ['BC_buymenu_fnc_addBoatInteraction', [0,-2] select isDedicated];";
            spawnEmpty = 1;
        };

        class rhsusf_explosive_m112 {
            kindOf = "Special";
            displayName = "Breaching Equipment";
            description = "Explosives and Wirecutter in Start Vehicle.";
            stock = 1;
            code = "(_this select 1) addItemCargoGlobal ['ACE_wirecutter',2];(_this select 1) addItemCargoGlobal ['ACE_Clacker',2];(_this select 1) addMagazineCargoGlobal ['rhsusf_m112_mag', 2];";
            spawnEmpty = 1;
        };

        class Land_JumpTarget_F {
            kindOf = "Special";
            displayName = "Hunt IR Equipment";
            description = "Hunt IR Equipment in Start Vehicle.";
            stock = 1;
            code = "(_this select 1) addItemCargoGlobal ['ACE_HuntIR_monitor',2];(_this select 1) addMagazineCargoGlobal ['ACE_HuntIR_M203',4];";
            spawnEmpty = 1;
        };
    };
};