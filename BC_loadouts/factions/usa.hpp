class USA {
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
        binoculars = "Binocular";
        map = "ItemMap";
        radio = "TFAR_anprc152";
        compass = "ItemCompass";
        watch = "ItemWatch";
        nvgoggles = "";
    };

    class Type {
        class Soldier_F {
            gps = "";
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "ACE_key_west"
            };
            addItemsToVest[] = {
                LIST_8("rhs_mag_30Rnd_556x45_M855A1_Stanag"),
                LIST_2("rhs_mag_m67"),
                LIST_2("SmokeShell")
            };
        };
        // Engineer
        class Engineer_F: Soldier_F{
            backpack = "rhssaf_kitbag_smb";
            addItemsToBackpack[] = {
                "toolkit",
                "ACE_EntrenchingTool",
                "ACE_DefusalKit",
                "ACE_wirecutter",
                LIST_3("ACE_FlareTripMine_Mag")
            };
        };
        // Engineer SL
        class Engineer_SL_F: Engineer_F{
            gps = "ItemGPS";
            backpack = "TFAR_rt1523g_sage";
            addItemsToBackpack[] = {
                "toolkit",
                "ACE_EntrenchingTool",
                "ACE_DefusalKit"
            };
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "ACE_key_west"
            };
        };
        // Medium MG (M240B)
        class HeavyGunner_F: Soldier_F {
            primaryWeapon = "rhs_weap_m240B";
            primaryWeaponMagazine = "rhsusf_100Rnd_762x51_m62_tracer";
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50"
            };
            addItemsToVest[] = {
                LIST_2("rhs_mag_m67"),
                LIST_2("SmokeShell"),
                LIST_2("rhsusf_100Rnd_762x51_m62_tracer")
            };
            addItemsToBackpack[] = {
                LIST_3("rhsusf_100Rnd_762x51_m62_tracer")
            };
        };
        // Machine Gunner (M249)
        class Soldier_AR_F: Soldier_F {
            primaryWeapon = "rhs_weap_m249_pip_S";
            primaryWeaponMagazine = "rhsusf_200rnd_556x45_M855_mixed_box";
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP")
            };
            addItemsToVest[] = {
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_2("rhs_mag_m67"),
                LIST_2("SmokeShell"),
                "rhsusf_200rnd_556x45_M855_mixed_box"
            };
            addItemsToBackpack[] = {
                LIST_4("rhsusf_200rnd_556x45_M855_mixed_box")
            };
        };
        // Ammo Bearer (M240B) ??? Nicht verbaut!!
        class Soldier_AAR_F: Soldier_F {
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP")
            };
            addItemsToBackpack[] = {
                LIST_6("rhsusf_100Rnd_762x51_m62_tracer")
            };
        };
        
        // Ammo Bearer (M240B)
        class Soldier_A_F: Soldier_F {
            addItemsToVest[] = {
                LIST_8("rhs_mag_30Rnd_556x45_M855A1_Stanag"),
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_2("rhs_mag_m67"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_6("rhsusf_100Rnd_762x51_m62_tracer")
            };
        };

        // Heavy AT (Carl Gustav)
        class Soldier_AT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_maaws";
            secondaryWeaponMagazine = "rhs_mag_maaws_HEAT";
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50"
            };
            addItemsToBackpack[] = {
                LIST_2("rhs_mag_maaws_HEAT")
            };
        };

        // HAT Ammo Carrier
        class Soldier_AAT_F: Soldier_F {
            addItemsToBackpack[] = {
                LIST_2("rhs_mag_maaws_HEAT")
            };
        };
      
        // LAT-Specialist (M72A7)
        class Soldier_LAT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_m72a7";
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "rhs_m72a7_mag"
            };
        };
        // Medic
        class Medic_F: Soldier_F {
            addItemsToBackpack[] = {
                LIST_40("ACE_fieldDressing"),
                LIST_20("ACE_morphine"),
                LIST_20("ACE_epinephrine"),
                LIST_20("ACE_bloodIV_250"),
                LIST_10("ACE_bloodIV_500"),
                LIST_5("SmokeShell")
            };
        };
        // TeamLeader
        class Soldier_TL_F: Soldier_F {
            gps = "ItemGPS";
            primaryWeapon = "rhs_weap_m4a1_carryhandle_m203S";
            underBarrelMagazine = "1Rnd_Smoke_Grenade_shell";
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "ACE_key_west"
            };
            addItemsToVest[] = {
                LIST_2("rhs_mag_m67"),
                LIST_2("SmokeShell"),
                LIST_3("rhs_mag_30Rnd_556x45_M855A1_Stanag"),
                LIST_5("1Rnd_SmokeGreen_Grenade_shell"),
                LIST_5("1Rnd_SmokeRed_Grenade_shell"),
                LIST_2("1Rnd_Smoke_Grenade_shell")
            };
            addItemsToBackpack[] = {
                LIST_10("rhs_mag_30Rnd_556x45_M855A1_Stanag")
            };
        };
        // SquadLeader
        class Soldier_SL_F: Soldier_TL_F {
            backpack = "TFAR_rt1523g_sage";
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
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
