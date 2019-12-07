class mudscha {
    class AllUnits {
        primaryWeapon = "rhs_weap_m70b1";
        primaryWeaponMagazine = "rhs_30Rnd_762x39mm";
        primaryWeaponMuzzle = "";
        primaryWeaponPointer = "";
        primaryWeaponOptics = "";
        handgunWeapon = "";
        handgunWeaponMagazine = "";
        uniform[] = {   "LOP_U_AM_Fatigue_01",
                        "LOP_U_AM_Fatigue_01_2",
                        "LOP_U_AM_Fatigue_01_3",
                        "LOP_U_AM_Fatigue_01_4",
                        "LOP_U_AM_Fatigue_01_5",
                        "LOP_U_AM_Fatigue_01_6",
                        "LOP_U_AM_Fatigue_02",
                        "LOP_U_AM_Fatigue_02_2",
                        "LOP_U_AM_Fatigue_02_3",
                        "LOP_U_AM_Fatigue_02_4",
                        "LOP_U_AM_Fatigue_02_5",
                        "LOP_U_AM_Fatigue_02_6",
                        "LOP_U_AM_Fatigue_03",
                        "LOP_U_AM_Fatigue_03_2",
                        "LOP_U_AM_Fatigue_03_3",
                        "LOP_U_AM_Fatigue_03_4",
                        "LOP_U_AM_Fatigue_03_5",
                        "LOP_U_AM_Fatigue_03_6",
                        "LOP_U_AM_Fatigue_04",
                        "LOP_U_AM_Fatigue_04_2",
                        "LOP_U_AM_Fatigue_04_3",
                        "LOP_U_AM_Fatigue_04_4",
                        "LOP_U_AM_Fatigue_04_5",
                        "LOP_U_AM_Fatigue_04_6"
        };
        vest = "V_BandollierB_khk";
        backpack = "rhs_sidor";
        headgear[] = { 
                        "LOP_H_Turban",
                        "LOP_H_Turban",
                        "LOP_H_Pakol",
                        "LOP_H_Pakol",
                        "LOP_H_Pakol",
                        "LOP_H_Pakol"
        };
        binoculars = "Binocular";
        map = "ItemMap";
        radio = "TFAR_pnr1000a";
        compass = "ItemCompass";
        watch = "ItemWatch";
        nvgoggles = "";
        gps = "";
        goggles[] = {
                        "TRYK_Beard_BK",
                        "TRYK_Beard_BK2",
                        "TRYK_Beard_BK3",
                        "TRYK_Beard_BK4",
                        "TRYK_Beard_BW",
                        "TRYK_Beard_BK",
                        "TRYK_Beard_BK",
                        "TRYK_Beard_BK"
        };
    };

    class Type {
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_7("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_3("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_KSF1",
                "ACE_key_east"
            };
            addItemsToVest[] = {
                "SmokeShell",
                LIST_6("rhs_30Rnd_762x39mm"),
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white")
            };
            addItemsToBackpack[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine")
            };
        };
        class Engineer_F: Soldier_F {
            addItemsToVest[] = {
                "SmokeShell",
                LIST_7("rhs_30Rnd_762x39mm"),
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white")
            };
            addItemsToBackpack[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                "grad_axe",
                "ACE_EntrenchingTool",
                "ACE_DefusalKit"
            };
        };

        class HeavyGunner_F: Soldier_F {
            primaryWeapon = "rhs_weap_pkm";
            primaryWeaponMuzzle = "";
            primaryWeaponMagazine = "rhs_100Rnd_762x54mmR_green";
            primaryWeaponPointer = "";
            primaryWeaponOptics = "";
            vest = "V_BandollierB_khk";
            addItemsToVest[] = {
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                "rhs_100Rnd_762x54mmR_green"
            };
            addItemsToBackpack[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("rhs_100Rnd_762x54mmR_green")
            };
        };
        class Soldier_AHAT_F: Soldier_F {
            backpack = "rhs_rpg_empty";
            addItemsToBackpack[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("rhs_rpg7_PG7VR_mag")
            };
        };
        class Soldier_AR_F: Soldier_F {
            primaryWeapon = "rhs_weap_m70b1";
            primaryWeaponPointer = "";
            primaryWeaponOptics = "";
            primaryWeaponMagazine = "rhs_75Rnd_762x39_tracer";
            primaryWeaponMuzzle = "";
            backpack = "rhs_sidor";
            addItemsToVest[] = {
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                LIST_2("rhs_mag_rgd5"),
                "rhs_75Rnd_762x39_tracer"
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_8("rhs_75Rnd_762x39_tracer")
            };
        };

        class Soldier_AAR_F: Soldier_F {
            addItemsToVest[] = {
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                LIST_2("rhs_mag_rgd5"),
                "rhs_100Rnd_762x54mmR_green"
            };
        };
        //AT
        // gm_gc_army_antitank_mpiak74n_rpg7_80_str
        class Soldier_AT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_rpg7";
            secondaryWeaponMagazine = "rhs_rpg7_PG7VR_mag";
            backpack = "rhs_rpg_empty";
            vest = "V_BandollierB_khk";
            addItemsToBackpack[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                "rhs_rpg7_PG7VR_mag"
            };
        };
        class Soldier_A_F: Soldier_F {
            backpack = "rhs_sidor";
            addItemsToUniform[] = {
                "ACE_fieldDressing",
                "ACE_MapTools",
                "ACE_Flashlight_KSF1"
            };
            addItemsToBackpack[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_4("rhs_100Rnd_762x54mmR_green")
            };
        };


        // no rpg26 equivalent in GM, so only 1 shot for him
        class Soldier_LAT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_rpg7";
            backpack = "rhs_rpg_empty";
            addItemsToVest[] = {
                "SmokeShell",
                LIST_7("rhs_30Rnd_762x39mm"),
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                "rhs_rpg7_PG7VR_mag"
            };
        };

        class Medic_F: Soldier_F {
            backpack = "rhs_sidor";
            addItemsToBackpack[] = {
                LIST_10("ACE_fieldDressing"),
                LIST_10("ACE_morphine"),
                LIST_10("ACE_epinephrine"),
                LIST_8("ACE_bloodIV_250"),
                LIST_2("rhs_mag_rgd5")
            };
        };
        class Soldier_TL_F: Soldier_F {
            backpack = "TFAR_mr6000l";
            addItemsToUniform[] = {
                LIST_7("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                "ACE_key_east"
            };
            addItemsToVest[] = {
                LIST_2("rhs_mag_rdg2_white"),
                LIST_2("rhs_mag_rgd5"),
                LIST_5("rhs_30Rnd_762x39mm")
            };
            addItemsToBackpack[] = {
                "ACE_Flashlight_KSF1",
                LIST_2("ACE_tourniquet"),
                "rhs_mag_rdg2_white",
                LIST_3("rhs_30Rnd_762x39mm"),
            };
        };
        class Soldier_SL_F: Soldier_TL_F {};
        class officer_F: Soldier_SL_F {};
        class Crew_F {};
        class Helipilot_F: Crew_F {};
    };
};