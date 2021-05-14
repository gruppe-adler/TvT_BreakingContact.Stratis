//a different set of buyables
class PAVN {
    side = "Opfor";
    loadout = "pavn";
    mode = "conquer";
    
    // needs to be in every faction
    class StartVehicle {
        type = "vn_o_wheeled_z157_03_nva65";
        deployAction = "";
        retractAction = "";
        condition = "false";
        driverGps = "true";
        crewHelmet = "vn_o_helmet_tsh3_02";
        disableTIEquipment = "true";
        terminalPositionOffset = "[0.3,-2.85,0.7]";
        terminalVectorDirAndUp = "[[0,1,0.3],[0,0,0.7]]";

        class vn_o_wheeled_z157_03_nva65 {
            condition = "true";
            vehicleInit = "[nil,['ClanLogo_Hide',1]]";
            code = "[(_this select 0)] call BC_buyables_fnc_configureOpforStartVehicle;";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class vn_o_wheeled_z157_02_nva65 {
            displayName = "Z-157";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[nil,['ClanLogo_Hide',1]]";
        };

        class vn_o_bicycle_01_nva65 {
            displayName = "Bike";
            description = "Faster and smaller footprint but cant transport as many.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[nil,nil]";
        };
    };


    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class vn_o_wheeled_btr40_mg_01_nva65 {
            displayName = "BTR-40 RPD";
            description = "The perfect commander limousine.";
            price = 10;
            stock = 2;
            wheelCargo = 2;
            spawnEmpty = 1;
            condition = "true";
            vehicleInit = "[['btr_03',1],['chairs_hide',0,'canopy_hide',1,'refuel_can_hide',0,'saw_hide',0,'sparewheel_hide',0,'shovel_hide',0,'toolbox_hide',0]]";
        };

        class vn_o_wheeled_z157_mg_01_nva65 {
            displayName = "Z-157 Dshkm";
            description = "Fast and a deadly gun against ground and air targets.";
            price = 10;
            stock = 2;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[nil,['ClanLogo_Hide',1]]";
        };

    };


    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 40;

        
        class vn_o_wheeled_z157_repair {
            displayName = "Z-157";
            description = "Repair Vehicle (can repair wrecks)";
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[nil,['ClanLogo_Hide',1]]";
        };

        class vn_o_wheeled_z157_fuel {
            displayName = "Z-157";
            description = "Fuel Truck (rolling bomb)";
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "true";
            vehicleInit = "[nil,['ClanLogo_Hide',1]]";
        };
    };

    class Armor {
        displayName = "Armor";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class vn_o_armor_type63_01 {
            displayName = "Type-63 Tank";
            description = "Heavy tank, best vehicle you can get.";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "true";
            vehicleInit = "[['type63_04',1],['hide_axe',0,'hide_barrels',0,'hide_dshkm_boxes',0,'hide_shovel',0,'hide_tracks',0,'hide_cable',0,'hide_tarpaulin',0]]";
        };

        class vn_o_armor_m41_01 {
            displayName = "M41A3 Walker";
            description = "Carries more soldiers but is less protected.";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "true";
            vehicleInit = "[['m41_08',1],true]";
        };
    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 2;

        class vn_o_boat_01_mg_03 {
            kindOf = "Boat 01";
            displayName = "Radio Relay Terminal";
            description = "Replaces radio truck internal module.\nIs attached to the radio truck but can be detached.\nSends with 50-100% strength depending on distance to radio truck.";
            stock = 1;
            picturePath = "pic\terminal.paa";
            code = "diag_log str (_this); private _terminal = missionNameSpace getVariable ['GRAD_tracking_terminalObj', objNull]; [_terminal, (_this select 1)] call GRAD_tracking_fnc_terminalAttachToVeh;";
        };

        class vn_o_boat_02_mg_03 {
            kindOf = "Boat 02";
            displayName = "Defense Pack";
            description = "1 KORD MG, Sandbag-Fortificatons and 2 Axes for cutting vegetation in Radio Truck.";
            stock = 1;
            code = "diag_log str (_this);private _mg = 'rhs_KORD_high_VDV' createVehicle [0,0,0];_mg attachTo [(_this select 1), [0,0,0]];[_mg, (_this select 1)] call ace_cargo_fnc_loadItem; (_this select 1) addItemCargoGlobal ['grad_axe', 2]; [(_this select 1), 'Land_CzechHedgehog_01_new_F', 9] call grad_fortifications_fnc_addFort; [(_this select 1), 'Land_BagFence_Long_F', 9] call grad_fortifications_fnc_addFort;";
            spawnEmpty = 1;
        };

        class Land_WeldingTrolley_01_F {
            kindOf = "Special";
            displayName = "Radio Truck Armor";
            description = "Selfmade armor for radio truck to protect its tires against small arms fire.";
            stock = 2;
            code = "diag_log str (_this); [(_this select 1)] call BC_buymenu_fnc_applyTruckArmor;";
        };
    };
};