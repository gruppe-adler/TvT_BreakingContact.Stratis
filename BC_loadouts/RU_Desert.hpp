class RU_Desert {
	class AllUnits {
		primaryWeapon = "rhs_weap_akm";
		primaryWeaponMagazine = "rhs_30Rnd_762x39mm";		
		handgunWeapon = "hgun_Rook40_F";
		handgunWeaponMagazine = "16Rnd_9x21_Mag";
		uniform = "rhs_uniform_flora_patchless_alt";
		addItemsToUniform[] = {"rhs_acc_2dpZenit", LIST_6("ACE_fieldDressing"), LIST_2("ACE_morphine"), "ACE_epinephrine", "ACE_Flashlight_MX991", "ACE_key_east", "ACE_MapTools", LIST_2("Chemlight_red"), LIST_2("16Rnd_9x21_Mag")};
		headgear = "rhs_6b27m_ml";
		radio = "tf_fadak";
	};
	class Type {
		class Soldier_F {
			vest = "rhs_6b23_ML_sniper";
			addItemsToVest[] = {"SmokeShell", "SmokeShellRed", LIST_2("rhs_mag_rgd5")};
			backpack = "rhs_sidor";
			addItemsToBackpack[] = {LIST_10("rhs_30Rnd_762x39mm")};
		};
		class Soldier_AR_F {
			primaryWeapon = "rhs_weap_pkm";
			primaryWeaponMagazine = "rhs_100Rnd_762x54mmR_green";
			vest = "rhs_6b23_ML_vydra_3m";
			addItemsToVest[] = {"rhs_100Rnd_762x54mmR_green", LIST_2("SmokeShell"), LIST_2("SmokeShellRed"), "rhs_mag_rgd5"};
			backpack = "rhs_sidor";
			addItemsToBackpack[] = {"rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"};
		};
		class Soldier_AT_F {
			secondaryWeapon = "rhs_weap_rpg7";
			vest = "rhs_6b23_ML_6sh92";
			addItemsToVest[] = {LIST_8("rhs_30Rnd_762x39mm"), LIST_2("SmokeShell")};
			backpack = "rhs_rpg_empty";
			addItemsToBackpack[] = {LIST_2("rhs_rpg7_PG7VL_mag")};
		};
		class Soldier_A_F {
			vest = "rhs_6b23_ML_sniper";
			addItemsToVest[] = {LIST_4("rhs_30Rnd_762x39mm"), LIST_2("rhs_30Rnd_762x39mm_tracer")};
			backpack = "rhs_sidor";
			addItemsToBackpack[] = {LIST_2("rhs_100Rnd_762x54mmR_green"), "rhs_100Rnd_762x54mmR"};
			binoculars = "Binocular";
			map = "ItemMap";
			radio = "tf_fadak";
			compass = "ItemCompass";
			watch = "ItemWatch";
		};
		class Medic_F {
			vest = "rhs_6b23_ML_medic";
			addItemsToVest[] = {LIST_4("rhs_30Rnd_762x39mm"), LIST_4("rhs_30Rnd_762x39mm_tracer")};
			backpack = "rhs_sidor";
			addItemsToBackpack[] = {LIST_10("ACE_fieldDressing"), LIST_10("ACE_morphine"), LIST_10("ACE_epinephrine"), LIST_8("ACE_bloodIV_250"), LIST_2("rhs_mag_rgd5")};
		};
		class Soldier_TL_F {
			primaryWeapon = "rhs_weap_akm_gp25";
			vest = "rhs_6b23_ML_6sh92_radio";
			addItemsToVest[] = {LIST_4("rhs_30Rnd_762x39mm"), LIST_3("rhs_30Rnd_762x39mm_tracer"), "SmokeShell"};
			backpack = "tf_mr3000_bwmod_tropen";
			addItemsToBackpack[] = {LIST_2("rhs_mag_rgd5"), LIST_4("rhs_GRD40_White"), LIST_2("rhs_GRD40_Green"), LIST_2("rhs_GRD40_Red"), LIST_3("rhs_VG40OP_green"), LIST_2("rhs_VG40OP_white")};
			gps = "ItemGPS";
		};
		class Soldier_SL_F: Soldier_TL_F {
			vest = "rhs_6b23_ML_6sh92_vog_headset";
			headgear = "rhs_fieldcap_ml";
		};
		class officer_F: Soldier_SL_F {};
		class Crew_F {
			vest = "rhs_6b23_ML_crew";
			addItemsToVest[] = {LIST_4("rhs_30Rnd_762x39mm"), LIST_2("rhs_30Rnd_762x39mm_tracer")};
			backpack = "rhs_sidor";
			addItemsToBackpack[] = {};
			headgear = "rhs_tsh4";
		};
	};
};
