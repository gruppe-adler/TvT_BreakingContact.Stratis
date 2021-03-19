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
        gps = "";
    };

    class Type {
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50"
            };
            addItemsToVest[] = {
                LIST_8("rhs_mag_30Rnd_556x45_M855A1_Stanag"),
                LIST_2("rhs_mag_m67"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_10("rhs_mag_30Rnd_556x45_M855A1_Stanag"),
                LIST_10("ACE_fieldDressing")
            };
        };

        // Engineer
        class Engineer_F: Soldier_F{
            backpack = "B_Kitbag_cbr";
            addItemsToBackpack[] = {
                "toolkit",
                "ACE_EntrenchingTool",
                "ACE_DefusalKit",
                "ACE_wirecutter",
                LIST_3("ACE_FlareTripMine_Mag")
            };
            addItemsToUniform[] = {
                LIST_8("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_tourniquet"),
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "ACE_key_west",
                "ACE_MapTools",
                "ACE_Flashlight_XL50"
            };
        };

        // Engineer SL
        class Soldier_repair_F: Engineer_F{
            gps = "ItemGPS";
            backpack = "TFAR_rt1523g_sage";
            addItemsToBackpack[] = {
                "toolkit",
                "ACE_EntrenchingTool",
                "ACE_DefusalKit"
            };
        };

        // Medium MG (M240B)
        class HeavyGunner_F: Soldier_F {
            primaryWeapon = "rhs_weap_m240B";
            primaryWeaponMagazine = "rhsusf_100Rnd_762x51_m62_tracer";
            addItemsToVest[] = {
                LIST_2("rhsusf_100Rnd_762x51_m62_tracer"),
                LIST_2("rhs_mag_m67"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_3("rhsusf_100Rnd_762x51_m62_tracer")
            };
        };

        // Ammo Bearer (M240B)
        class Soldier_A_F: Soldier_F {
            addItemsToBackpack[] = {
                LIST_6("rhsusf_100Rnd_762x51_m62_tracer")
            };
        };

        // Machine Gunner (M249)
        class Soldier_AR_F: Soldier_F {
            primaryWeapon = "rhs_weap_m249_pip_S";
            primaryWeaponMagazine = "rhsusf_200rnd_556x45_M855_mixed_box";
            addItemsToVest[] = {
                LIST_2("rhsusf_200rnd_556x45_M855_mixed_box"),
                LIST_2("rhs_mag_m67"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_4("rhsusf_200rnd_556x45_M855_mixed_box")
            };
        };

        /* 
        Ammo Bearer (M249) - aktuell nicht verbaut!!
        class Soldier_AAR_F: Soldier_F {
            addItemsToBackpack[] = {
                LIST_4("rhsusf_200rnd_556x45_M855_mixed_box")
            };
        };
        */

        // Heavy AT (Carl Gustav)
        class Soldier_AT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_maaws";
            secondaryWeaponMagazine = "rhs_mag_maaws_HEAT";
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
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "ACE_MapTools",
                "ACE_Flashlight_XL50",
                "rhs_m72a7_mag"
            };
        };

        // Medic
        class Medic_F: Soldier_F {
            backpack = "B_Kitbag_cbr";
            addItemsToBackpack[] = {
                LIST_5("ACE_tourniquet"),
                LIST_20("ACE_fieldDressing"),
                LIST_20("ACE_fieldDressing"),
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
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                "ACE_key_west",
                "ACE_MapTools",
                "ACE_Flashlight_XL50"
            };
            addItemsToVest[] = {
                LIST_8("rhs_mag_30Rnd_556x45_M855A1_Stanag"),
                LIST_2("rhs_mag_m67"),
                LIST_2("SmokeShell"),
                LIST_1("1Rnd_SmokeGreen_Grenade_shell"),
                LIST_4("1Rnd_SmokeRed_Grenade_shell"),
                LIST_3("1Rnd_Smoke_Grenade_shell")
            };
            addItemsToBackpack[] = {
                LIST_10("rhs_mag_30Rnd_556x45_M855A1_Stanag")
            };
        };

        // SquadLeader
        class Soldier_SL_F: Soldier_TL_F {
            backpack = "TFAR_rt1523g_sage";
        };

        // Commander
        class officer_F: Soldier_SL_F {};
        
        // Neue Klasse...
    };
};
