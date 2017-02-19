// 0 spawn at ground,
// 1 spawn with chute,
// 2 spawn with heli carrier,
// 3 spawn with civilian driving it
// 4 spawn at water marker

_civcar = [
    ["RDS_Lada_Civ_01", "RDS_Lada_Civ_02", "RDS_Lada_Civ_03", "RDS_Gaz24_Civ_01", "RDS_Gaz24_Civ_02", "RDS_Gaz24_Civ_03", "RHS_Ural_Civ_01", "RHS_Ural_Civ_02", "RHS_Ural_Civ_03"],
    "Civ Car (click to change)",
    14,
    200,
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
    "Motorbike (click to change)",
    14,
    100,
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

_technical = [
    ["I_G_Offroad_01_armed_F"],
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

_hideout = [
    ["AmmoCrate_NoInteractive_"],
    "Hideout (RPG-7)",
    10,
    400,
    1,
    [],
    {   
        deleteVehicle (_this select 0);
        [call US_VEHICLE_SPAWN, east, {
            _cache = (_this select 0);
            _cache addMagazineCargoGlobal ['rhs_30Rnd_762x39mm_tracer',20];
            _cache addMagazineCargoGlobal ['rhs_30Rnd_762x39mm',20];
            _cache addMagazineCargoGlobal ['rhs_rpg7_PG7VL_mag',3];
            _cache addMagazineCargoGlobal ['rhs_rpg7_PG7VR_mag',3];
            _cache addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR_green',5];
            _cache addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR',5];
            _cache addItemCargoGlobal ['ACE_Cellphone',3];
            _cache addItemCargoGlobal ['ACE_DeadManSwitch',1];
            _cache addMagazineCargoGlobal ['IEDUrbanBig_Remote_Mag',1];
            _cache addMagazineCargoGlobal ['IEDLandBig_Remote_Mag',1];
            _cache addMagazineCargoGlobal ['IEDUrbanSmall_Remote_Mag',2];
            _cache addMagazineCargoGlobal ['IEDLandSmall_Remote_Mag',2];
            _cache addMagazineCargoGlobal ['SatchelCharge_Remote_Mag',1];
        }, 1000,2000] call GRAD_weaponcaches_fnc_prepareCache;
    },
    format['Hideout marked on the map with RPG-7, IEDs and Ammunition'],
    0,
    0
];




suppliesBlufor setVariable['civcar', _civcar, true];
suppliesBlufor setVariable['motorbike', _motorbike, true];
suppliesBlufor setVariable['landrover', _technical, true];
suppliesBlufor setVariable['uazspg9', _uazspg9, true];
suppliesBlufor setVariable['hideout', _hideout, true];

