// 0 spawn at ground,
// 1 spawn with chute,
// 2 spawn with heli carrier,
// 3 spawn with civilian driving it
// 4 spawn at water marker

_civcar = [
    ["RDS_Lada_Civ_01", "RDS_Lada_Civ_02", "RDS_Lada_Civ_03", "RDS_Gaz24_Civ_01", "RDS_Gaz24_Civ_02", "RDS_Gaz24_Civ_03", "RHS_Ural_Civ_01", "RHS_Ural_Civ_02", "RHS_Ural_Civ_03"],
    "Civ Car (random)",
    10,
    400,
    1,
    [],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
         (_this select 0) addItemCargoGlobal ["ItemGPS",1];
    },
    format[''],
    0,
    0
];

_motorbike = [
    ["RDS_JAWA353_Civ_01", "RDS_tt650_Civ_01"],
    "Motorbike",
    10,
    400,
    1,
    [],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
         (_this select 0) addItemCargoGlobal ["ItemGPS",1];
    },
    format[''],
    0,
    0
];

_landrover = [
    ["LOP_AM_Landrover_M2"],
    "Landrover M2",
    10,
    400,
    1,
    [],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
         (_this select 0) addItemCargoGlobal ["ItemGPS",1];
    },
    format[''],
    0,
    0
];

_uazspg9 = [
    ["rhsgref_ins_g_uaz_spg9"],
    "UAZ SPG9",
    10,
    400,
    1,
    [],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
         (_this select 0) addItemCargoGlobal ["ItemGPS",1];
    },
    format[''],
    0,
    0
];


suppliesBlufor setVariable['civcar', _civcar, true];
suppliesBlufor setVariable['motorbike', _motorbike, true];
suppliesBlufor setVariable['landrover', _landrover, true];
suppliesBlufor setVariable['uazspg9', _uazspg9, true];

