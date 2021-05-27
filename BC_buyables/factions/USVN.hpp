//a different set of buyables
class USVN {
    side = "Blufor";
    loadout = "usvn";
    mode = "conquer";
    driverGps = "true";
    crewHelmet = "";
    disableTIEquipment = "true";

    // needs to be in every faction
    class StartVehicle {
        type = "vn_b_wheeled_m54_03";
        condition = "false";
        driverGps = "true";

        class vn_b_wheeled_m54_03 {
            condition = "true";
            code = "[(_this select 0)] call BC_buyables_fnc_configureBluforStartVehicle;";
            driverGps = "true";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class vn_b_wheeled_m54_02 {
            displayName = "M54 Transport";
            description = "Carries soldiers.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 4;
            condition = "true";
            vehicleInit = "[['army',1],['user_canopy_rear_hide',0,'user_canopy_rear_frame_hide',1,'user_canopy_rear_frame_02_hide',0,'user_toolbox_hide',0,'user_ammoboxes_hide',1,'user_bench_hide',0,'user_canopy_front_hide',0,'user_sparewheel_hide',0]]";
        };

        class vn_b_wheeled_m151_01 {
            displayName = "M151A1 Jeep";
            description = "Gator Bait.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 4;
            condition = "true";
            vehicleInit = "[['m151_08',1],['user_canopy_hide',1,'user_sparewheel_hide',0,'user_axe_hide',0,'user_shovel_hide',0,'user_refuel_can_hide',0]]";
        };

        class vn_b_wheeled_m151_02_mp {
            displayName = "M54 Transport";
            description = "Rat Patrol.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 4;
            condition = "true";
            vehicleInit = "[['m151_07',1],['user_canopy_hide',0,'user_sparewheel_hide',0,'user_axe_hide',0,'user_shovel_hide',0,'user_refuel_can_hide',0]]";
        };

        class vn_b_wheeled_m54_fuel {
            displayName = "M54 Transport";
            description = "Rat Patrol.";
            price = 10;
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 4;
            condition = "true";
            vehicleInit = "[['army',1],['user_sparewheel_hide',0,'user_canopy_front_hide',1]]";
        };

    };


    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class vn_b_air_uh1d_01_04 {
            displayName = "UH-1D Medical";
            description = "Unarmed\n";
            price = 10;
            stock = 1;
            code = "(_this select 0) addItemCargoGlobal ['UK3CB_PVS5A', 2];(_this select 0) addItemCargoGlobal ['ItemGPS',1];(_this select 0) disableTIEquipment true; [(_this select 0)] call BC_setup_fnc_fuelDrain;";
            spawnEmpty = 1;
            vehicleInit = "[['uh1d_26',1],true]";
        };

        class vn_b_wheeled_m151_mg_03 {
            displayName = "M151A1 Jeep Armored";
            description = "Perfect commander limousine. Trail Boss.";
            price = 10;
            stock = 2;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[['m151_20',1],['user_sparewheel_hide',0,'user_axe_hide',0,'user_shovel_hide',0]]";
        };

        class vn_b_wheeled_m151_mg_04 {
            displayName = "M15A1 Jeep Open";
            description = "A small target with a big gun.";
            stock = 2;
            spawnEmpty = 1;
            wheelCargo = 3;
            condition = "true";
            vehicleInit = "[['m151_01',1],['user_sparewheel_hide',0,'user_axe_hide',0,'user_shovel_hide',0,'user_refuel_can_hide',0]]";
            code = "(_this select 0) setVariable ['ace_rearm_isSupplyVehicle', false, true]; (_this select 0) setVariable ['ACE_isRepairVehicle', false, true];";
        };
    };

    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 40;

        class vn_b_air_ch34_01_01 {
            displayName = "CH-34 1x Minigun";
            description = "Slow but flying.";
            price = 10;
            stock = 1;
            code = "(_this select 0) addItemCargoGlobal ['UK3CB_PVS5A', 2];(_this select 0) addItemCargoGlobal ['ItemGPS',1];(_this select 0) disableTIEquipment true; [(_this select 0)] call BC_setup_fnc_fuelDrain;";
            spawnEmpty = 1;
            spawnHeight = 0.2;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[['ch34_02',1], []]";
        };

        class vn_b_wheeled_m54_mg_01 {
            displayName = "Truck 3xM2HB";
            description = "Armored and maximum Firepower.";
            price = 10;
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[['camo8',1],['user_sparewheel_hide',0,'user_toolbox_hide',0,'user_canopy_front_hide',0]]";
        };

        class vn_b_wheeled_m54_mg_03 {
            displayName = "Truck Minigun";
            description = "Armored and maximum Firepower.";
            price = 10;
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[['army',1],['user_sparewheel_hide',0,'user_toolbox_hide',0,'user_canopy_front_hide',0]]";
        };
    };

    class Heavy {
        displayName = "Heavy";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class vn_b_armor_m41_01_02 {
            displayName = "M41A3 Walker";
            description = "Tank.";
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[['m41_01',1],[]]";
        };

        class vn_b_air_oh6a_01 {
            displayName = "OH-6A MG";
            description = "Fast, reliable.";
            price = 10;
            stock = 1;
            code = "(_this select 0) addItemCargoGlobal ['UK3CB_PVS5A', 2];(_this select 0) addItemCargoGlobal ['ItemGPS',1];(_this select 0) disableTIEquipment true; [(_this select 0)] call BC_setup_fnc_fuelDrain;";
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[['camo1',1], []]";
        };

        class vn_b_air_uh1d_02_04 {
            displayName = "UH-1D 2x Minigun";
            description = "Reliable, deadly.";
            price = 10;
            stock = 1;
            code = "(_this select 0) addItemCargoGlobal ['UK3CB_PVS5A', 2];(_this select 0) addItemCargoGlobal ['ItemGPS',1];(_this select 0) disableTIEquipment true; [(_this select 0)] call BC_setup_fnc_fuelDrain;";
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[['uh1d_08',1], []]";
        };
    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 2;

        class vn_o_boat_08_01 {
            kindOf = "Special";
            displayName = "Boat + Diving Equipment inside * 4";
            description = "Get it in the Start Vehicle (ACE Interaction).";
            stock = 1;
            code = "(_this select 1) setVariable ['grad_carryBoatCargo', 1, true];[(_this select 1), 'vn_o_boat_08_01'] remoteExec ['BC_buymenu_fnc_addBoatInteraction', [0,-2] select isDedicated];";
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
