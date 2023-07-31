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
        type = "gm_ge_army_iltis_cargo_oli";
        condition = "false";

        class gm_ge_army_iltis_cargo {
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
            code = "[(_this select 0)] call BC_buyables_fnc_configureBluforStartVehicle;";
        };

        class gm_ge_army_iltis_cargo: gm_ge_army_iltis_cargo {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };
    };

    class Logistics {
        displayName = "Logistics";
        kindOf = "Vehicles";
        maxBuyCount = 9;
        minPlayerCount = 0;

        class SPE_OpelBlitz {
            displayName = "Opel Blitz";
            description = "The workhorse of your army.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class SPE_OpelBlitz: SPE_OpelBlitz {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class rhs_uaz_open_MSV_01 {
            displayName = "UAZ";
            description = "Faster and smaller footprint but cant transport as many.";
            price = 10;
            stock = 7;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class rhs_uaz_open_vdv: rhs_uaz_open_MSV_01 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };
    };


    class Recon {
        displayName = "Recon";
        kindOf = "Vehicles";
        maxBuyCount = 2;
        minPlayerCount = 20;

        class SPE_SdKfz250_1 {
            displayName = "SdKfz 250/1";
            description = "The perfect commander limousine.";
            price = 10;
            stock = 2;
            wheelCargo = 2;
            spawnEmpty = 1;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class rhs_tigr_m_3camo_vdv: SPE_SdKfz250_1 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class SPE_OpelBlitz_Flak38 {
            displayName = "UAZ Dshkm";
            description = "Fast and a deadly gun against ground and air targets.";
            price = 10;
            stock = 2;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class rhsgref_cdf_b_reg_uaz_dshkm: SPE_OpelBlitz_Flak38 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };
    };


    class Support {
        displayName = "Support";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 40;

        
        class rhsgref_BRDM2_msv {
            displayName = "BRDM-2";
            description = "Armed version of BRDM2.";
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class rhsgref_BRDM2_vdv: rhsgref_BRDM2_msv {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
    
        };

        class rhsgref_nat_uaz_spg9 {
            displayName = "UAZ SPG9";
            description = "Tank hunter with unguided AT.";
            price = 10;
            stock = 1;
            spawnEmpty = 1;
            wheelCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class rhsgref_ins_uaz_spg9: rhsgref_nat_uaz_spg9 {
            condition = "!BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };
    };

    class Armor {
        displayName = "Armor";
        kindOf = "Vehicles";
        maxBuyCount = 1;
        minPlayerCount = 60;

        class SPE_Nashorn {
            displayName = "Nashorn";
            description = "Big gun, little Armor, fixed gun";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };

        class SPE_PzKpfwIII_N {
            displayName = "PzKfw 3 Ausf. N";
            description = "Medium tank";
            stock = 1;
            spawnEmpty = 1;
            trackCargo = 2;
            condition = "BC_IS_WOODLAND";
            vehicleInit = "[[],[]]";
        };
    };

    class Special {
        displayName = "Special";
        kindOf = "Special";
        maxBuyCount = 2;

        class Land_DataTerminal_01_F {
            kindOf = "Special";
            displayName = "Radio Relay Terminal";
            description = "Replaces radio truck internal module.\nIs attached to the radio truck but can be detached.\nSends with 50-100% strength depending on distance to radio truck.";
            stock = 1;
            picturePath = "pic\terminal.paa";
            code = "diag_log str (_this); private _terminal = missionNameSpace getVariable ['GRAD_tracking_terminalObj', objNull]; [_terminal, (_this select 1)] call GRAD_tracking_fnc_terminalAttachToVeh;";
        };

        class Land_BagFence_Round_F {
            kindOf = "Special";
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