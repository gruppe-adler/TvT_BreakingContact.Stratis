set_akm_ammo = {
	this = _this select 0;
	[this, "rhs_30Rnd_762x39mm", 5] call addMagazinesToVest; // 5 (1 in der waffe)
	[this, "rhs_30Rnd_762x39mm_tracer", 5] call addMagazinesToVest; // 3
};


opfor_basic = {
	this = _this select 0;

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "ACE_Flashlight_MX991", 1] call addItemsToUniform;
	[this, "ACE_key_east", 1] call addItemsToUniform;
	[this, "ACE_MapTools", 1] call addItemsToUniform;
	[this, "Chemlight_red", 2] call addItemsToUniform;
	

	[this, "16Rnd_9x21_Mag", 3] call addItemsToUniform;

	this addPrimaryWeaponItem "acc_flashlight";
	this addWeapon "hgun_Rook40_F";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";
};

opfor_default = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_rifleman";
	this addHeadgear "rhs_6b27m_ml";
	this addBackpack "rhs_sidor";
	

	[this, "rhs_30Rnd_762x39mm", 14] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 1] call addMagazinesToVest;
	[this, "SmokeShellRed", 1] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 2] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	
	[this] call opfor_basic;

};

opfor_sql = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_crewofficer";
	this addHeadgear "rhs_fieldcap_ml";
	this addBackpack "tf_rt1523g_big";

	[this] call set_akm_ammo;
	
	[this, "SmokeShell", 4] call addMagazinesToVest; // 1 weiß angekommen
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_mag_rgd5", 2] call addMagazinesToBackpack; // beide angekommen

	[this, "rhs_GRD40_White", 4] call addMagazinesToBackpack;
	[this, "rhs_GRD40_Green", 3] call addMagazinesToBackpack;
	[this, "rhs_GRD40_Red", 3] call addMagazinesToBackpack;
	

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm_gp25";
	this addWeapon "hgun_Rook40_F";
	

	this linkItem "ItemGPS";
	this linkItem "ItemMap";
	[this] call opfor_basic;

};

opfor_ftl = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_crewofficer";
	this addHeadgear "rhs_fieldcap_ml";
	this addBackpack "tf_rt1523g_big";

	[this] call set_akm_ammo;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_mag_rgd5", 2] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	this linkItem "ItemGPS";
	
	[this] call opfor_basic;

};

opfor_medic = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_medic";
	this addHeadgear "rhs_6b27m_ml";
	this addBackpack "rhs_sidor";

	[this] call set_akm_ammo;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "ACE_fieldDressing", 40] call addMagazinesToBackpack;
	[this, "ACE_Morphine", 20] call addMagazinesToBackpack;
	[this, "ACE_epinephrine", 20] call addMagazinesToBackpack;
	[this, "ACE_bloodIV_250", 12] call addMagazinesToBackpack;

	[this, "rhs_mag_rgd5", 2] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	
	[this] call opfor_basic;

};

opfor_marksman = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_sniper";
	this addHeadgear "rhs_6b27m_ml";

	[this, "rhs_10Rnd_762x54mmR_7N1", 9] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;
	

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_svdp_wd";
	this addWeapon "hgun_Rook40_F";
	this addPrimaryWeaponItem "rhsusf_acc_ACOG_d";
	[this] call opfor_basic;
	this linkItem "rhs_balaclava";

};

opfor_AT = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_engineer";
	this addHeadgear "rhs_6b27m_ml";
	this addBackpack "rhs_rpg_empty";

	[this] call set_akm_ammo;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	[this, "rhs_rpg7_PG7VL_mag", 3] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	this addWeapon "rhs_weap_rpg7";
	[this] call opfor_basic;

};

opfor_MG = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_6sh92_vog";
	this addHeadgear "rhs_6b27m_ml";
	this addBackpack "rhs_sidor";

	[this, "rhs_100Rnd_762x54mmR_green", 1] call addMagazinesToVest;
	[this, "rhs_100Rnd_762x54mmR", 2] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	
	

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_pkm";
	this addWeapon "hgun_Rook40_F";

	[this, "rhs_100Rnd_762x54mmR_green", 1] call addMagazinesToBackpack;

	[this] call opfor_basic;

};


opfor_engineer = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_6sh92_headset";
	this addHeadgear "rhs_6b27m_ml";
	this addBackpack "rhs_sidor";

	[this] call set_akm_ammo;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	
	[this] call opfor_basic;

};

opfor_crew = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_6sh92_headset";
	this addHeadgear "rhs_tsh4";
	this addBackpack "rhs_sidor";

	[this] call set_akm_ammo;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	
	[this] call opfor_basic;

};

opfor_ammobearer = {
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform "rhs_uniform_flora_patchless_alt";
	this addVest "rhs_6b23_ML_6sh92_headset";
	this addHeadgear "rhs_6b27m_ml";
	this addBackpack "rhs_sidor";

	[this] call set_akm_ammo;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	[this, "rhs_100Rnd_762x54mmR_green", 2] call addMagazinesToBackpack;
	[this, "rhs_100Rnd_762x54mmR", 6] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	
	[this] call opfor_basic;
};