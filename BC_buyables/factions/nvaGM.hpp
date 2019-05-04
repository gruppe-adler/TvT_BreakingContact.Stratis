//a different set of buyables
class nvaGM {
    side = "Opfor";
    loadout = "nvaGM";
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

        class gm_gc_army_btr60pu12_ols {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "";
            code = "[(_this select 0)] call BC_buyables_fnc_configureOpforStartVehicle;";
        };

        class gm_gc_army_btr60pu12_oli: gm_gc_army_btr60pu12_ols {
            condition = "BC_IS_WOODLAND";
            vehicleInit = "";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class gm_gc_army_ural4320_cargo_oli {
            displayName = "Ural";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_oli',1], ['cover_hide_unhide',0,'winch_unhide',0,'roofRack_unhide',0,'camonet_01_unhide',0,'coldWeatherKit_unhide',0,'fuelcan_1_1_unhide',0,'fuelcan_1_2_unhide',0,'lightGuard_unhide',1,'toolbox_unhide',1,'tools_unhide',1]]";
        };

        class gm_gc_army_ural4320_cargo_ols: gm_gc_army_ural4320_cargo_oli {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_ols',1], ['cover_hide_unhide',0,'winch_unhide',0,'roofRack_unhide',0,'camonet_01_unhide',0,'coldWeatherKit_unhide',0,'fuelcan_1_1_unhide',0,'fuelcan_1_2_unhide',0,'lightGuard_unhide',1,'toolbox_unhide',1,'tools_unhide',1]]";
        };

        class gm_gc_army_p601_oli {
            displayName = "UAZ";
            description = "Faster and smaller footprint but cant transport as many.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_oli',1], ['sirenLights_01_unhide',0]]";
        };

        class gm_gc_army_p601_ols: gm_gc_army_p601_oli {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_ols',1], ['sirenLights_01_unhide',0]]";
        };
    };


    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class gm_gc_army_btr60pa_oli {
            displayName = "BTR60-PA";
            description = "Unarmed armored transporter.";
            price = 10;
            stock = 3;
            wheelCargo = 2;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_oli',1],true]";
        };

        class gm_gc_army_btr60pa_ols: gm_gc_army_btr60pa_oli {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_ols',1],true]";
        };

        class gm_gc_army_brdm2um_oli {
            displayName = "BRDM2 UM";
            description = "Unarmed armored transporter.";
            price = 10;
            stock = 3;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_oli',1],true]";
        };

        class gm_gc_army_brdm2um_ols: gm_gc_army_brdm2um_oli {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_ols',1],true]";
        };        

    };


    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 40;

        
        class gm_gc_army_brdm2_oli {
            displayName = "BRDM-2";
            description = "Armed version of BRDM2.";
            stock = 2;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_oli',1],true]";
        };

        class gm_gc_army_brdm2_ols: gm_gc_army_brdm2_oli {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_ols',1],true]";
    
        };

        class gm_gc_army_btr60pb_oli {
            displayName = "Armed version of BTR60.";
            description = "Tank hunter with unguided AT.";
            price = 10;
            stock = 2;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_oli',1],true]";
        };

        class gm_gc_army_btr60pb_ols: gm_gc_army_btr60pb_oli {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_ols',1],true]";
        };
    };

    class Armor {
        displayName = "Armor";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class gm_gc_army_t55a_oli {
            displayName = "T55A";
            description = "Heavy tank, best vehicle you can get.";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_oli',1], ['camoNet_01_unhide',0]]";
        };

        class gm_gc_army_t55a_ols: gm_gc_army_t55a_oli {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_ols',1], ['camoNet_01_unhide',0]]";
        };

        class gm_gc_army_bmp1sp2_oli {
            displayName = "BMP1-D";
            description = "Carries more soldiers than T55 but is less protected.";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_oli',1],['spareTracks_1_1_unhide',0,'spareTracks_1_2_unhide',0,'spareTracks_2_1_unhide',0,'wheelChock_1_1_unhide',0,'wheelChock_1_2_unhide',0,'woodenBeam_01_unhide',0,'tarpRoll_01_unhide',0]]";
        };

        class gm_gc_army_bmp1sp2_ols: gm_gc_army_bmp1sp2_oli {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[['gm_gc_ols',1],['spareTracks_1_1_unhide',0,'spareTracks_1_2_unhide',0,'spareTracks_2_1_unhide',0,'wheelChock_1_1_unhide',0,'wheelChock_1_2_unhide',0,'woodenBeam_01_unhide',0,'tarpRoll_01_unhide',0]]";
        };

    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 2;

        class Land_DataTerminal_01_F {
            kindOf = "Special";
            displayName = "Radio Relay Terminal";
            description = "Replaces radio truck internal module.\nIs attached to the Command BTR but can be detached.\nSends with 50-100% strength depending on distance to Command BTR.";
            stock = 1;
            picturePath = "pic\terminal.paa";
            code = "diag_log str (_this); private _terminal = missionNameSpace getVariable ['GRAD_tracking_terminalObj', objNull]; [_terminal, (_this select 1)] call GRAD_tracking_fnc_terminalAttachToVeh;";
        };

        class Land_BagFence_Round_F {
            kindOf = "Special";
            displayName = "Defense Pack";
            description = "Sandbag-Fortificatons and 2 Axes for cutting vegetation in Radio Truck.";
            stock = 1;
            code = "diag_log str (_this); (_this select 1) addItemCargoGlobal ['grad_axe', 2]; [(_this select 1), 'Land_CzechHedgehog_01_new_F', 9] call grad_fortifications_fnc_addFort; [(_this select 1), 'Land_BagFence_Long_F', 9] call grad_fortifications_fnc_addFort;";
            spawnEmpty = 1;
        };
    };
};