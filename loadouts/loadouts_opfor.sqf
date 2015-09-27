addItemsToUniform = {
    _unit = _this select 0;
    _class = _this select 1;
    _amount = _this select 2;
    for "_i" from 1 to _amount do {
        _unit addItemToUniform _class;
    };
};

addMagazinesToVest = {
    _unit = _this select 0;
    _class = _this select 1;
    _amount = _this select 2;
    for "_i" from 1 to _amount do {
        _unit addItemToVest _class;
    };
};

addMagazinesToBackpack = {
    _unit = _this select 0;
    _class = _this select 1;
    _amount = _this select 2;
    for "_i" from 1 to _amount do {
        _unit addItemToBackpack _class;
    };
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
	this addVest "rhs_6b23_ML";
	this addHeadgear "H_Hat_HelmetT";
	this addBackpack "rhs_sidor";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "16Rnd_9x21_Mag", 3] call addItemsToUniform;

	[this, "rhs_30Rnd_762x39mm", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_30Rnd_762x39mm_tracer", 3] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";

};

opfor_officer = {
	
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

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "16Rnd_9x21_Mag", 3] call addItemsToUniform;

	[this, "rhs_30Rnd_762x39mm", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_30Rnd_762x39mm_tracer", 3] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";

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
	this addHeadgear "H_Hat_HelmetT";
	this addBackpack "rhs_sidor";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "16Rnd_9x21_Mag", 3] call addItemsToUniform;

	[this, "rhs_30Rnd_762x39mm", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_30Rnd_762x39mm_tracer", 3] call addMagazinesToBackpack;
	[this, "ACE_fieldDressing", 24] call addMagazinesToBackpack;
	[this, "ACE_Morphine", 12] call addMagazinesToBackpack;
	[this, "ACE_epinephrine", 9] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";

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
	this addHeadgear "H_Hat_HelmetT";
	this addBackpack "rhs_sidor";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "16Rnd_9x21_Mag", 3] call addItemsToUniform;

	[this, "rhs_10Rnd_762x54mmR_7N1", 9] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_30Rnd_762x39mm_tracer", 3] call addMagazinesToBackpack;
	

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_svdp_wd";
	this addWeapon "hgun_Rook40_F";
	this addPrimaryWeaponItem "rhsusf_acc_ACOG_d";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";
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
	this addHeadgear "H_Hat_HelmetT";
	this addBackpack "rhs_rpg_empty";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "16Rnd_9x21_Mag", 3] call addItemsToUniform;

	[this, "rhs_30Rnd_762x39mm", 6] call addMagazinesToBackpack;
	[this, "rhs_30Rnd_762x39mm_tracer", 3] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_rpg7_PG7VL_mag", 3] call addMagazinesToBackpack;
	

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	this addWeapon "rhs_weap_rpg7";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";

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
	this addHeadgear "H_Hat_HelmetT";
	this addBackpack "rhs_sidor";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "16Rnd_9x21_Mag", 3] call addItemsToUniform;

	[this, "rhs_100Rnd_762x54mmR_green", 2] call addMagazinesToBackpack;
	[this, "rhs_100Rnd_762x54mmR", 6] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	
	

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_pkm";
	this addWeapon "hgun_Rook40_F";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";

};


opfor_repair = {
	
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
	this addHeadgear "H_Hat_HelmetT";
	this addBackpack "rhs_sidor";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "16Rnd_9x21_Mag", 3] call addItemsToUniform;

	[this, "rhs_30Rnd_762x39mm", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_30Rnd_762x39mm_tracer", 3] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";

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
	this addHeadgear "H_Hat_HelmetT";
	this addBackpack "rhs_sidor";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "16Rnd_9x21_Mag", 3] call addItemsToUniform;

	[this, "rhs_30Rnd_762x39mm", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_30Rnd_762x39mm_tracer", 3] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_akm";
	this addWeapon "hgun_Rook40_F";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";

};
