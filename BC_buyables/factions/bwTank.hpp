//a different set of buyables
class bwTank {
    side = "Blufor";
    loadout = "bwFle";
    mode = "destroy";
    
    // needs to be in every faction
    class StartVehicle {
        deployAction = "";
        retractAction = "";
        condition = "false";
        driverGps = "true";
        crewHelmet = "";
        disableTIEquipment = "true";

        class gm_ge_army_Leopard1a3a1_wdl {
            condition = "true";
            code = "[(_this select 0)] call BC_buyables_fnc_configureBluforStartVehicle; (_this select 0) addWeaponCargoGlobal ['rhs_weap_m72a7', 12];";
        };
    };

    class Light {
        displayName = "Light";
        kindOf = "Vehicles";
        maxBuyCount = 3;
        minPlayerCount = 0;
        driverGps = "true";
        crewHelmet = "";
        disableTIEquipment = "true";

        class gm_ge_army_m113a1g_apc_milan_wdl {
            displayName = "M113 Milan";
            description = "";
            price = 10;
            stock = 3;
            itemCargo = "";
            code = "(_this select 0) addWeaponCargoGlobal ['rhs_weap_m72a7', 6];";
            magazineCargo = "";
            trackCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[[],[]]";
        };
    };


    class Heavy {
        displayName = "Heavy";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 0;
        driverGps = "true";
        crewHelmet = "";
        disableTIEquipment = "true";

        class gm_ge_army_Leopard1a3a1_wdl {
            displayName = "Leopard 1 A3";
            description = "";
            price = 10;
            stock = 2;
            code = "(_this select 0) addWeaponCargoGlobal ['rhs_weap_m72a7', 6];";
            itemCargo = "";
            magazineCargo = "";
            trackCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[[],[]]";
        };
    };


    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 0;
        driverGps = "true";
        crewHelmet = "";
        disableTIEquipment = "true";

        class redd_tank_wiesel_1a2_tow {
            displayName = "HMMWV-TOW";
            description = "";
            code = "(_this select 0) addWeaponCargoGlobal ['rhs_weap_m72a7', 6];";
            stock = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[[],[]]";
        };
    };
};