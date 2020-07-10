    //a different set of buyables
class sovjetGM {
    side = "Blufor";
    loadout = "sovjetGM";
    mode = "conquer";
    
    // needs to be in every faction
    class StartVehicle {
        deployAction = "";
        retractAction = "";
        condition = "false";
        driverGps = "false";
        crewHelmet = "gm_gc_army_headgear_crewhat_80_blk";
        disableTIEquipment = "true";
        terminalPositionOffset = "[0.3,-2.85,0.7]";
        terminalVectorDirAndUp = "[[0,1,0.3],[0,0,0.7]]";


        class gm_gc_army_btr60pu12 {
            condition = "true";
            code = "[(_this select 0)] call BC_buyables_fnc_configureBluforStartVehicle; if (!BC_IS_WOODLAND) then {(_this select 0) setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)']; (_this select 0) setObjectTextureGlobal [1, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)'];}; [_this select 0,'gm_insignia_ur_star_01',5,0] call gm_core_vehicles_fnc_vehicleMarkingsUpdateAttributes;";
            crewHelmet = "gm_gc_army_headgear_crewhat_80_blk";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class gm_gc_army_ural4320_cargo {
            displayName = "Ural";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            code = "if (!BC_IS_WOODLAND) then {(_this select 0) setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)']; (_this select 0) setObjectTextureGlobal [1, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)'];}; [_this select 0,'gm_insignia_ur_star_01',5,0] call gm_core_vehicles_fnc_vehicleMarkingsUpdateAttributes;";

        };

        class gm_ge_army_k125 {
            displayName = "Motorcycle";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            code = "if (!BC_IS_WOODLAND) then {(_this select 0) setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)']; (_this select 0) setObjectTextureGlobal [1, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)'];}; [_this select 0,'gm_insignia_ur_star_01',5,0] call gm_core_vehicles_fnc_vehicleMarkingsUpdateAttributes;";

        };
    };


    class Armored {
        displayName = "Armored";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 0;

        class gm_gc_army_brdm2 {
            displayName = "BRDM-2";
            description = "Armed armored transporter.";
            price = 10;
            stock = 3;
            wheelCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            crewHelmet = "gm_gc_army_headgear_crewhat_80_blk";
            code = "if (!BC_IS_WOODLAND) then {(_this select 0) setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)']; (_this select 0) setObjectTextureGlobal [1, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)'];}; [_this select 0,'gm_insignia_ur_star_01',5,0] call gm_core_vehicles_fnc_vehicleMarkingsUpdateAttributes;";

        };

        class gm_gc_army_btr60pa {
            displayName = "BTR 60";
            description = "Armored Troop Carrier";
            price = 10;
            stock = 1;
            wheelCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['RHS_SAF_Green',1],['bench_hide',0,'intake_hide',1,'RearDoors',0]]";
            crewHelmet = "gm_gc_army_headgear_crewhat_80_blk";
            code = "if (!BC_IS_WOODLAND) then {(_this select 0) setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)']; (_this select 0) setObjectTextureGlobal [1, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)'];}; [_this select 0,'gm_insignia_ur_star_01',5,0] call gm_core_vehicles_fnc_vehicleMarkingsUpdateAttributes;";
        };

    };

    class Air {
        displayName = "Air";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 0;

        class gm_gc_airforce_mi2t {
            displayName = "Mi-2 PKM";
            description = "Light Armed Helicopter.";
            price = 10;
            stock = 1;
            wheelCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['gm_gc_brb',1],['cablecutter_unhide',0,'fan_unhide',0,'plugs_unhide',0,'skids_unhide',0,'winch_unhide',0,'fueltank_left_unhide',0,'fueltank_right_unhide',0]]";
            crewHelmet = "gm_gc_army_headgear_crewhat_80_blk";
            code = "if (!BC_IS_WOODLAND) then {(_this select 0) setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)']; (_this select 0) setObjectTextureGlobal [1, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)'];}; [_this select 0,'gm_insignia_ur_star_01',5,0] call gm_core_vehicles_fnc_vehicleMarkingsUpdateAttributes;";

        };

        class gm_gc_airforce_mi2p {
            displayName = "Mi-2 Transport";
            description = "Light Transport Helicopter";
            price = 10;
            stock = 1;
            wheelCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['gm_gc_brb',1],['cablecutter_unhide',0,'fan_unhide',0,'plugs_unhide',0,'skids_unhide',0,'winch_unhide',0,'fueltank_left_unhide',0,'fueltank_right_unhide',0]]";
            crewHelmet = "gm_gc_army_headgear_crewhat_80_blk";
            code = "if (!BC_IS_WOODLAND) then {(_this select 0) setObjectTextureGlobal [0, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)']; (_this select 0) setObjectTextureGlobal [1, '#(rgb,8,8,3)color(0.25,0.2,0.1,1)'];}; ";
        };

    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 1;

        class Land_BagFence_Round_F {
            kindOf = "Special";
            displayName = "Defense Pack";
            description = "Sandbag-Fortificatons and 2 Axes for cutting vegetation in Radio Truck.";
            stock = 1;
            code = "diag_log str (_this); (_this select 1) addItemCargoGlobal ['grad_axe', 2]; [(_this select 1), 'land_gm_tanktrap_01', 9] call grad_fortifications_fnc_addFort; [(_this select 1), 'land_gm_sandbags_01_low_01', 9] call grad_fortifications_fnc_addFort; [(_this select 1), 'land_gm_sandbags_01_round_01', 3] call grad_fortifications_fnc_addFort;";
            spawnEmpty = 1;
        };
    };
};