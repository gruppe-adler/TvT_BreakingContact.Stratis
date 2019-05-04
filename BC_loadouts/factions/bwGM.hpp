class bwGM {
    class AllUnits {
        primaryWeapon = "rhs_weap_m4a1_carryhandle";
        primaryWeaponMagazine = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
        primaryWeaponPointer = "acc_flashlight";
        primaryWeaponOptics = "rhsusf_acc_eotech_xps3";
        handgunWeapon = "rhsusf_weap_m9";
        handgunWeaponMagazine = "rhsusf_mag_15Rnd_9x19_JHP";
        uniform = "rhs_uniform_FROG01_wd";
        vest = "rhsusf_mbav_rifleman";
        backpack = "rhsusf_assault_eagleaiii_coy";
        headgear = "rhsusf_lwh_helmet_marpatwd_headset_blk2";
        binoculars = "gm_ferod16_oli";
        map = "ItemMap";
        radio = "TFAR_anprc152";
        compass = "gm_ge_army_conat2";
        watch = "gm_watch_kosei_80";
        nvgoggles = "";
    };

    class Type {
        class Soldier_F {
            gps = "";
            addItemsToUniform[] = {
                LIST_7("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_3("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "ACE_key_west"
            };
            addItemsToVest[] = {
                LIST_6("rhs_mag_30Rnd_556x45_M855A1_Stanag"),
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_2("gm_handgrenade_frag_rgd5"),
                LIST_2("SmokeShell")
            };
        };
        class Engineer_F: Soldier_F{
            backpack = "rhssaf_kitbag_smb";
            addItemsToBackpack[] = {
                "toolkit",
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                "grad_axe",
                "ACE_EntrenchingTool",
                "ACE_DefusalKit"
            };
        };
        class HeavyGunner_F: Soldier_F {
            primaryWeapon = "rhs_weap_m240B";
            primaryWeaponMagazine = "rhsusf_100Rnd_762x51_m62_tracer";
            addItemsToUniform[] = {
                LIST_5("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_3("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50"
            };
            addItemsToVest[] = {
                "gm_handgrenade_frag_rgd5",
                "SmokeShell",
                "rhsusf_100Rnd_762x51_m62_tracer",
                "rhsusf_50Rnd_762x51"
            };
            addItemsToBackpack[] = {
                LIST_2("rhsusf_100Rnd_762x51_m62_tracer")
            };
        };
        class Soldier_AR_F: Soldier_F {
            primaryWeapon = "rhs_weap_m249_pip_S";
            primaryWeaponMagazine = "rhsusf_200rnd_556x45_M855_mixed_box";
            addItemsToUniform[] = {
                LIST_5("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_3("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP")
            };
            addItemsToVest[] = {
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "gm_handgrenade_frag_rgd5",
                LIST_2("SmokeShell"),
                "rhsusf_200rnd_556x45_M855_mixed_box"
            };
            addItemsToBackpack[] = {
                LIST_3("rhsusf_200rnd_556x45_M855_mixed_box")
            };
        };
        class Soldier_AAR_F: Soldier_F {
            addItemsToUniform[] = {
                LIST_5("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_3("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP")
            };
            addItemsToBackpack[] = {
                LIST_2("rhsusf_200rnd_556x45_M855_mixed_box")
            };
        };

        class Soldier_A_F: Soldier_F {
            addItemsToVest[] = {
                LIST_8("rhs_mag_30Rnd_556x45_M855A1_Stanag"),
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_2("gm_handgrenade_frag_rgd5"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_2("rhsusf_200rnd_556x45_M855_mixed_box")
            };
        };

        // heavy at
        class Soldier_AT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_maaws";
            secondaryWeaponMagazine = "rhs_mag_maaws_HEAT";
            backpack = "B_Carryall_cbr";
            addItemsToUniform[] = {
                LIST_5("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_3("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50"
            };
            addItemsToVest[] = {
                LIST_3("rhs_mag_30Rnd_556x45_M855A1_Stanag"),
                "SmokeShell"
            };
            addItemsToBackpack[] = {
                "rhs_mag_maaws_HEAT"
            };
        };

        // heavy at ammo carrier
        class Soldier_AAT_F: Soldier_F {
            addItemsToBackpack[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("rhs_mag_maaws_HEAT")
            };
        };

        class Soldier_LAT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_m72a7";
            addItemsToUniform[] = {
                LIST_5("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_3("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "rhs_m72a7_mag"
            };
        };

        class Medic_F: Soldier_F {
            backpack = "rhsusf_assault_eagleaiii_coy";
            addItemsToBackpack[] = {
                LIST_10("ACE_fieldDressing"),
                LIST_10("ACE_morphine"),
                LIST_10("ACE_epinephrine"),
                LIST_8("ACE_bloodIV_250"),
                LIST_2("gm_handgrenade_frag_rgd5")
            };
        };
        class Soldier_TL_F: Soldier_F {
            gps = "ItemGPS";
            primaryWeapon = "rhs_weap_m4a1_carryhandle_m203S";
            underBarrelMagazine = "1Rnd_Smoke_Grenade_shell";
            addItemsToUniform[] = {
                LIST_7("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_4("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "ACE_key_west"
            };
            addItemsToVest[] = {
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_2("gm_handgrenade_frag_rgd5"),
                LIST_2("SmokeShell"),
                LIST_3("rhs_mag_30Rnd_556x45_M855A1_Stanag"),
                LIST_5("1Rnd_SmokeGreen_Grenade_shell"),
                LIST_5("1Rnd_SmokeRed_Grenade_shell"),
                LIST_2("1Rnd_Smoke_Grenade_shell")
            };
            addItemsToBackpack[] = {
                LIST_5("rhs_mag_30Rnd_556x45_M855A1_Stanag")
            };
        };
        class Soldier_SL_F: Soldier_TL_F {
            backpack = "TFAR_rt1523g_sage";
            addItemsToUniform[] = {
                LIST_7("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_4("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "ACE_key_west"
            };
        };
        class officer_F: Soldier_SL_F {};
        class Crew_F {};
        class Helipilot_F: Crew_F {};
    };
};