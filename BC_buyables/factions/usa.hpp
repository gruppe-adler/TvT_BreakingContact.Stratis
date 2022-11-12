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

        class B_Truck_01_transport_F_Christmas {
            displayName = "Main Truck";
            description = "Carries soldiers decently armored.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 4;
            condition = "true";
            vehicleInit = "[['rhs_woodland',1],['hide_cover',0,'hide_spare',0,'hide_scaffold',0,'hide_bench',0]]";
        };

    };


    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class MH_9_Christmas_01 {
            displayName = "MH-9";
            description = "1 GPS\nNO Thermals\nwith Benches";
            price = 10;
            stock = 1;
            code = "(_this select 0) addItemCargoGlobal ['ACE_NVG_Wide',2];(_this select 0) addItemCargoGlobal ['ItemGPS',1];(_this select 0) disableTIEquipment true; [(_this select 0)] call BC_setup_fnc_fuelDrain;";
            spawnEmpty = 1;
            vehicleInit = "[[],[]]";
        };
    };

   class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 40;

        
        class Sparken_F {
            displayName = "Kick Sleigh";
            description = "Sneaky sleigh.";
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[[],[]]";
        };
    };

    class Heavy {
        displayName = "Heavy";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class Sparken_F {
            displayName = "Kick Sleigh";
            description = "Sneaky sleigh.";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "true";
            vehicleInit = "[[],[]]";
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
