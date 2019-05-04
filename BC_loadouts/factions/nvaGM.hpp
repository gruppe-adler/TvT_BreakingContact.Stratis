class nvaGM {
    class AllUnits {
        primaryWeapon = "gm_mpiak74n_brn";
        primaryWeaponMagazine = "gm_30rnd_545x39mm_b_7n6_ak74_prp";
        primaryWeaponMuzzle = "";
        primaryWeaponPointer = "";
        primaryWeaponOptics = "";
        handgunWeapon = "";
        handgunWeaponMagazine = "";
        uniform = "gm_gc_army_uniform_soldier_80_str";
        vest = "gm_gc_army_vest_80_rifleman_str";
        backpack = "gm_gc_army_backpack_80_assaultpack_str";
        headgear = "gm_gc_army_headgear_m56_net";
        binoculars = "gm_df7x40_blk";
        map = "ItemMap";
        radio = "TFAR_fadak";
        compass = "gm_gc_compass_f73";
        watch = "gm_watch_kosei_80";
        nvgoggles = "";
        gps = "";
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
                LIST_6("gm_30rnd_545x39mm_b_7n6_ak74_prp"),
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
            backpack = "rhssaf_kitbag_smb";
            addItemsToVest[] = {
                "SmokeShell",
                LIST_7("gm_30rnd_545x39mm_b_7n6_ak74_prp"),
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
            primaryWeapon = "rhs_weap_pkp";
            primaryWeaponMuzzle = "";
            primaryWeaponMagazine = "rhs_100Rnd_762x54mmR_green";
            primaryWeaponPointer = "";
            primaryWeaponOptics = "rhs_acc_ekp8_02";
            vest = "rhs_6b13_6sh92_vog";
            backpack = "rhssaf_kitbag_smb";
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
            addItemsToBackpack[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_2("rhs_rpg7_PG7V_mag")
            };
        };
        class Soldier_AR_F: Soldier_F {
            primaryWeapon = "gm_lmgrpk74n_prp";
            primaryWeaponPointer = "";
            primaryWeaponOptics = "";
            primaryWeaponMagazine = "gm_45rnd_545x39mm_b_7n6_ak74_prp";
            primaryWeaponMuzzle = "";
            backpack = "gm_gc_army_backpack_80_lmg_str";
            addItemsToVest[] = {
                LIST_2("gm_handgrenade_frag_dm51"),
                LIST_2("rhs_mag_rdg2_white"),
                LIST_2("rhs_mag_rgd5"),
                "gm_45rnd_545x39mm_b_7n6_ak74_prp"
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_8("gm_45rnd_545x39mm_b_7n6_ak74_prp")
            };
        };

        class Soldier_AAR_F: Soldier_F {
            addItemsToVest[] = {
                LIST_2("gm_handgrenade_frag_dm51"),
                LIST_2("rhs_mag_rdg2_white"),
                LIST_2("rhs_mag_rgd5"),
                "rhs_75Rnd_762x39mm_tracer"
            };
        };
        //AT
        // gm_gc_army_antitank_mpiak74n_rpg7_80_str
        class Soldier_AT_F: Soldier_F {
            secondaryWeapon = "gm_rpg7_prp";
            secondaryWeaponMagazine = "gm_1rnd_40mm_heat_pg7v_rpg7";
            backpack = "gm_gc_army_backpack_80_at_str";
            addItemsToBackpack[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                "gm_1rnd_40mm_heat_pg7v_rpg7"
            };
        };
        class Soldier_A_F: Soldier_F {
            backpack = "rhssaf_kitbag_smb";
            addItemsToUniform[] = {
                "ACE_fieldDressing",
                "ACE_MapTools",
                "ACE_Flashlight_KSF1",
                LIST_2("rhs_mag_9x19_17")
            };
            addItemsToBackpack[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                LIST_4("rhs_100Rnd_762x54mmR_green")
            };
        };

        class Soldier_LAT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_rpg26";
            backpack = "rhs_assault_umbts";
            addItemsToVest[] = {
                "SmokeShell",
                LIST_7("gm_30rnd_545x39mm_b_7n6_ak74_prp"),
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                "rhs_rpg26_mag"
            };
        };

        class Medic_F: Soldier_F {
            addItemsToBackpack[] = {
                LIST_10("ACE_fieldDressing"),
                LIST_10("ACE_morphine"),
                LIST_10("ACE_epinephrine"),
                LIST_8("ACE_bloodIV_250"),
                LIST_2("gm_handgrenade_frag_dm51")
            };
        };
        class Soldier_TL_F: Soldier_F {
            gps = "ItemGPS";
            primaryWeapon = "rhs_weap_ak103_gp25_npz";
            primaryWeaponPointer = "";
            primaryWeaponMagazine = "rhs_30Rnd_762x39mm_polymer_tracer";
            handgunWeapon = "rhs_weap_pya";
            handgunWeaponMagazine = "rhs_mag_9x19_17";
            underBarrelMagazine = "rhs_VG40MD_White";
            backpack = "TFAR_mr3000_rhs";
            addItemsToUniform[] = {
                LIST_7("ACE_fieldDressing"),
                LIST_2("ACE_epinephrine"),
                LIST_2("ACE_morphine"),
                "ACE_key_east"
            };
            addItemsToVest[] = {
                LIST_2("rhs_mag_rdg2_white"),
                LIST_2("rhs_mag_rgd5"),
                LIST_5("rhs_30Rnd_762x39mm_polymer_tracer")
            };
            addItemsToBackpack[] = {
                "ACE_Flashlight_KSF1",
                LIST_2("ACE_tourniquet"),
                "rhs_mag_rdg2_white",
                LIST_3("rhs_30Rnd_762x39mm_polymer_tracer"),
                LIST_2("rhs_VG40MD_Green"),
                LIST_2("rhs_VG40MD_Red"),
                "rhs_VG40MD_White"
            };
        };
        class Soldier_SL_F: Soldier_TL_F {};
        class officer_F: Soldier_SL_F {};
        class Crew_F {};
        class Helipilot_F: Crew_F {};
    };
};