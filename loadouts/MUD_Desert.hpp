class MUD_Desert {
	class AllUnits {
		primaryWeapon = "rhs_weap_akm";
		primaryWeaponMagazine = "rhs_30Rnd_762x39mm";
		uniform = "LOP_U_AM_Fatigue_01";
		addItemsToUniform[] = {LIST_6("ACE_fieldDressing"), LIST_2("ACE_morphine"), "ACE_epinephrine", "ACE_Flashlight_MX991", "ACE_key_east", "ACE_MapTools", LIST_2("Chemlight_red"), LIST_2("rhs_30Rnd_762x39mm")};
		headgear = "LOP_H_Turban";
		radio = "tf_fadak";
	};
	class Type {
		class Soldier_F {
			backpack = "rhs_sidor";
			addItemsToBackpack[] = {LIST_8("rhs_30Rnd_762x39mm"),"SmokeShell", "SmokeShellRed", LIST_2("rhs_mag_rgd5")};
		};
		class Soldier_AR_F {
			primaryWeapon = "rhs_weap_pkm";
			backpack = "rhs_sidor";
			addItemsToBackpack[] = {"rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"};
		};
		class Soldier_AT_F {
			secondaryWeapon = "rhs_weap_rpg7";
			addItemsToVest[] = {LIST_8("rhs_30Rnd_762x39mm"), LIST_2("SmokeShell")};
			backpack = "rhs_rpg_empty";
			addItemsToBackpack[] = {LIST_2("rhs_rpg7_PG7VL_mag")};
		};
		class Soldier_A_F {
			backpack = "rhs_sidor";
			addItemsToBackpack[] = {LIST_2("rhs_100Rnd_762x54mmR_green"), "rhs_100Rnd_762x54mmR"};
			binoculars = "Binocular";
			map = "ItemMap";
			radio = "tf_fadak";
			compass = "ItemCompass";
			watch = "ItemWatch";
		};
		class Medic_F {
			backpack = "rhs_sidor";
			addItemsToBackpack[] = {LIST_5("rhs_30Rnd_762x39mm"), LIST_10("ACE_fieldDressing"), LIST_10("ACE_morphine"), LIST_10("ACE_epinephrine"), LIST_4("ACE_bloodIV_250"), LIST_2("rhs_mag_rgd5")};
		};
		class Soldier_TL_F {
			primaryWeapon = "rhs_weap_akm_gp25";
			backpack = "tf_mr3000_bwmod_tropen";
			addItemsToBackpack[] = {LIST_4("rhs_30Rnd_762x39mm"), LIST_2("rhs_mag_rgd5"), LIST_2("rhs_GRD40_White"), "rhs_GRD40_Green", "rhs_GRD40_Red", LIST_2("rhs_VG40OP_white")};
			gps = "ItemGPS";
		};
		class Soldier_SL_F: Soldier_TL_F {
			headgear = "LOP_H_Turban_mask";
		};
		class officer_F: Soldier_SL_F {};
		class Crew_F {
			backpack = "rhs_sidor";
			addItemsToBackpack[] = {LIST_4("rhs_30Rnd_762x39mm"), LIST_2("rhs_30Rnd_762x39mm_tracer")};
			headgear = "rhs_tsh4";
		};
	};
};
