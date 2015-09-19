
/*
parameter

IS_BLOCKED,MONEY_LEFT
VEHICLE 1 (classname, namedisplay, countleft, price, pricedisplay, eta)
VEHICLE 2 (classname, namedisplay, countleft, price, pricedisplay, eta)
VEHICLE 3 (classname, namedisplay, countleft, price, pricedisplay, eta)
VEHICLE 4 (classname, namedisplay, countleft, price, pricedisplay, eta)

*/

_russianCredits = _this select 0;
_mudschahedinCredits = _this select 1;




fillRussianSupplies = {

     russianSupplies = [

        _this select 0,
        [
            "rhs_tigr_ffv_3camo_vdv",
            "GAZ 233011",
            30,
            100,
            "<t align='center'>100 cr</t>",
            120,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            "rhs_gaz66o_vdv",
            "GAZ 66",
            99,
            15,
            "<t align='center'>15 cr</t>",
            60,
            ["light_hide", 0 ],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            "rhs_gaz66_ap2_vdv",
            "GAZ 66 AP2",
            4,
            700,
            "<t align='center'>700 cr</t>",
            180,
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
            1,
            2000,
            "<t align='center'>2000 cr</t>",
            180,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            "RHS_Mi24Vt_vvs",
            "Mi24VT",
            1,
            5000,
            "<t align='center'>4000 cr</t>",
            180,
            ["exhaust_hide", 1,"at_rack_hide", 0],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
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

fillMudschahedinSupplies = {

     mudschahedinSupplies = [

        _this select 0,
        [
            "LOP_TAK_Civ_UAZ",
            "UAZ",
            30,
            50,
            "<t align='center'>50 cr</t>",
            120,
            ["light_hide", 1 ],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            }
        ],
        [
            "LOP_AM_Landrover_M2",
            "Landrover M2",
            99,
            200,
            "<t align='center'>200 cr</t>",
            60,
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
            "10 RPG",
            2,
            1500,
            "<t align='center'>1500 cr</t>",
            180,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);  
            (_this select 0) addMagazineCargoGlobal ['rhs_rpg7_PG7VR_mag',3];
            (_this select 0) addMagazineCargoGlobal ['rhs_rpg7_PG7VL_mag',3];
            (_this select 0) addMagazineCargoGlobal ['rhs_rpg7_OG7V_mag',4];
            }
        ],
        [
            "Box_East_Wps_F",
            "6 IED",
            1,
            2000,
            "<t align='center'>2000 cr</t>",
            180,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0); 
            (_this select 0) addWeaponCargoGlobal ['IEDUrbanBig_F',2];  
            (_this select 0) addWeaponCargoGlobal ['IEDLandBig_F',2];
            (_this select 0) addWeaponCargoGlobal ['IEDLandSmall_F',1];
            (_this select 0) addWeaponCargoGlobal ['IEDUrbanSmall_F',1];
            (_this select 0) addItemCargoGlobal ['ACE_Cellphone',4];
            }
        ],
        [
            "Box_East_WpsSpecial_F",
            "2 FIM92 Stinger",
            1,
            3000,
            "<t align='center'>3000 cr</t>",
            180,
            [[]],
            {
            clearWeaponCargoGlobal (_this select 0); 
            clearItemCargoGlobal (_this select 0); 
            clearBackpackCargoGlobal (_this select 0); 
            clearMagazineCargoGlobal (_this select 0);
            (_this select 0) addWeaponCargoGlobal ['rhs_weap_fim92',2];
            (_this select 0) addWeaponCargoGlobal ['rhs_fim92_mag',4];
            }
        ]
    ];

    publicVariable "mudschahedinSupplies";



    "mudschahedinSupplies" addPublicVariableEventHandler {
        diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1,false,0,"","",""] call refreshMudschahedinUI;
    };

    "VEHICLE_ORDERED_EAST" addPublicVariableEventHandler {
    diag_log format [
            "%1 has been updated to: %2",
            _this select 0,
            _this select 1
        ];

        [_this select 1] call refreshMudschahedinOrder;
    };
};

[_russianCredits] call fillRussianSupplies;
[_mudschahedinCredits] call fillMudschahedinSupplies;