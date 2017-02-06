// 0 spawn at ground,
// 1 spawn with chute,
// 2 spawn with heli carrier,
// 3 spawn with civilian driving it
// 4 spawn at water marker

if (IS_WOODLAND) then {
       mrzr4 = "rhsusf_mrzr4_w_mud";
       mrap_init = ["DUKE_Hide",1];
       hmmwv_m2 = "rhsusf_m1025_w_m2";
       hemtt_init = ["hide_spare",1];
       hemtt = "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd";
    } else {
       mrzr4 = "rhsusf_mrzr4_d_mud";
       mrap_init = ["DUKE_Hide",1];
       hmmwv_m2 = "rhsusf_m1025_d_m2";
       hemtt_init = ["hide_spare",1];
       hemtt = "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d";
    };

_mrzr4 = [
    [mrzr4],
    "MRZR4",
    10,
    400,
    1,
    ["tailgateHide",1],
    {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
        (_this select 0) addItemCargoGlobal ["U_B_Wetsuit",6];
        (_this select 0) addItemCargoGlobal ["V_RebreatherB",6];
        (_this select 0) addItemCargoGlobal ["G_B_Diving",6];
        (_this select 0) setVariable ["detachableBoat",1];
        _createAssaultBoat = ["CreateBoatAction", "Take Boat", "",
          {0 = [_this select 0] execVM 'player\carry\createBoat.sqf';},
          {((_this select 0) getVariable ["detachableBoat", 0] > 0)}
        ] call ace_interact_menu_fnc_createAction;
        [mrzr4, 0, ["ACE_MainActions"],_createAssaultBoat] call ace_interact_menu_fnc_addActionToClass;
    },
    format[''],
    0,
    0
];

_hmmwv_m2 = [
      [hmmwv_m2],
      "HMMWV M2",
      8,
      1000,
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

_mrap = [
      ["rhsusf_M1232_M2_usarmy_wd"],
      "MRAP M1232 M2",
      6,
      1500,
      1,
      mrap_init,
      {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
        (_this select 0) addItemCargoGlobal ['ItemGPS',1];
        ['AddCargoByClass', ['ACE_wheel', _this select 0, 2], _this select 0] call CBA_fnc_targetEvent;
      },
      format[''],
      0,
      0
];

_ammo = [
      [hemtt],
      "Ammo HEMTT M2",
      4,
      1500,
      1,
      hemtt_init,
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
        ['AddCargoByClass', ['ACE_wheel', _this select 0, 3], _this select 0] call CBA_fnc_targetEvent;
        ['AddCargoByClass', ['ACE_Track', _this select 0, 1], _this select 0] call CBA_fnc_targetEvent;
        _createAssaultBoat = ["CreateBoatAction", "Take Boat", "",
            {0 = [_this select 0] execVM 'player\carry\createBoat.sqf';},
            {((_this select 0) getVariable ["detachableBoat", 0] > 0)}
          ] call ace_interact_menu_fnc_createAction;
          ["rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d", 0, ["ACE_MainActions"],_createAssaultBoat] call ace_interact_menu_fnc_addActionToClass;
      },
      format[''],
      0,
      0
];
_melb = [
      ["RHS_MELB_MH6M"],
      "MELB",
      3,
      2500,
      1,
      [],
      {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
        (_this select 0) addItemCargoGlobal ['ACE_NVG_Wide',2];
        (_this select 0) addItemCargoGlobal ["ItemGPS",1];
        [(_this select 0)] call ace_fastroping_fnc_equipFRIES;
        (_this select 0) disableTIEquipment true;
      },
      format[''],
      0,
      0
];
_ch53 = [
      ["rhsusf_CH53E_USMC"],
      "CH-53",
      1,
      4000,
      1,
      [],
      {
        clearWeaponCargoGlobal (_this select 0);
        clearItemCargoGlobal (_this select 0);
        clearBackpackCargoGlobal (_this select 0);
        clearMagazineCargoGlobal (_this select 0);
        (_this select 0) addItemCargoGlobal ['ACE_NVG_Wide',2];
        (_this select 0) addBackpackCargoGlobal ['B_Parachute',30];
        [(_this select 0)] call ace_fastroping_fnc_equipFRIES;
      },
      format[''],
      0,
      0
];
_recon_box = [
    ["Ace_Box_Ammo"],
    "Recon Box",
    2,
    800,
    1,
    [],
    {
      clearWeaponCargoGlobal (_this select 0);
      clearItemCargoGlobal (_this select 0);
      clearBackpackCargoGlobal (_this select 0);
      clearMagazineCargoGlobal (_this select 0);
      (_this select 0) addItemCargoGlobal ['ACE_HuntIR_monitor',2];
      (_this select 0) addMagazineCargoGlobal ['ACE_HuntIR_M203',4];
    },
    format [''],
    0,
    0
];

suppliesBlufor setVariable['mrzr4', _mrzr4, true];
suppliesBlufor setVariable['hmmwv_m2', _hmmwv_m2, true];
suppliesBlufor setVariable['mrap', _mrap, true];
suppliesBlufor setVariable['ammo', _ammo, true];
suppliesBlufor setVariable['melb', _melb, true];
suppliesBlufor setVariable['ch53', _ch53, true];
suppliesBlufor setVariable['recon_box', _recon_box, true];
