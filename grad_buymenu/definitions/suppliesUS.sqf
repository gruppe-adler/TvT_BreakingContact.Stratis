// 0 spawn at ground,
// 1 spawn with chute,
// 2 spawn with heli carrier,
// 3 spawn with civilian driving it
// 4 spawn at water marker

private ["_transportHMMWV"];

if (IS_WOODLAND) then {
       _transportHMMWV = "rhsusf_m998_w_2dr_fulltop";
       mrzr4 = "rhsusf_mrzr4_w_mud";
       hmmwv_m2 = "rhsusf_m1025_w_m2";
       m113 = "rhsusf_m113_usarmy_M240";
       m113heavy = "rhsusf_m113_usarmy";
       ammocar_init = ["hide_CIP",1,"hide_BFT",1,"Hide_A2Bumper",1];
       ammocar = "rhsusf_m998_w_4dr_fulltop";
       uh60 = "RHS_UH60M_MEV2";
    } else {
       _transportHMMWV = "rhsusf_m998_d_2dr_fulltop";
       mrzr4 = "rhsusf_mrzr4_d_mud";
       hmmwv_m2 = "rhsusf_m1025_d_m2";
       m113 = "rhsusf_m113d_usarmy_M240";
       m113heavy = "rhsusf_m113d_usarmy";
       ammocar_init = ["hide_CIP",1,"hide_BFT",1,"Hide_A2Bumper",1];
       ammocar = "rhsusf_m998_d_4dr_fulltop";
       uh60 = "RHS_UH60M_MEV2";
    };


_mrzr4 = [
    [mrzr4],
    "MRZR4",
    4,
    200,
    1,
    [[], ["tailgateHide",1]],
    {
      _veh = (_this select 0);
      _veh addItemCargoGlobal ["ItemGPS",1];
      _veh addItemCargoGlobal ["U_B_Wetsuit",4];
      _veh addItemCargoGlobal ["V_RebreatherB",4];
      _veh addItemCargoGlobal ["G_B_Diving",4];
      _veh setVariable ["detachableBoat",1, true];
      _createAssaultBoat = ["CreateBoatAction", "Take Boat", "",
        {0 = [_veh] execVM 'player\carry\createBoat.sqf';},
        {(_veh getVariable ["detachableBoat", 0] > 0)}
      ] call ace_interact_menu_fnc_createAction;
      [mrzr4, 0, ["ACE_MainActions"],_createAssaultBoat] call ace_interact_menu_fnc_addActionToClass;
    },
    ['4x Diving Equipment', '1x Detachable Boat'],
    0,
    0
];

_transport = [
    [_transportHMMWV],
    "HMMWV Transport",
    6,
    250,
    1,
    [[], ["hide_CIP",1,"hide_BFT",1]],
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

_hmmwv_m2 = [
      [hmmwv_m2],
      "HMMWV M2",
      4,
      1000,
      1,
      [[], true],
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


_m113 = [
      [m113],
      "M113 M240",
      2,
      1300,
      1,
      [[], ["IFF_Panels_Hide",1]],
      {
      _veh = (_this select 0);
      [_veh] call GRAD_buymenu_fnc_clearInventory;
      _veh addItemCargoGlobal ['ItemGPS',1];
      ['AddCargoByClass', ['ACE_track', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
      },
      ['1 GPS'],
      0,
      0
];


_m113heavy = [
      [m113heavy],
      "M113 M2",
      2,
      1400,
      1,
      [[], ["IFF_Panels_Hide",1]],
      {
      _veh = (_this select 0);
      [_veh] call GRAD_buymenu_fnc_clearInventory;
      _veh addItemCargoGlobal ['ItemGPS',1];
      ['AddCargoByClass', ['ACE_track', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
      },
      ['1 GPS'],
      0,
      0
];



_ammocar = [
      [ammocar],
      "HMMWV Ammo",
      1,
      1500,
      1,
      ammocar_init,
      {
      _veh = (_this select 0);
      [_veh] call GRAD_buymenu_fnc_clearInventory;
      _veh addItemCargoGlobal ["ItemGPS",1];
      _veh addMagazineCargoGlobal ['SmokeShell',20];
      _veh addMagazineCargoGlobal ['SmokeShellRed',20];
      _veh addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow',30];
      _veh addMagazineCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag',30];
      _veh addMagazineCargoGlobal ['16Rnd_9x21_Mag',20];
      _veh addWeaponCargoGlobal ['rhs_weap_M136_hedp',4];
      _veh addMagazineCargoGlobal ['rhs_200rnd_556x45_T_SAW',10];
      _veh addMagazineCargoGlobal ['rhs_200rnd_556x45_M_SAW',10];
      _veh addMagazineCargoGlobal ['HandGrenade',20];
      _veh addMagazineCargoGlobal ['rhs_mag_m714_White',15];
      _veh addMagazineCargoGlobal ['rhs_mag_m713_Red',15];
      _veh addMagazineCargoGlobal ['rhs_mag_m661_green',15];
      _veh addMagazineCargoGlobal ["rhs_mag_smaw_HEAA",5];
      _veh addItemCargoGlobal ['ACE_Earplugs',15];
      _veh addItemCargoGlobal ['ACE_Morphine',40];
      _veh addItemCargoGlobal ['ACE_epinephrine',40];
      _veh addItemCargoGlobal ['ACE_fieldDressing',100];
      _veh addItemCargoGlobal ['ACE_bloodIV_250',20];
      _veh addItemCargoGlobal ['ItemGPS',5];
      _veh addItemCargoGlobal ['ACE_HuntIR_monitor',2];
      _veh addMagazineCargoGlobal ['ACE_HuntIR_M203',4];
      ['AddCargoByClass', ['ACE_wheel', _veh, 3], _veh] call CBA_fnc_targetEvent;
      ['AddCargoByClass', ['ACE_Track', _veh, 1], _veh] call CBA_fnc_targetEvent;
   

      },
      ['1 GPS', 'Ammunition incl AT4', 'Medic Stuff', 'Hunt IR'],
      0,
      0
];
_melb = [
      ["RHS_MELB_MH6M"],
      "MELB",
      1,
      2500,
      1,
      [[], []],
      {
      _veh = (_this select 0);
      [_veh] call GRAD_buymenu_fnc_clearInventory;
      _veh addItemCargoGlobal ['ACE_NVG_Wide',2];
      _veh addItemCargoGlobal ["ItemGPS",1];
      [_veh] call ace_fastroping_fnc_equipFRIES;
      _veh disableTIEquipment true;
      },
      ['1 GPS','No Thermals','Benches','FRIES equipped'],
      0,
      0
];
_uh60 = [
      [uh60],
      "UH-60",
      1,
      3000,
      1,
      [[], ["doors_hide",0,"Holder",0,"AddCargoHook_COver",0]],
      {
      _veh = (_this select 0);
      [_veh] call GRAD_buymenu_fnc_clearInventory;
      _veh addItemCargoGlobal ['ACE_NVG_Wide',2];
      _veh addItemCargoGlobal ["ItemGPS",1];
      [_veh] call ace_fastroping_fnc_equipFRIES;
      _veh setObjectTextureGlobal [0, "rhsusf\addons\rhsusf_a2port_air\UH60M\Data\uh60m_fuselage_co.paa"];
      _veh setObjectTextureGlobal [1, "rhsusf\addons\rhsusf_a2port_air\UH60M\Data\uh60m_engine_co.paa"];
      },
      ['1 GPS', 'FRIES equipped'],
      0,
      0
];

suppliesBlufor setVariable['transportHMMWV', _transport, true];
suppliesBlufor setVariable['mrzr4', _mrzr4, true];
suppliesBlufor setVariable['hmmwv_m2', _hmmwv_m2, true];
suppliesBlufor setVariable['m113', _m113, true];
suppliesBlufor setVariable['m113heavy', _m113heavy, true];
suppliesBlufor setVariable['ammocar', _ammocar, true];
suppliesBlufor setVariable['melb', _melb, true];
suppliesBlufor setVariable['mh60', _uh60, true];
