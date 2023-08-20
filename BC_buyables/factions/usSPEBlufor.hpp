//a different set of buyables
class usSPEBlufor {
    side = "Blufor";
    loadout = "usSPE";
    mode = "conquer";
    driverGps = "false";
    crewHelmet = "";
    disableTIEquipment = "true";

    // needs to be in every faction
    class StartVehicle {
        type = "UK3CB_CW_US_B_EARLY_Willys_Jeep_Open";
        condition = "false";

        class UK3CB_CW_US_B_EARLY_Willys_Jeep_Open {
            condition = "BC_IS_WOODLAND";
            code = "[(_this select 0)] call BC_buyables_fnc_configureBluforStartVehicle;";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class SPE_US_M3_Halftrack_Unarmed_Open {
            displayName = "M3 Unarmed";
            description = "Carries soldiers decently armored.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 4;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class UK3CB_CW_US_B_EARLY_Willys_Jeep_Open {
            displayName = "Willys Jeep";
            description = "Carries soldiers decently armored.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 4;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };
    };

    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class SPE_US_M3_Halftrack {
            displayName = "M3 Halftrack";
            description = "";
            price = 10;
            stock = 2;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class SPE_P47 {
            displayName = "P47 Mustang";
            description = "8x 50 cal";
            price = 10;
            stock = 1;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
            code = "deleteVehicle (_this select 0); ['SPE_P47', false, ['SPE_M8_Launcher_P47','SPE_US_Timed_Short_500lb_Bomb_Mount'], ['SPE_3Rnd_M8_P47','SPE_3Rnd_M8_P47','SPE_1Rnd_US_Timed_Short_500lb','SPE_1Rnd_US_Timed_Short_500lb','SPE_1Rnd_US_Timed_Short_500lb']] remoteExecCall ['BC_ww2_fnc_openGui', blufor_teamlead, false];"
        };
    };

    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 40;

        class SPE_US_M16_Halftrack {
            displayName = "M16 Halftrack, AA";
            description = "";
            price = 10;
            stock = 1;
            spawnEmpty = 1;
            vehicleInit = "[[],[]]";
        };
    };

    class Heavy {
        displayName = "Heavy";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class SPE_M18_Hellcat {
            displayName = "M18 Hellcat";
            description = "Tank hunter";
            stock = 1;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
            code = "[(_this select 0), ['SPE_20x_76mm_M1_HC_M62_APCBC','SPE_15x_76mm_M1_HC_M42_HE']] call BC_ww2_fnc_removeMagazine;";
        };

        class SPE_M10 {
            displayName = "M10 Wolverine";
            description = "Tank hunter";
            stock = 1;
            spawnEmpty = 1;
            vehicleInit = "[[],[]]";
            code = "[(_this select 0), ['SPE_18x_76mm_M7_M62_APCBC','SPE_20x_76mm_M7_M42_HE']] call BC_ww2_fnc_removeMagazine; (_this select 0) addMagazineTurret ['SPE_8x_76mm_M7_M93_APCR', [0]];";
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
            code = "(_this select 1) setVariable ['grad_carryBoatCargo', 1, true];[(_this select 1), 'B_Boat_Transport_01_F'] remoteExec ['BC_buymenu_fnc_addBoatInteraction', [0,-2] select isDedicated];";
            spawnEmpty = 1;
        };

        class rhsusf_explosive_m112 {
            kindOf = "Special";
            displayName = "Breaching Equipment";
            description = "Explosives and Wirecutter in Start Vehicle.";
            stock = 1;
            code = "(_this select 1) addItemCargoGlobal ['ACE_wirecutter',2];(_this select 1) addItemCargoGlobal ['ACE_Clacker',2];(_this select 1) addMagazineCargoGlobal ['DemoCharge_Remote_Mag', 2];";
            spawnEmpty = 1;
        };
    };
};
