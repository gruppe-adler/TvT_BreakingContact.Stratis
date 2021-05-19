class PAVN {
    class AllUnits {
        binoculars = "vn_mk21_binocs";
        map = "ItemMap";
        radio = "vn_o_item_radio_m252";
        compass = "ItemCompass";
        watch = "ItemWatch";
        nvgoggles = "";
        gps = "";
    };

    class Type {
        class Soldier_F {
            uniform = "vn_o_uniform_nva_army_09_01";
            vest = "vn_o_vest_01";
            backpack = "vn_o_pack_05_type56_pl";
            headgear = "vn_o_helmet_nva_06";
            primaryWeapon = "vn_type56_bayo";
            primaryWeaponMagazine = "vn_type56_t_mag";
            primaryWeaponPointer = "vn_b_type56";
            handgunWeapon = "vn_pm";
            handgunWeaponMagazine = "vn_pm_mag";
            addItemsToUniform[] = {
                LIST_1("ACE_MapTools"),
                LIST_1("ACE_DefusalKit"),
                LIST_2("ACE_CableTie"),
                LIST_1("ACE_Flashlight_MX991"),
                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine"),
                "ACE_key_east"
            };
            addItemsToVest[] = {
                LIST_2("vn_pm_mag"),
                LIST_1("vn_rdg2_mag"),
                LIST_2("vn_rg42_grenade_mag")
            };
            addItemsToBackpack[] = {
                LIST_2("vn_o_item_firstaidkit"),
                LIST_8("vn_type56_t_mag"),
                LIST_2("vn_rdg2_mag"),
                LIST_2("vn_rgd5_grenade_mag"),
                LIST_2("vn_rkg3_grenade_mag"),
                LIST_1("vn_mine_satchel_remote_02_mag"),
                LIST_1("vn_mine_punji_01_mag")
            };
        };

        // Engineer
        class Engineer_F: Soldier_F {
            uniform = "vn_o_uniform_nva_army_03_01";
            vest = "vn_o_vest_vc_01";
            backpack = "vn_o_pack_02_eng_ppsh_pl";
            headgear = "vn_o_helmet_nva_06";
            addItemsToVest[] = {
                LIST_1("vn_ppsh41_35_t_mag"),
                LIST_1("vn_rdg2_mag"),
                LIST_2("vn_t67_grenade_mag")
            };
            addItemsToBackpack[] = {
                "ACE_EntrenchingTool",
                "ACE_DefusalKit",
                "ACE_wirecutter",
                LIST_3("ACE_FlareTripMine_Mag")
            };
        };

        // Engineer SL
        class Soldier_repair_F: Engineer_F{
            gps = "ItemGPS";
            addItemsToBackpack[] = {
                "toolkit",
                "ACE_EntrenchingTool",
                "ACE_DefusalKit"
            };
        };

        // RPD Gunner (Medium Machine Gun)
        class HeavyGunner_F: Soldier_F {
            uniform = "vn_o_uniform_nva_army_09_01";
            vest = "vn_o_vest_03";
            backpack = "vn_o_pack_04_rpd_pl";
            headgear = "vn_o_helmet_nva_06";
            primaryWeapon = "vn_rpd";
            primaryWeaponMagazine = "vn_rpd_100_mag";
            addItemsToVest[] = {
                LIST_2("vn_rpd_100_mag"),
                LIST_2("vn_t67_grenade_mag")
            };
            addItemsToBackpack[] = {
                LIST_2("vn_o_item_firstaidkit"),
                LIST_4("vn_rpd_100_mag"),
                LIST_2("vn_rdg2_mag"),
                LIST_2("vn_rg42_grenade_mag")
            };
        };

        // Ammo Bearer (PKP)
        class Soldier_A_F: Soldier_F {
            addItemsToBackpack[] = {
                LIST_4("vn_rpd_100_mag")
            };
        };

        // RPD Machine Gunner - no second type of MG for VN available
        class Soldier_AR_F: Soldier_F {
            uniform = "vn_o_uniform_nva_army_09_01";
            vest = "vn_o_vest_03";
            backpack = "vn_o_pack_04_rpd_pl";
            headgear = "vn_o_helmet_nva_06";
            primaryWeapon = "vn_rpd";
            primaryWeaponMagazine = "vn_rpd_100_mag";
            addItemsToVest[] = {
                LIST_2("vn_rpd_100_mag"),
                LIST_2("vn_t67_grenade_mag")
            };
            addItemsToBackpack[] = {
                LIST_2("vn_o_item_firstaidkit"),
                LIST_4("vn_rpd_100_mag"),
                LIST_2("vn_rdg2_mag"),
                LIST_2("vn_rg42_grenade_mag")
            };
        };

        /* 
        Ammo Bearer (AKM) - aktuell nicht verbaut!!
        class Soldier_AAR_F: Soldier_F {
            backpack = "rhssaf_kitbag_md2camo";
            addItemsToBackpack[] = {
                LIST_8("rhs_75Rnd_762x39mm_tracer")
            };
        };
        */

        // Heavy AT-Specialist (RPG7)
        class Soldier_AT_F: Soldier_F {
            uniform = "vn_o_uniform_nva_army_02_01";
            vest = "vn_o_vest_02";
            backpack = "vn_o_pack_03_rpg7_sks_pl";
            headgear = "vn_o_helmet_nva_06";
            primaryWeapon = "vn_sks";
            primaryWeaponMagazine = "vn_sks_t_mag";
            secondaryWeapon = "vn_rpg7";
            secondaryWeaponMagazine = "vn_rpg7_mag";
            addItemsToVest[] = {
                LIST_2("vn_t67_grenade_mag")
            };
            addItemsToBackpack[] = {
                LIST_2("vn_o_item_firstaidkit"),
                LIST_10("vn_sks_t_mag"),
                LIST_3("vn_rpg7_mag"),
                LIST_2("vn_rdg2_mag")
            };
        };

        // Assistant Heavy AT (RPG7)
        class Soldier_AHAT_F: Soldier_F {
            addItemsToBackpack[] = {
                LIST_2("vn_rpg7_mag")
            };
        };

        // LAT-Specialist (B40)
        class Soldier_LAT_F: Soldier_F {
            secondaryWeapon = "vn_rpg2";
            secondaryWeaponMagazine = "vn_rpg2_mag";
        };

        // Medic
        class Medic_F: Soldier_F {
            uniform = "vn_o_uniform_nva_army_02_01";
            vest = "vn_o_vest_06";
            backpack = "vn_o_pack_02_medic_ppsh_pl";
            headgear = "vn_o_helmet_nva_06";
            addItemsToVest[] = {
                LIST_2("vn_rdg2_mag")
            };
            addItemsToBackpack[] = {    
                LIST_5("ACE_tourniquet"),
                LIST_20("ACE_fieldDressing"),
                LIST_20("ACE_fieldDressing"),
                LIST_20("ACE_morphine"),
                LIST_20("ACE_epinephrine"),
                LIST_20("ACE_bloodIV_250"),
                LIST_10("ACE_bloodIV_500"),
                LIST_5("rhs_mag_rdg2_white")
            };
        };

        // TeamLeader
        class Soldier_TL_F: Soldier_F {
            gps = "ItemGPS";
            uniform = "vn_o_uniform_nva_army_01_01";
            vest = "vn_o_vest_07";
            headgear = "vn_o_helmet_nva_06";
            addItemsToVest[] = {
                LIST_1("vn_rdg2_mag"),
                LIST_2("vn_t67_grenade_mag")
            };
        };

        // SquadLeader
        class Soldier_SL_F: Soldier_TL_F {
            backpack = "vn_o_pack_t884_01";
        };

        // Commander
        class officer_F: Soldier_SL_F {};

       // Neue Klasse...
    };
};
