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

_BRM1K = [
    ["rhs_brm1k_msv"],
    "BRM1K",
    2,
    1000,
    1,
    [],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
        (_this select 0) addItemCargoGlobal ['ItemGPS',1];
        ['AddCargoByClass', ['ACE_track', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
    },
    format[''],
    0,
    0
];

_BTR80 = [
    ["rhs_btr80_msv"],
    "BTR-80",
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
        (_this select 0) addItemCargoGlobal ['ItemGPS',1];
        ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
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
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
        (_this select 0) addItemCargoGlobal ['ItemGPS',1];
    },
    format[''],
    0,
    0
];



_mi24 = [
    ["RHS_Mi24Vt_vvsc"],
    "Mi-24",
    1,
    3000,
    1,
    ["exhaust_hide",1,"at_rack_hide",1],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
        (_this select 0) addItemCargoGlobal ['ItemGPS',1];
    },
    format[''],
    0,
    0
];


suppliesOpfor setVariable ['BRDM', _BRDM, true];
suppliesOpfor setVariable ['BRM1K', _BRM1K, true];
suppliesOpfor setVariable ['BTR80', _BTR80, true];
suppliesOpfor setVariable ['MI8', _MI8, true];
suppliesOpfor setVariable ['MI24', _mi24, true];