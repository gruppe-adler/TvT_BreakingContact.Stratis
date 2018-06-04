// 0 spawn at ground,
// 1 spawn with chute,
// 2 spawn with heli carrier,
// 3 spawn with civilian driving it
// 4 spawn at water marker

private ["_initUral", "_initBRDM", "_initBMP", "_initBTR", "_initT72"];

// camo shit, todo: make function
if (IS_WOODLAND) then {
       _initUral = [["standard",1], ["light_hide",1]];
       
       _initBMP = [["standard",1], ["crate_l1_unhide",1,"crate_l2_unhide",1,"crate_l3_unhide",1,"crate_r1_unhide",1,"crate_r2_unhide",1,"crate_r3_unhide",1,"wood_1_unhide",1,"maljutka_hide_source",1,"cargoHandler1",0]];
       _initBTR = [["standard",1], ["driverViewHatch",0, "commanderViewHatch",0, "cargoHandler1",0, "crate_l1_unhide",1, "crate_l2_unhide",1, "crate_l3_unhide",1, "crate_l4_unhide",1, "crate_r1_unhide",1, "crate_r2_unhide",1, "crate_r3_unhide",1, "crate_r4_unhide",1, "water_1_unhide",1, "water_2_unhide",1, "wheel_1_unhide",1, "wheel_2_unhide",1]];
       _initBRDM =[["olive", 1], ["driverViewHatch",0,"commanderViewHatch",0,"hatchCommander",1]];
       _initT72 = [["standard",1], ["hide_com_shield",1,"sightElevationAPFSDS",0]];
       tigr = "rhs_tigr_m_vdv";
       uaz = "rhsgref_nat_uaz_dshkm";
       
       bmp_code = {};

       btr_code = {};
       
       gaz_code = {};
       
       kamaz_code = {};
       
       t72_code = {};
    } else {
       _initUral = [["rhs_sand",1], ["light_hide",1]];
       _initBMP = [["rhs_sand",1], ["crate_l1_unhide",1,"crate_l2_unhide",1,"crate_l3_unhide",1,"crate_r1_unhide",1,"crate_r2_unhide",1,"crate_r3_unhide",1,"wood_1_unhide",1,"maljutka_hide_source",1,"cargoHandler1",0]];
       _initBTR = [["rhs_sand",1], ["driverViewHatch",0, "commanderViewHatch",0, "cargoHandler1",0, "crate_l1_unhide",1, "crate_l2_unhide",1, "crate_l3_unhide",1, "crate_l4_unhide",1, "crate_r1_unhide",1, "crate_r2_unhide",1, "crate_r3_unhide",1, "crate_r4_unhide",1, "water_1_unhide",1, "water_2_unhide",1, "wheel_1_unhide",1, "wheel_2_unhide",1]];
       _initBRDM =[["3tone", 1], ["driverViewHatch",0,"commanderViewHatch",0,"hatchCommander",1]];
       _initT72 = [["rhs_sand",1], ["hide_com_shield",1,"sightElevationAPFSDS",0]];
       tigr = "rhs_tigr_m_3camo_vdv";
       uaz = "rhsgref_cdf_b_reg_uaz_dshkm";
       
       bmp_code = {
        (_this select 0) setObjectTextureGlobal [0,"rhsafrf\addons\rhs_bmp_camo\data\bmp_1_desert_co.paa"];
        (_this select 0) setObjectTextureGlobal [1,"rhsafrf\addons\rhs_bmp_camo\data\bmp_2_desert_co.paa"];
        (_this select 0) setObjectTextureGlobal [2,"rhsafrf\addons\rhs_bmp_camo\data\bmp_3_desert_co.paa"];
        (_this select 0) setObjectTextureGlobal [3,"rhsafrf\addons\rhs_bmp_camo\data\bmp_4_desert_co.paa"];
        (_this select 0) setObjectTextureGlobal [4,"rhsafrf\addons\rhs_bmp_camo\data\bmp_5_desert_co.paa"];
        (_this select 0) setObjectTextureGlobal [5,"rhsafrf\addons\rhs_bmp_camo\data\bmp_6_desert_co.paa"];
        };
        
        btr_code = {
        (_this select 0) setObjectTextureGlobal [0,"rhsafrf\addons\rhs_btr70_camo\data\btr70_1_sand_co.paa"];
        (_this select 0) setObjectTextureGlobal [1,"rhsafrf\addons\rhs_btr70_camo\data\btr70_2_sand_co.paa"];
        };
        
        gaz_code = {
        (_this select 0) setObjectTextureGlobal [0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa"];
        (_this select 0) setObjectTextureGlobal [1,"rhsafrf\addons\rhs_gaz66\data\tent_co.paa"];
        (_this select 0) setObjectTextureGlobal [2,"rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_kung_sand_co.paa"];
        (_this select 0) setObjectTextureGlobal [3,"rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_ap2kung_sand_co.paa"];
        (_this select 0) setObjectTextureGlobal [4,"rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_repkung_sand_co.paa"];
        };

        t72_code = {
        (_this select 0) setObjectTextureGlobal [0,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_01a_sand_co.paa"];
        (_this select 0) setObjectTextureGlobal [1,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_02a_sand_co.paa"];
        (_this select 0) setObjectTextureGlobal [2,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_03_sand_co.paa"];
        (_this select 0) setObjectTextureGlobal [3,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_04_sand_co.paa"];
        };
        
        
    };


_transportTruck = [
    ["rhsgref_nat_ural"],
    "Ural Transport",
    4,
    200,
    0,
    _initUral,
    {
         _veh = (_this select 0);
        [_veh] call GRAD_buymenu_fnc_clearInventory;
        _veh addItemCargoGlobal ["ItemGPS",1];
        ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    },
    ['1 GPS'],
    0,
    0
];

_brdm = [
    ["rhsgref_BRDM2_HQ_b"],
    "BRDM PKT",
    2,
    500,
    1,
    _initBRDM,
    {
        _veh = (_this select 0);
        [_veh] call GRAD_buymenu_fnc_clearInventory;
        _veh addItemCargoGlobal ["ItemGPS",1];
        ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    },
    ['1 GPS'],
    0,
    0
];   

_tigr = [
    [
        tigr
    ],
    "TIGR-M",
    4,
    500,
    2,
    [[],[]],
    {
        _veh = (_this select 0);
        [_veh] call GRAD_buymenu_fnc_clearInventory;
        _veh addItemCargoGlobal ["ItemGPS",1];
        ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    },
    ['1 GPS'],
    0,
    0
];

_ammotruck = [
    ["rhs_gaz66_repair_vdv"],
    "GAZ-66 Ammo",
    1,
    1000,
    3,
    [[], ["light_hide",1]],
    {
        _veh = (_this select 0);
        [_veh] call GRAD_buymenu_fnc_clearInventory;
        _veh addItemCargoGlobal ["ItemGPS",1];
        _veh addMagazineCargoGlobal ['SmokeShell',20];
        _veh addMagazineCargoGlobal ['SmokeShellRed',20];
        _veh addMagazineCargoGlobal ['rhs_30Rnd_762x39mm_tracer',30];
        _veh addMagazineCargoGlobal ['rhs_30Rnd_762x39mm',30];
        _veh addMagazineCargoGlobal ['16Rnd_9x21_Mag',20];
        _veh addMagazineCargoGlobal ['rhs_rpg7_PG7VL_mag',5];
        _veh addMagazineCargoGlobal ['rhs_rpg7_PG7VR_mag',5];
        _veh addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR_green',10];
        _veh addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR',10];
        _veh addMagazineCargoGlobal ['rhs_mag_rgd5',20];
        _veh addMagazineCargoGlobal ['rhs_GRD40_White',10];
        _veh addMagazineCargoGlobal ['rhs_GRD40_Green',10];
        _veh addMagazineCargoGlobal ['rhs_GRD40_Red',10];
        _veh addMagazineCargoGlobal ['rhs_VG40OP_white',10];
        _veh addMagazineCargoGlobal ['rhs_VG40OP_green',10];
        _veh addItemCargoGlobal ['ACE_Earplugs',40];
        _veh addItemCargoGlobal ['ACE_Morphine',40];
        _veh addItemCargoGlobal ['ACE_epinephrine',40];
        _veh addItemCargoGlobal ['ACE_fieldDressing',100];
        _veh addItemCargoGlobal ['ItemGPS',5];
        _veh addItemCargoGlobal ['ACE_bloodIV_250',20];
        ['AddCargoByClass', ['ACE_wheel', _veh, 3], _veh] call CBA_fnc_targetEvent;
        ['AddCargoByClass', ['ACE_Track', _veh, 1], _veh] call CBA_fnc_targetEvent;

        _veh addBackpackCargoGlobal ['RHS_DShkM_Gun_Bag',1];
        _veh addBackpackCargoGlobal ['RHS_DShkM_TripodHigh_Bag',1];
        _veh addItemCargoGlobal ['ACE_Sandbag_empty',100];

        [_veh, "Land_BagFence_Long_F", 10] call grad_fortifications_fnc_addFort;
        [_veh, "Land_BagFence_End_F", 10] call grad_fortifications_fnc_addFort;
        [_veh, "Land_Razorwire_F", 5] call grad_fortifications_fnc_addFort;
        [_veh, "Campfire_burning_F", 3] call grad_fortifications_fnc_addFort;
        [_veh, "MetalBarrel_burning_F", 4] call grad_fortifications_fnc_addFort;
        [_veh, "Land_PortableLight_single_F", 4] call grad_fortifications_fnc_addFort;
        [_veh, "Land_Wreck_Ural_F", 1] call grad_fortifications_fnc_addFort;
        [_veh, "Land_Wreck_UAZ_F", 1] call grad_fortifications_fnc_addFort;
        [_veh, "rhs_Flag_DNR_F", 4] call grad_fortifications_fnc_addFort;

    },
    ['1 GPS','1 Dshkm', 'Fortifications', 'Ammunition'],
    0,
    0
];


_uaz = [
    [uaz],
    "UAZ Dshkm",
    2,
    1000,
    4,
    [[], ["cabinlights_hide",0,"light_hide",1]],
    {
    _veh = (_this select 0);
    [_veh] call GRAD_buymenu_fnc_clearInventory;    
    (_this select 0) addItemCargoGlobal ["ItemGPS",1];
    ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    },
    ['1 GPS'],
    0,
    0
];



_btr = [
    ["rhs_btr70_msv"],
    "BTR-70",
    1,
    1300,
    5,
    [[], ["driverViewHatch",0, "commanderViewHatch",0, "cargoHandler1",0, "crate_l1_unhide",1, "crate_l2_unhide",1, "crate_l3_unhide",1, "crate_l4_unhide",1, "crate_r1_unhide",1, "crate_r2_unhide",1, "crate_r3_unhide",1, "crate_r4_unhide",1, "water_1_unhide",1, "water_2_unhide",1, "wheel_1_unhide",1, "wheel_2_unhide",1]],
    {
    clearWeaponCargoGlobal (_this select 0);
    clearItemCargoGlobal (_this select 0);
    clearBackpackCargoGlobal (_this select 0);
    clearMagazineCargoGlobal (_this select 0);
    ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;

    (_this select 0) addItemCargoGlobal ["rhs_tsh4",3];
    (_this select 0) addItemCargoGlobal ["ItemGPS",1];

    call btr_code;
    },
    ['1 GPS', 'Comes with 3 TSH-4 Caps.'],
    0,
    0
];


_bmp = [
    ["rhs_bmp1_msv"],
    "BMP-1",
    1,
    1700,
    6,
    _initBMP,
    {
    clearWeaponCargoGlobal (_this select 0);
    clearItemCargoGlobal (_this select 0);
    clearBackpackCargoGlobal (_this select 0);
    clearMagazineCargoGlobal (_this select 0);
    (_this select 0) addItemCargoGlobal ['ItemGPS',1];
    ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    (_this select 0) removeMagazinesTurret ["rhs_mag_og15v_20", [0]];
    call bmp_code;
    (_this select 0) addItemCargoGlobal ["rhs_tsh4",3];
    },
    ['No HE ammunition.', 'Comes with 3 TSH-4 Caps.'],
    0,
    0
];


_t72 = [
    ["rhs_t72ba_tv"],
    "T-72",
    1,
    2500,
    7,
    _initT72,
    {
    clearWeaponCargoGlobal (_this select 0);
    clearItemCargoGlobal (_this select 0);
    clearBackpackCargoGlobal (_this select 0);
    clearMagazineCargoGlobal (_this select 0);
    (_this select 0) addItemCargoGlobal ['ItemGPS',1];
    ['AddCargoByClass', ['ACE_track', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    (_this select 0) removeMagazinesTurret ["rhs_mag_3of26_5", [0]];
    call t72_code;
    (_this select 0) addItemCargoGlobal ["rhs_tsh4",3];
    },
    ['No HE ammunition.', 'Comes with 3 TSH-4 Caps.'],
    0,
    0
];


_transmitter = [
    ["Land_DataTerminal_01_F"],
    "Radio Relay",
    1,
    1500,
    8,
    [[], []],
    {
        deleteVehicle (_this select 0);
        _radioVeh = missionNameSpace getVariable ["GRAD_tracking_radioVehObj", objNull];
        _terminal = missionNameSpace getVariable ["GRAD_tracking_terminalObj", objNull];
        [_terminal, _radioVeh] call GRAD_tracking_fnc_terminalAttachToVeh;
    },
    ['Sends with 50% strength and up to 100% combined w/ radio truck. Send attached and detached. Radio truck loses standalone transmission ability.'],
    0,
    0
];

_truckarmor = [
    ["Land_WeldingTrolley_01_F"],
    "Truck Armor",
    1,
    500,
    9,
    [[], []],
    {
        deleteVehicle (_this select 0);
        private _radioVeh = missionNameSpace getVariable ["GRAD_tracking_radioVehObj", objNull];
        private _armorLevel = _radioVeh getVariable ["BC_objectives_armorLevel", 0];
        [_radioVeh] call BC_objectives_fnc_removeTruckArmor;
        [_radioVeh, _armorLevel + 1] call BC_objectives_fnc_applyTruckArmor;
        _radioVeh setVariable ["BC_objectives_armorLevel", 1];
    },
    ['Selfmade armor for radio truck to protect its tires against small arms fire.'],
    0,
    0
];

suppliesOpfor setVariable ['transportTruck', _transportTruck, true];
suppliesOpfor setVariable ['brdm', _brdm, true];
suppliesOpfor setVariable ['tigr', _tigr, true];
suppliesOpfor setVariable ['ammotruck', _ammotruck, true];
suppliesOpfor setVariable ['uaz', _uaz, true];
suppliesOpfor setVariable ['bmp', _bmp, true];
suppliesOpfor setVariable ['btr', _btr, true];
suppliesOpfor setVariable ['t72', _t72, true];
suppliesOpfor setVariable ['transmitter', _transmitter, true];
suppliesOpfor setVariable ['truckarmor', _truckarmor, true];