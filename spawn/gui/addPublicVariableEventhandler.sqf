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
       tigr = "rhs_tigr_m_vdv";
    } else {
        tigr = "rhs_tigr_m_3camo_vdv";
    };


     russianSupplies = [

        _this select 0,
        [
            "rhs_gaz66o_vdv",
            "GAZ-66",
            3,
            200,
            "<t align='center'>200 cr</t>",
            1,
            ["light_hide", 1],
            {
            clearWeaponCargoGlobal (_this select 0);
            clearItemCargoGlobal (_this select 0);
            clearBackpackCargoGlobal (_this select 0);
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addItemCargoGlobal ['ItemGPS',1];
            ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 11','Speed: 90','','1 GPS']
        ],
        [
            tigr,
            "GAZ Tigr-M",
            5,
            700,
            "<t align='center'>700 cr</t>",
            1,
            ["light_hide", 1],
            {
            clearWeaponCargoGlobal (_this select 0);
            clearItemCargoGlobal (_this select 0);
            clearBackpackCargoGlobal (_this select 0);
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addItemCargoGlobal ['ItemGPS',1];
            ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 7','Speed: 140','','1 GPS']
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
            (_this select 0) addMagazineCargoGlobal ['rhs_VG40OP_white',10];
            (_this select 0) addMagazineCargoGlobal ['rhs_VG40OP_green',10];
            (_this select 0) addItemCargoGlobal ['ACE_Earplugs',15];
            (_this select 0) addItemCargoGlobal ['ACE_Morphine',40];
            (_this select 0) addItemCargoGlobal ['ACE_epinephrine',40];
            (_this select 0) addItemCargoGlobal ['ACE_fieldDressing',100];
            (_this select 0) addItemCargoGlobal ['ItemGPS',5];
            (_this select 0) addItemCargoGlobal ['ACE_bloodIV_250',20];
            ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 3]] call ace_common_fnc_targetEvent;
            ['AddCargoByClass', _this select 0, ['ACE_Track', _this select 0, 1]] call ace_common_fnc_targetEvent;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5<br/>%6<br/>%7<br/>%8<br/>%9<br/>%10<br/>%11<br/>%12<br/>%13<br/>%14<br/>%15','Crew: 1','Seats: 1','Speed: 90','','Cargo:','40 Smokes','60 AK Mags','20 MG Mags','20 Grenades','30 GL Smokes','20 GL Flares','Medical Stuff','5 GPS','3 Repair Wheels','1 Repair Track']
        ],
        [
            "rhs_uaz_dshkm_chdkz",
            "UAZ-DshKm",
            5,
            900,
            "<t align='center'>900 cr</t>",
            1,
            ["light_hide", 1],
            {
            clearWeaponCargoGlobal (_this select 0);
            clearItemCargoGlobal (_this select 0);
            clearBackpackCargoGlobal (_this select 0);
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addItemCargoGlobal ['ItemGPS',1];
            (_this select 0) setObjectTextureGlobal [0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_ind_co.paa"];
            (_this select 0) setObjectTextureGlobal [1,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_mount_co.paa"];
            ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5<br/>%6<br/>%7<br/>%8<br/>%9','Crew: 2','Seats: 1','Speed: 121','','Weapons:','50x4 12.7mm','','1 GPS']
        ],
        [
            "rhs_btr60_vdv",
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
            (_this select 0) addItemCargoGlobal ['ItemGPS',1];
            ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5<br/>%6<br/>%7','Crew: 3','Seats: 15 (8 on top)','Speed: 80','','Weapons:','','250x5 7.62mm']
        ],
        [
            "rhs_t72ba_tv",
            "T-72",
            2,
            4800,
            "<t align='center'>4800 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0);
            clearItemCargoGlobal (_this select 0);
            clearBackpackCargoGlobal (_this select 0);
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addItemCargoGlobal ['ItemGPS',1];
            (_this select 0) removemagazinesturret ["rhs_mag_3of26_5",[0]];
            ['AddCargoByClass', _this select 0, ['ACE_Track', _this select 0, 2]] call ace_common_fnc_targetEvent;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5<br/>%6<br/>%7,<br/>%8<br/>%9,<br/>%10','Crew: 3','Speed: 60','','Weapons:','4x3 9M119','4x7 3BM42 KE','6x3 3BK18M HEAT','no HE!','250x7 7.62mm','8 Smoke']
        ],
        [
            "Ace_Box_Ammo",
            "Defense Pack",
            2,
            500,
            "<t align='center'>500 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0);
            clearItemCargoGlobal (_this select 0);
            clearBackpackCargoGlobal (_this select 0);
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addBackpackCargoGlobal ['RHS_DShkM_Gun_Bag',2];
            (_this select 0) addBackpackCargoGlobal ['RHS_DShkM_TripodHigh_Bag',2];
            (_this select 0) addItemCargoGlobal ['ACE_Sandbag_empty',100];
            },
            format['%1<br/>%2<br/>%3','100 Sandbags','2 Static Dshkm','(4 Backpacks)']
        ],
        [
            "Land_DataTerminal_01_F",
            "Detachable Radio Unit",
            1,
            1000,
            "<t align='center'>1000 cr</t>",
            1,
            [[]],
            {
            },
            format['%1<br/>%2<br/>%3','Detachable Radio Unit','','Detach the radio unit from the radio truck (ACE Interact) and drag it around. Sending takes up to 2x the time, depending on distance to relay (radio truck). Can also send alone. Radio truck cant anymore.']

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
            5,
            200,
            "<t align='center'>200 cr</t>",
            1,
            ["light_hide", 1 , "hide_backTop", 0, "hide_frontTop", 0 ],
            {
            clearWeaponCargoGlobal (_this select 0);
            clearItemCargoGlobal (_this select 0);
            clearBackpackCargoGlobal (_this select 0);
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addItemCargoGlobal ['ItemGPS',1];
            ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
            clearWeaponCargoGlobal _box;
            clearItemCargoGlobal _box;
            clearBackpackCargoGlobal _box;
            clearMagazineCargoGlobal _box;
            },
            format['%1<br/>%2<br/>%3<br/>%4','Crew: 1','Seats: 7','Speed: 109','1 GPS']
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
            (_this select 0) addItemCargoGlobal ['ItemGPS',1];
            ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 2]] call ace_common_fnc_targetEvent;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5<br/>%6<br/>%7<br/>%8','Crew: 1','Seats: 3','Speed: 109','','Weapons:','100x6 7.62','','1 GPS']
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
            (_this select 0) addItemCargoGlobal ['ItemGPS',1];
            ['AddCargoByClass', _this select 0, ['ACE_Track', _this select 0, 2]] call ace_common_fnc_targetEvent;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 2','Seats: 11','Speed: 67','','1 GPS']
        ],
        [
            m113_ammo,
            "M113 Ammo",
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
            (_this select 0) addWeaponCargoGlobal ['rhs_weap_M136_hedp',4];
            (_this select 0) addMagazineCargoGlobal ['rhs_200rnd_556x45_T_SAW',10];
            (_this select 0) addMagazineCargoGlobal ['rhs_200rnd_556x45_M_SAW',10];
            (_this select 0) addMagazineCargoGlobal ['HandGrenade',20];
            (_this select 0) addMagazineCargoGlobal ['rhs_mag_m714_White',15];
            (_this select 0) addMagazineCargoGlobal ['rhs_mag_m713_Red',15];
            (_this select 0) addMagazineCargoGlobal ['rhs_mag_m661_green',15];
            (_this select 0) addMagazineCargoGlobal ["rhs_mag_smaw_HEAA",5];
            (_this select 0) addItemCargoGlobal ['ACE_Earplugs',15];
            (_this select 0) addItemCargoGlobal ['ACE_Morphine',40];
            (_this select 0) addItemCargoGlobal ['ACE_epinephrine',40];
            (_this select 0) addItemCargoGlobal ['ACE_fieldDressing',100];
            (_this select 0) addItemCargoGlobal ['ACE_bloodIV_250',20];
            (_this select 0) addItemCargoGlobal ['ItemGPS',5];
            (_this select 0) setVariable ["detachableBoat",4];
            ['AddCargoByClass', _this select 0, ['ACE_wheel', _this select 0, 3]] call ace_common_fnc_targetEvent;
            ['AddCargoByClass', _this select 0, ['ACE_Track', _this select 0, 1]] call ace_common_fnc_targetEvent;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5<br/>%6<br/>%7<br/>%8<br/>%9<br/>%10<br/>%11<br/>%12<br/>%13<br/>%14<br/>%15<br/>%16','Crew: 2','Seats: 11','Speed: 67','','Cargo:','4 AT M136','40 Smokes','60 AK Mags','20 MG Mags','20 Grenades','30 Flares','Medical Stuff','5 GPS','4 Rubber Boats (ACE Interact)','3 Repair Wheels','1 Repair Track']
        ],
        [
            "B_Heli_Light_01_F",
            "MH-6",
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
            [(_this select 0)] call ace_fastroping_fnc_equipFRIES;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5','Crew: 1','Seats: 7','Speed: 245','','']
        ],
        [
            "rhsusf_CH53E_USMC",
            "CH-53E",
            1,
            4000,
            "<t align='center'>4000 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0);
            clearItemCargoGlobal (_this select 0);
            clearBackpackCargoGlobal (_this select 0);
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addBackpackCargoGlobal ['B_Parachute',30];
            [(_this select 0)] call ace_fastroping_fnc_equipFRIES;
            },
            format['%1<br/>%2<br/>%3<br/>%4<br/>%5<br/>%6','Crew: 2','Seats: 30','Speed: 295','','Extras:','30 Parachutes']
        ],
        [
            "Ace_Box_Ammo",
            "Recon Pack",
            2,
            800,
            "<t align='center'>800 cr</t>",
            1,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0);
            clearItemCargoGlobal (_this select 0);
            clearBackpackCargoGlobal (_this select 0);
            clearMagazineCargoGlobal (_this select 0);
(_this select 0) addBackpackCargoGlobal ['B_UAV_01_backpack_F',1];        //Darter
(_this select 0) addItemCargoGlobal ['B_UAVTerminal',2];                  //Terminals
            
            (_this select 0) addItemCargoGlobal ['ACE_HuntIR_monitor',2];
            (_this select 0) addMagazineCargoGlobal ['ACE_HuntIR_M203',4];
            },
            format['%1<br/>%2<br/>%3<br/>%4','1 Quadcopter UAV without thermal', '2 UAV terminal','4 HuntIR rounds','2 HuntIR monitors']
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
