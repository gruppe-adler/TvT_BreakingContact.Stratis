class USVN {
    class AllUnits {
        binoculars = "vn_m19_binocs_grey";
        map = "ItemMap";
        radio = "vn_b_item_radio_urc10";
        compass = "ItemCompass";
        watch = "ItemWatch";
        nvgoggles = "";
        gps = "";
    };

    class Type {
        class Soldier_F {
            uniform = "vn_b_uniform_macv_04_01";
            vest = "vn_b_vest_usarmy_02";
            backpack = "vn_b_pack_lw_01_m16_pl";
            headgear = "vn_b_helmet_m1_07_01";
            primaryWeapon = "vn_m16";
            primaryWeaponMagazine = "vn_m16_20_t_mag";
            handgunWeapon = "vn_m10";
            handgunWeaponMagazine = "vn_m10_mag";
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
                "ACE_key_west"
            };
            addItemsToVest[] = {
                LIST_2("vn_m16_20_t_mag")
            };
            addItemsToBackpack[] = {
                LIST_2("vn_b_item_firstaidkit"),
                LIST_10("vn_m16_20_t_mag"),
                LIST_4("vn_m61_grenade_mag"),
                LIST_1("vn_mine_m18_mag")
            };
        };

        // Engineer
        class Engineer_F: Soldier_F{
            uniform = "vn_b_uniform_macv_04_01";
            vest = "vn_b_vest_usarmy_11";
            backpack = "vn_b_pack_lw_04_eng_m1897_pl";
            headgear = "vn_b_helmet_m1_05_01";
            primaryWeapon = "vn_m1897";
            primaryWeaponMagazine = "vn_m1897_buck_mag";
            secondaryWeapon = "vn_m72";
            secondaryWeaponMagazine = "vn_m72_mag";
            binoculars = "vn_m19_binocs_grn";
            map = "vn_b_item_map";
            compass = "vn_b_item_compass";
            watch = "vn_b_item_watch";
            gps = "";
            radio = "vn_b_item_radio_urc10";
            nvgoggles = "";
            addItemsToVest[] = {
                LIST_1("vn_m1897_buck_mag")
            };
            addItemsToBackpack[] = {
                LIST_8("vn_m1897_buck_mag"),
                LIST_8("vn_m1897_fl_mag"),
                LIST_4("vn_m61_grenade_mag"),
                LIST_2("vn_m18_yellow_mag"),
                "ACE_EntrenchingTool",
                "ACE_DefusalKit",
                "ACE_wirecutter",
                LIST_3("ACE_FlareTripMine_Mag")
            };
        };

        // Engineer SL
        class Soldier_repair_F: Engineer_F{
            gps = "ItemGPS";
            backpack = "TFAR_rt1523g_sage";
            addItemsToBackpack[] = {
                "ACE_EntrenchingTool",
                "ACE_DefusalKit"
            };
        };

        // Medium MG (M240B)
        class HeavyGunner_F: Soldier_F {
            uniform[] = {"vn_b_uniform_macv_05_01", "vn_b_uniform_macv_06_01"};
            vest = "vn_b_vest_usarmy_06";
            backpack = "vn_b_pack_lw_02_m60_pl";
            headgear[] = {"vn_b_helmet_m1_08_01", "vn_b_helmet_m1_08_02"};
            primaryWeapon = "vn_m60";
            primaryWeaponMagazine = "vn_m60_100_mag";
            handgunWeapon = "vn_m1911";
            handgunWeaponMagazine = "vn_m1911_mag";
            addItemsToVest[] = {
                LIST_1("vn_m60_100_mag")
            };
            addItemsToBackpack[] = {
                LIST_6("vn_m60_100_mag"),
                LIST_4("vn_m61_grenade_mag"),
                LIST_2("vn_m18_yellow_mag"),
                LIST_2("vn_mine_m14_mag")
            };
        };

        // Ammo Bearer (M240B)
        class Soldier_A_F: Soldier_F {
            uniform = "vn_b_uniform_macv_06_01";
            backpack = "vn_b_pack_trp_01";
            addItemsToBackpack[] = {
                LIST_6("vn_m60_100_mag")
            };
        };

        // Machine Gunner (M249)
        class Soldier_AR_F: Soldier_F {
            uniform[] = {"vn_b_uniform_macv_04_01"};
            vest = "vn_b_vest_usarmy_03";
            backpack = "vn_b_pack_02_02_rpd_pl";
            headgear = "vn_b_bandana_02";
            primaryWeapon = "vn_rpd";
            primaryWeaponMagazine = "vn_rpd_100_mag";
            addItemsToVest[] = {
                LIST_1("vn_rpd_100_mag"),
                LIST_2("vn_m61_grenade_mag"),
                LIST_1("vn_m7_grenade_mag"),
                LIST_1("vn_m14_grenade_mag")
            };
            addItemsToBackpack[] = {
                LIST_2("vn_b_item_firstaidkit"),
                LIST_4("vn_rpd_100_mag"),
                LIST_4("vn_m61_grenade_mag"),
                LIST_2("vn_m18_yellow_mag"),
                LIST_1("vn_m34_grenade_mag"),
                LIST_6("vn_mine_m14_mag"),
                LIST_2("vn_mine_m18_range_mag")
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
            uniform = "vn_b_uniform_macv_05_01";
            vest = "vn_b_vest_usarmy_02";
            backpack = "vn_b_pack_trp_03_02_m16_pl";
            headgear = "vn_b_bandana_01";
            primaryWeapon = "vn_m16";
            primaryWeaponMagazine = "vn_m16_20_t_mag";
            secondaryWeapon = "vn_m72";
            secondaryWeaponMagazine = "vn_m72_mag";
            addItemsToBackpack[] = {
                LIST_2("vn_b_item_firstaidkit"),
                LIST_10("vn_m16_20_t_mag"),
                LIST_4("vn_m67_grenade_mag"),
                LIST_2("vn_mine_m18_mag")
            };
        };

        // HAT Ammo Carrier -- same as AT bc no heavy AT in this mod
        class Soldier_AAT_F: Soldier_AT_F {
        };
      
        // LAT-Specialist (M72A7) -- same as AT bc no heavy AT in this mod
        class Soldier_LAT_F: Soldier_AT_F {
        };

        // Medic
        class Medic_F: Soldier_F {
            uniform = "vn_b_uniform_macv_03_01";
            vest = "vn_b_vest_usarmy_07";
            backpack = "vn_b_pack_m5_01_medic_m16_pl";
            headgear = "vn_b_helmet_m1_04_01";
            primaryWeapon = "vn_m16";
            primaryWeaponMagazine = "vn_m16_20_t_mag";
            addItemsToBackpack[] = {
                LIST_5("ACE_tourniquet"),
                LIST_20("ACE_fieldDressing"),
                LIST_20("ACE_fieldDressing"),
                LIST_20("ACE_morphine"),
                LIST_20("ACE_epinephrine"),
                LIST_20("ACE_bloodIV_250"),
                LIST_10("ACE_bloodIV_500"),
                LIST_5("SmokeShell"),     
                LIST_2("vn_m61_grenade_mag"),
                LIST_2("vn_m18_yellow_mag"),
                LIST_2("vn_m18_purple_mag")
            };
        };

        // TeamLeader
        class Soldier_TL_F: Soldier_F {
            gps = "ItemGPS";
            uniform = "vn_b_uniform_macv_02_01";
            vest = "vn_b_vest_usarmy_02";
            headgear = "vn_b_helmet_m1_03_01";
            primaryWeapon = "vn_xm177";
            primaryWeaponMagazine = "vn_m16_20_t_mag";
            secondaryWeapon = "vn_m72";
            secondaryWeaponMagazine = "vn_m72_mag";
            addItemsToBackpack[] = {
                LIST_2("vn_b_item_firstaidkit"),
                LIST_10("vn_m16_20_t_mag"),
                LIST_2("vn_m61_grenade_mag"),
                LIST_2("vn_m18_yellow_mag"),
                LIST_2("vn_m18_purple_mag")
            };
        };

        // SquadLeader
        class Soldier_SL_F: Soldier_TL_F {
            backpack = "vn_b_pack_lw_06_m16_pl";
        };

        // Commander
        class officer_F: Soldier_SL_F {};
        
        // Neue Klasse...
    };
};
