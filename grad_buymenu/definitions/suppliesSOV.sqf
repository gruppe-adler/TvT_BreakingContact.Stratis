// 0 spawn at ground,
// 1 spawn with chute,
// 2 spawn with heli carrier,
// 3 spawn with civilian driving it
// 4 spawn at water marker




_BRDM = [
    ["rhsgref_BRDM2_HQ_msv"],
    "BRDM 2UM",
    6,
    500,
    1,
    [],
    {   _veh = _this select 0;
        clearWeaponCargoGlobal _veh;
        clearItemCargoGlobal _veh;
        clearBackpackCargoGlobal _veh;
        clearMagazineCargoGlobal _veh;
        _veh addItemCargoGlobal ["rhs_tsh4",3];
        _veh addItemCargoGlobal ["ItemGPS",1];

        ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
        _veh setObjectTextureGlobal [0, "rhsgref\addons\rhsgref_a2port_armor\brdm2\data\brdm2_3tone_01_co.paa"];
        _veh setObjectTextureGlobal [1, "rhsgref\addons\rhsgref_a2port_armor\brdm2\data\brdm2_3tone_02_co.paa"];
    },
    format[''],
    0,
    0
];   

_BMP = [
    ["rhs_bmp1_msv"],
    "BMP",
    2,
    1000,
    1,
    [],
    {
        _veh = _this select 0;
        clearWeaponCargoGlobal _veh;
        clearItemCargoGlobal _veh;
        clearBackpackCargoGlobal _veh;
        clearMagazineCargoGlobal _veh;

        _veh addItemCargoGlobal ["rhs_tsh4",3];
        _veh addItemCargoGlobal ["ItemGPS",1];
        _veh removeMagazinesTurret ["rhs_mag_og15v_20", [0]];

        _veh setObjectTextureGlobal [0,"rhsafrf\addons\rhs_bmp_camo\data\bmp_1_desert_co.paa"];
        _veh setObjectTextureGlobal [1,"rhsafrf\addons\rhs_bmp_camo\data\bmp_2_desert_co.paa"];
        _veh setObjectTextureGlobal [2,"rhsafrf\addons\rhs_bmp_camo\data\bmp_3_desert_co.paa"];
        _veh setObjectTextureGlobal [3,"rhsafrf\addons\rhs_bmp_camo\data\bmp_4_desert_co.paa"];
        _veh setObjectTextureGlobal [4,"rhsafrf\addons\rhs_bmp_camo\data\bmp_5_desert_co.paa"];
        _veh setObjectTextureGlobal [5,"rhsafrf\addons\rhs_bmp_camo\data\bmp_6_desert_co.paa"];

        ['AddCargoByClass', ['ACE_track', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    },
    format[''],
    0,
    0
];

_BTR70 = [
    ["rhs_btr70_msv"],
    "BTR-70",
    2,
    1000,
    1,
    [],
    {
        _veh = (_this select 0);
        clearWeaponCargoGlobal _veh;
        clearItemCargoGlobal _veh;
        clearBackpackCargoGlobal _veh;
        clearMagazineCargoGlobal _veh;
        
        _veh addItemCargoGlobal ["rhs_tsh4",3];
        _veh addItemCargoGlobal ["ItemGPS",1];

        ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;

        _veh setObjectTextureGlobal [0,"rhsafrf\addons\rhs_btr70_camo\data\btr70_1_sand_co.paa"];
        _veh setObjectTextureGlobal [1,"rhsafrf\addons\rhs_btr70_camo\data\btr70_2_sand_co.paa"];
    },
    format[''],
    0,
    0
];


_t72 = [
    ["rhs_t72ba_tv"],
    "T-72",
    1,
    3500,
    1,
    ["hide_com_shield",1,"sightElevationAPFSDS",0],
    {
    clearWeaponCargoGlobal (_this select 0);
    clearItemCargoGlobal (_this select 0);
    clearBackpackCargoGlobal (_this select 0);
    clearMagazineCargoGlobal (_this select 0);
    (_this select 0) addItemCargoGlobal ['ItemGPS',1];
    ['AddCargoByClass', ['ACE_track', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    (_this select 0) removeMagazinesTurret ["rhs_mag_3of26_5", [0]];
    (_this select 0) setObjectTextureGlobal [0,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_01a_sand_co.paa"];
    (_this select 0) setObjectTextureGlobal [1,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_02a_sand_co.paa"];
    (_this select 0) setObjectTextureGlobal [2,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_03_sand_co.paa"];
    (_this select 0) setObjectTextureGlobal [3,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_04_sand_co.paa"];
    },
    format[''],
    0,
    0
];

_MI8 = [
    ["RHS_Mi8mt_vvsc"],
    "Mi-8",
    2,
    2000,
    1,
    [],
    {
        _veh = (_this select 0); 
        clearWeaponCargoGlobal _veh;
        clearItemCargoGlobal _veh;
        clearBackpackCargoGlobal _veh;
        clearMagazineCargoGlobal _veh;
        _veh addItemCargoGlobal ["rhs_tsh4",3];
        _veh addItemCargoGlobal ["ItemGPS",1];
    },
    format[''],
    0,
    0
];



_mi24 = [
    ["RHS_Mi24V_AT_vvsc"],
    "Mi-24",
    1,
    3000,
    1,
    ["exhaust_hide",1,"at_rack_hide",1],
    {
        _veh = (_this select 0); 
        clearWeaponCargoGlobal _veh;
        clearItemCargoGlobal _veh;
        clearBackpackCargoGlobal _veh;
        clearMagazineCargoGlobal _veh;
        _veh addItemCargoGlobal ["rhs_tsh4",3];
        _veh addItemCargoGlobal ["ItemGPS",1];
        _veh removeMagazinesTurret ["rhs_mag_s8_40",[-1]]
    },
    format[''],
    0,
    0
];


suppliesOpfor setVariable ['BRDM', _BRDM, true];
suppliesOpfor setVariable ['BTR70', _BTR70, true];
suppliesOpfor setVariable ['BMP', _BMP, true];
suppliesOpfor setVariable ['T72', _t72, true];
suppliesOpfor setVariable ['MI8', _MI8, true];
suppliesOpfor setVariable ['MI24', _mi24, true];