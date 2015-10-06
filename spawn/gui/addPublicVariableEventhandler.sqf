#include "\z\ace\addons\main\script_component.hpp"
/*
parameter

IS_BLOCKED,MONEY_LEFT
VEHICLE 1 (classname, namedisplay, countleft, price, pricedisplay, eta)
VEHICLE 2 (classname, namedisplay, countleft, price, pricedisplay, eta)
VEHICLE 3 (classname, namedisplay, countleft, price, pricedisplay, eta)
VEHICLE 4 (classname, namedisplay, countleft, price, pricedisplay, eta)

*/

_russianCredits = _this select 0;
_USCredits = _this select 1;




fillRussianSupplies = {

      // woodland camo?
    if ((ISLAND_TARGET_POSITIONS select (ISLANDS find worldName)) select 3) then {
       tigr = "rhs_tigr_ffv_3camo_vdv";
    } else {
        tigr = "rhs_tigr_ffv_vdv";
    };
    

     russianSupplies = [

        _this select 0,
        [
            "rhs_gaz66o_vdv",
            "GAZ-66 Transport",
            30,
            200,
            "<t align='center'>200 cr</t>",
            1,
            ["light_hide", 1],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            tigr,
            "GAZ Tigr",
            2,
            800,
            "<t align='center'>800 cr</t>",
            1,
            ["light_hide", 1],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            "rhs_gaz66_repair_vdv",
            "GAZ-66 Supply",
            2,
            1000,
            "<t align='center'>1000 cr</t>",
            1,
            ["light_hide", 1],
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
            (_this select 0) addItemCargoGlobal ['ACE_Earplugs',15];
            (_this select 0) addItemCargoGlobal ['ACE_Morphine',40];
            (_this select 0) addItemCargoGlobal ['ACE_epinephrine',40];
            (_this select 0) addItemCargoGlobal ['ACE_fieldDressing',100];
            (_this select 0) addItemCargoGlobal ['ItemGPS',5];
            ["AddCargoByClass", _this select 0, ["ACE_wheel", _this select 0, 2]] call ace_common_fnc_targetEvent;
            ["AddCargoByClass", _this select 0, ["ACE_Track", _this select 0, 1]] call ace_common_fnc_targetEvent;
            }
        ],
        [
            "rhs_btr60_vv",
            "BTR-60",
            3,
            2000,
            "<t align='center'>2000 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            "rhs_brm1k_vdv",
            "BRM1K",
            2,
            2500,
            "<t align='center'>2500 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            "rhs_t72ba_tv",
            "T-72",
            2,
            4500,
            "<t align='center'>4500 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            "B_CargoNet_01_Ammo_F",
            "2 Static MG",
            3,
            700,
            "<t align='center'>700 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addBackpackCargoGlobal ['RHS_NSV_Gun_Bag',2];
            (_this select 0) addBackpackCargoGlobal ['RHS_NSV_Tripod_Bag',2];
            }
        ]
    ];

    publicVariable "russianSupplies";



    "russianSupplies" addPublicVariableEventHandler {
        diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1,false,0,"","",""] call refreshRussianUI;
    };

    "VEHICLE_ORDERED_WEST" addPublicVariableEventHandler {
    diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1] call refreshRussianOrder;
    };
};

fillUSSupplies = {

    // woodland camo?
    if ((ISLAND_TARGET_POSITIONS select (ISLANDS find worldName)) select 3) then {
       hmmwv_transport = "rhsusf_m998_w_2dr_fulltop";
        hmmwv_m2 = "rhsusf_m1025_w_m2";
        m113_m2 = "rhsusf_m113_usarmy";
        m113_ammo = "rhsusf_m113_usarmy_supply";
    } else {
        hmmwv_transport = "rhsusf_m998_d_2dr_fulltop";
        hmmwv_m2 = "rhsusf_m1025_d_m2";
        m113_m2 = "rhsusf_m113d_usarmy";
        m113_ammo = "rhsusf_m113d_usarmy_supply";
    };

     USSupplies = [

        _this select 0,
        [
            hmmwv_transport,
            "HMMWV Transport",
            30,
            200,
            "<t align='center'>200 cr</t>",
            1,
            ["light_hide", 1 , "hide_backTop", 0, "hide_frontTop", 0 ],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            hmmwv_m2,
            "HMMWV M2",
            10,
            800,
            "<t align='center'>800 cr</t>",
            1,
            ["light_hide", 1 , "hide_backTop", 0, "hide_frontTop", 0 ],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            m113_m2,
            "M113 M2",
            2,
            1200,
            "<t align='center'>1200 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            m113_ammo,
            "M113 Supplies",
            1,
            1200,
            "<t align='center'>1200 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addMagazineCargoGlobal ['SmokeShell',20];
            (_this select 0) addMagazineCargoGlobal ['SmokeShellRed',20];
            (_this select 0) addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow',30];
            (_this select 0) addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag',30];
            (_this select 0) addMagazineCargoGlobal ['16Rnd_9x21_Mag',20];
            (_this select 0) addWeaponCargoGlobal ['rhs_weap_M136_hedp',10];
            (_this select 0) addMagazineCargoGlobal ['rhs_200rnd_556x45_T_SAW',10];
            (_this select 0) addMagazineCargoGlobal ['rhs_200rnd_556x45_M_SAW',10];
            (_this select 0) addMagazineCargoGlobal ['HandGrenade',20]; 
            (_this select 0) addMagazineCargoGlobal ['rhs_mag_M585_white',15]; 
            (_this select 0) addMagazineCargoGlobal ['rhs_mag_m662_red',15]; 
            (_this select 0) addMagazineCargoGlobal ['rhs_mag_m661_green',15];           
            (_this select 0) addItemCargoGlobal ['ACE_Earplugs',15];
            (_this select 0) addItemCargoGlobal ['ACE_Morphine',40];
            (_this select 0) addItemCargoGlobal ['ACE_epinephrine',40];
            (_this select 0) addItemCargoGlobal ['ACE_fieldDressing',100];
            (_this select 0) addItemCargoGlobal ['ItemGPS',5];
            ["AddCargoByClass", _this select 0, ["ACE_wheel", _this select 0, 2]] call ace_common_fnc_targetEvent;
            ["AddCargoByClass", _this select 0, ["ACE_Track", _this select 0, 1]] call ace_common_fnc_targetEvent;
            }
        ],
        [
            "B_CargoNet_01_Ammo_F",
            "Javelin",
            2,
            2000,
            "<t align='center'>2000 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addWeaponCargoGlobal ['rhs_weap_fgm148',1];
            (_this select 0) addWeaponCargoGlobal ['rhs_fgm148_magazine_AT',1];
            }
        ],
        [
            "B_Heli_Light_01_F",
            "MH-6",
            2,
            2000,
            "<t align='center'>2000 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            "RHS_UH60M",
            "UH-60M",
            1,
            3500,
            "<t align='center'>3500 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) setVehicleAmmo 0.4;
            }
        ]
    ];

    publicVariable "USSupplies";



    "USSupplies" addPublicVariableEventHandler {
        diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1,false,0,"","",""] call refreshUSUI;
    };

    "VEHICLE_ORDERED_EAST" addPublicVariableEventHandler {
    diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1] call refreshUSOrder;
    };
};

[_russianCredits] call fillRussianSupplies;
[_USCredits] call fillUSSupplies;