// 0 spawn at ground,
// 1 spawn with chute,
// 2 spawn with heli carrier,
// 3 spawn with civilian driving it
// 4 spawn at water marker

// camo shit, todo: make function
if ((ISLAND_TARGET_POSITIONS select (ISLANDS find worldName)) select 3) then {
       tigr = "rhs_tigr_m_vdv";
       uaz = "rhsgref_nat_uaz_dshkm";
       bmp_code = {};
       btr_code = {};
       gaz_code = {};
    } else {
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
    };


    

_truck = [
    ["rhs_kamaz5350_msv"],
    "Kamaz 5350",
    10,
    400,
    1,
    [],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
    },
    format[''],
    0,
    0
];


_car = [
    [
        tigr
    ],
    "TIGR-M",
    8,
    700,
    1,
    [],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
        ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    },
    format[''],
    0,
    0
];

_ammotruck = [
    ["rhs_gaz66_repair_vdv"],
    "GAZ-66 Ammo",
    1,
    1000,
    1,
    ["light_hide",1],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
        (_this select 0) addMagazineCargoGlobal ['SmokeShell',20];
        (_this select 0) addMagazineCargoGlobal ['SmokeShellRed',20];
        (_this select 0) addMagazineCargoGlobal ['rhs_30Rnd_762x39mm_tracer',30];
        (_this select 0) addMagazineCargoGlobal ['rhs_30Rnd_762x39mm',30];
        (_this select 0) addMagazineCargoGlobal ['16Rnd_9x21_Mag',20];
        (_this select 0) addMagazineCargoGlobal ['rhs_rpg7_PG7VL_mag',5];
        (_this select 0) addMagazineCargoGlobal ['rhs_rpg7_PG7VR_mag',5];
        (_this select 0) addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR_green',10];
        (_this select 0) addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR',10];
        (_this select 0) addMagazineCargoGlobal ['rhs_mag_rgd5',20];
        (_this select 0) addMagazineCargoGlobal ['rhs_GRD40_White',10];
        (_this select 0) addMagazineCargoGlobal ['rhs_GRD40_Green',10];
        (_this select 0) addMagazineCargoGlobal ['rhs_GRD40_Red',10];
        (_this select 0) addMagazineCargoGlobal ['rhs_VG40OP_white',10];
        (_this select 0) addMagazineCargoGlobal ['rhs_VG40OP_green',10];
        (_this select 0) addItemCargoGlobal ['ACE_Earplugs',15];
        (_this select 0) addItemCargoGlobal ['ACE_Morphine',40];
        (_this select 0) addItemCargoGlobal ['ACE_epinephrine',40];
        (_this select 0) addItemCargoGlobal ['ACE_fieldDressing',100];
        (_this select 0) addItemCargoGlobal ['ItemGPS',5];
        (_this select 0) addItemCargoGlobal ['ACE_bloodIV_250',20];
        ['AddCargoByClass', ['ACE_wheel', _this select 0, 3], _this select 0] call CBA_fnc_targetEvent;
        ['AddCargoByClass', ['ACE_Track', _this select 0, 1], _this select 0] call CBA_fnc_targetEvent;
        (_this select 0) setVariable ["GRAD_fortifications_available_Land_BagFence_Long_F", 10, true];
        (_this select 0) setVariable ["GRAD_fortifications_available_Land_BagFence_End_F", 5, true];
        (_this select 0) setVariable ["GRAD_fortifications_available_rhs_Flag_DNR_F", 2, true];
        (_this select 0) setVariable ["GRAD_fortifications_available_Land_Wreck_Ural_F", 1, true];
        (_this select 0) setVariable ["GRAD_fortifications_available_Land_Wreck_UAZ_F", 1, true];
        (_this select 0) setVariable ["GRAD_fortifications_available_Land_Razorwire_F", 3, true];
        (_this select 0) setVariable ["GRAD_fortifications_available_MetalBarrel_burning_F", 2, true];
        (_this select 0) setVariable ["GRAD_fortifications_available_Campfire_burning_F", 3, true];
        (_this select 0) setVariable ["GRAD_fortifications_available_Land_PortableLight_single_F", 4, true];
        call gaz_code;
    },
    format[''],
    0,
    0
];


_uaz = [
    [uaz],
    "UAZ Dshkm",
    10,
    1100,
    1,
    ["cabinlights_hide",0,"light_hide",1],
    {
    clearWeaponCargoGlobal (_this select 0);
    clearItemCargoGlobal (_this select 0);
    clearBackpackCargoGlobal (_this select 0);
    clearMagazineCargoGlobal (_this select 0);
    ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    },
    format[''],
    0,
    0
];


_btr = [
    ["rhs_btr70_msv"],
    "BTR-70",
    3,
    1500,
    1,
    ["driverViewHatch",0, "commanderViewHatch",0, "cargoHandler1",0, "crate_l1_unhide",1, "crate_l2_unhide",1, "crate_l3_unhide",1, "crate_l4_unhide",1, "crate_r1_unhide",1, "crate_r2_unhide",1, "crate_r3_unhide",1, "crate_r4_unhide",1, "water_1_unhide",1, "water_2_unhide",1, "wheel_1_unhide",1, "wheel_2_unhide",1],
    {
    clearWeaponCargoGlobal (_this select 0);
    clearItemCargoGlobal (_this select 0);
    clearBackpackCargoGlobal (_this select 0);
    clearMagazineCargoGlobal (_this select 0);
    (_this select 0) addItemCargoGlobal ['ItemGPS',1];
    ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    call btr_code;
    },
    format[''],
    0,
    0
];


_bmp = [
    ["rhs_bmp1_msv"],
    "BMP-1",
    2,
    2000,
    1,
    ["crate_l1_unhide",1,"crate_l2_unhide",1,"crate_l3_unhide",1,"crate_r1_unhide",1,"crate_r2_unhide",1,"crate_r3_unhide",1,"wood_1_unhide",1,"maljutka_hide_source",1,"cargoHandler1",0],
    {
    clearWeaponCargoGlobal (_this select 0);
    clearItemCargoGlobal (_this select 0);
    clearBackpackCargoGlobal (_this select 0);
    clearMagazineCargoGlobal (_this select 0);
    (_this select 0) addItemCargoGlobal ['ItemGPS',1];
    ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    (_this select 0) removeMagazinesTurret ["rhs_mag_og15v_20", [0]];
    call bmp_code;
    },
    format[''],
    0,
    0
];

_ammo_box = [
    ["Ace_Box_Ammo"],
    "Defence Pack",
    3,
    800,
    1,
    [],
    {
    clearWeaponCargoGlobal (_this select 0);
    clearItemCargoGlobal (_this select 0);
    clearBackpackCargoGlobal (_this select 0);
    clearMagazineCargoGlobal (_this select 0);
    (_this select 0) addBackpackCargoGlobal ['RHS_DShkM_Gun_Bag',1];
    (_this select 0) addBackpackCargoGlobal ['RHS_DShkM_TripodHigh_Bag',1];
    (_this select 0) addItemCargoGlobal ['ACE_Sandbag_empty',100];
    (_this select 0) addBackpackCargoGlobal ['rhs_rpg_empty',2];
    },
    format[''],
    0,
    0
];

_transmitter = [
    ["Land_DataTerminal_01_F"],
    "Radio Relay",
    1,
    1000,
    1,
    [],
    {
        deleteVehicle (_this select 0);    
        [] execVM "server\spawn\fnc_attachTerminalToFunkwagen.sqf";
    },
    format[''],
    0,
    0
];

suppliesOpfor setVariable ['car', _car, true];
suppliesOpfor setVariable ['truck', _truck, true];
suppliesOpfor setVariable ['ammotruck', _ammotruck, true];
suppliesOpfor setVariable ['uaz', _uaz, true];
suppliesOpfor setVariable ['bmp', _bmp, true];
suppliesOpfor setVariable ['btr', _btr, true];
suppliesOpfor setVariable ['ammo_box', _ammo_box, true];
suppliesOpfor setVariable ['transmitter', _transmitter, true];