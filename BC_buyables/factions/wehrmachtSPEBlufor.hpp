//a different set of buyables
class WehrmachtSPEBlufor {
    side = "Blufor";
    loadout = "wehrmachtSPE";
    mode = "conquer";
    driverGps = "false";
    crewHelmet = "gm_ge_headgear_crewhat_80_blk";
    disableTIEquipment = "true";
    
    // needs to be in every faction
    class StartVehicle {
        type = "gm_ge_army_iltis_cargo";
        condition = "false";

        class gm_ge_army_iltis_cargo {
            condition = "BC_IS_WOODLAND";
            code = "[(_this select 0)] call BC_buyables_fnc_configureBluforStartVehicle;";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class SPE_OpelBlitz {
            displayName = "Opel Blitz";
            description = "Carries soldiers decently armored.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 4;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class gm_ge_army_iltis_cargo {
            displayName = "Iltis";
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

        class SPE_SdKfz250_1 {
            displayName = "Leichtes Sonderkraftfahrzeug 250/1";
            description = "";
            price = 10;
            stock = 2;
            code = "";
            spawnEmpty = 1;
            vehicleInit = "[[],[]]";
        };

        class SPE_FW190F8 {
            displayName = "Focker Wulf 190 F8";
            description = "8x 50 cal";
            price = 10;
            stock = 1;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
            code = "deleteVehicle (_this select 0); ['SPE_FW190F8', false, ['SPE_2xMG151','SPE_2xMG131_FW190','SPE_Timed_Short_SC50_Bomb_Mount','SPE_Timed_Short_SC250_Bomb_Mount'], ['SPE_250Rnd_MG151','SPE_250Rnd_MG151','SPE_400Rnd_MG131','SPE_400Rnd_MG131','SPE_1Rnd_Timed_Short_SC50','SPE_1Rnd_Timed_Short_SC50','SPE_1Rnd_Timed_Short_SC250','SPE_1Rnd_Timed_Short_SC50','SPE_1Rnd_Timed_Short_SC50'], [['SPE_8xM2_P47',['SPE_4000Rnd_M2_P47'], [-1]]]] remoteExecCall ['BC_ww2_fnc_openGui', blufor_teamlead, false];";
        };
    };

    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 40;

        class SPE_OpelBlitz_Flak38 {
            displayName = "Opel Blitz Flak 38";
            description = "Truck with 20mm AA Gun";
            price = 10;
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
            code = "[(_this select 0), ['SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38','SPE_20x_SprGr_FlaK_38',]] call BC_ww2_fnc_removeMagazines;";
        };
    };

    class Heavy {
        displayName = "Heavy";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class SPE_Nashorn {
            displayName = "Nashorn";
            description = "Tank hunter with fly-by-wire AT.";
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
            code = "[(_this select 0), ['SPE_20x_PzGr43_AP','SPE_10x_PzGr40_APCR','SPE_10x_SprGr39_HE']] call BC_ww2_fnc_removeMagazines;";
        };

        class SPE_PzKpfwIV_G {
            displayName = "Panzerkampfwagen IV Ausf. G";
            description = "1 GPS\nFRIES equipped";
            stock = 1;
            spawnEmpty = 1;
            vehicleInit = "[[],[]]";
            code = "[(_this select 0), ['SPE_30x_PzGr39_KWK40_AP','SPE_40x_SprGr34_KWK40_HE']] call BC_ww2_fnc_removeMagazines;";
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
