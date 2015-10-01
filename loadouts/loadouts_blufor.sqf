blufor_uniform_d = "rhs_uniform_FROG01_d";
blufor_uniform_w = "rhs_uniform_FROG01_wd";

// woodland camo?
if ((ISLAND_TARGET_POSITIONS select (ISLANDS find worldName)) select 3) then {
	blufor_uniform = blufor_uniform_d;

	blufor_random_helmet = [
	"rhsusf_lwh_helmet_marpatwd"
	];
} else {
	blufor_uniform = blufor_uniform_w;

	blufor_random_helmet = [
	"rhsusf_mich_helmet_marpatd",
	"rhsusf_mich_helmet_marpatd_alt",
	"rhsusf_mich_helmet_marpatd_alt",
	"rhsusf_mich_helmet_marpatd_norotos_arc",
	"rhsusf_mich_bare_norotos_arc_tan"
	];
	
};


	blufor_random_primaryweapon = [
	"rhs_weap_m4a1_carryhandle_grip2",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_carryhandle_pmag",
	"rhs_weap_m4a1_carryhandle_grip"
	];

	blufor_random_mg = [
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_L_para",
	"rhs_weap_m249_pip_L_vfg",
	"rhs_weap_m249_pip_S",
	"rhs_weap_m249_pip_S_para",
	"rhs_weap_m249_pip_S_vfg"
	];

blufor_default = {
	
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
	
	this forceAddUniform blufor_uniform;
	this addVest "rhsusf_spc";
	this addHeadgear (blufor_random_helmet call BIS_fnc_selectRandom);
	this addBackpack "rhsusf_assault_eagleaiii_coy";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "rhsusf_mag_17Rnd_9x19_JHP", 3] call addItemsToUniform;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", 3] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addWeapon "rhsusf_weap_glock17g4";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_anprc148jem";

};

blufor_officer = {
	
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
	
	this forceAddUniform blufor_uniform;
	this addVest "rhsusf_spc_teamleader";
	this addHeadgear (blufor_random_helmet call BIS_fnc_selectRandom);
	this addBackpack "tf_rt1523g_big_bwmod_tropen";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "rhsusf_mag_17Rnd_9x19_JHP", 3] call addItemsToUniform;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", 3] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addWeapon "rhsusf_weap_glock17g4";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_anprc148jem";

};

blufor_medic = {
	
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
	
	this forceAddUniform blufor_uniform;
	this addVest "rhsusf_spc_corpsman";
	this addHeadgear (blufor_random_helmet call BIS_fnc_selectRandom);
	this addBackpack "rhsusf_assault_eagleaiii_coy";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "rhsusf_mag_17Rnd_9x19_JHP", 3] call addItemsToUniform;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", 3] call addMagazinesToBackpack;
	[this, "ACE_fieldDressing", 24] call addMagazinesToBackpack;
	[this, "ACE_Morphine", 12] call addMagazinesToBackpack;
	[this, "ACE_epinephrine", 9] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addWeapon "rhsusf_weap_glock17g4";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_anprc148jem";

};

blufor_marksman = {
	
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
	
	this forceAddUniform blufor_uniform;
	this addVest "rhsusf_spc_marksman";
	this addHeadgear (blufor_random_helmet call BIS_fnc_selectRandom);
	this addBackpack "rhsusf_assault_eagleaiii_coy";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "rhsusf_mag_17Rnd_9x19_JHP", 3] call addItemsToUniform;

	[this, "rhsusf_5Rnd_300winmag_xm2010", 12] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon "Leupold_Mk4";
	this addWeapon "rhsusf_weap_glock17g4";
	this addPrimaryWeaponItem "rhsusf_acc_ACOG_d";
	this addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_anprc148jem";
	this linkItem "rhs_scarf";

};

blufor_AT = {
	
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
	
	this forceAddUniform blufor_uniform;
	this addVest "rhsusf_spc_iar";
	this addHeadgear (blufor_random_helmet call BIS_fnc_selectRandom);
	this addBackpack "rhsusf_assault_eagleaiii_coy";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "rhsusf_mag_17Rnd_9x19_JHP", 3] call addItemsToUniform;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag", 6] call addMagazinesToBackpack;
	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", 3] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;


	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addWeapon "rhsusf_weap_glock17g4";
	this addWeapon "rhs_weap_M136_hedp";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_anprc148jem";

};

blufor_MG = {
	
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
	
	this forceAddUniform blufor_uniform;
	this addVest "rhsusf_spc_mg";
	this addHeadgear (blufor_random_helmet call BIS_fnc_selectRandom);
	this addBackpack "rhsusf_assault_eagleaiii_coy";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "rhsusf_mag_17Rnd_9x19_JHP", 3] call addItemsToUniform;

	[this, "rhs_200rnd_556x45_T_SAW", 2] call addMagazinesToBackpack;
	[this, "rhs_200rnd_556x45_M_SAW", 6] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	
	

	this addWeapon "Binocular";
	this addWeapon (blufor_random_mg call BIS_fnc_selectRandom);
	this addWeapon "rhsusf_weap_glock17g4";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_anprc148jem";

};


blufor_repair = {
	
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
	
	this forceAddUniform blufor_uniform;
	this addVest "rhsusf_spc_crewman";
	this addHeadgear (blufor_random_helmet call BIS_fnc_selectRandom);
	this addBackpack "rhsusf_assault_eagleaiii_coy";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "rhsusf_mag_17Rnd_9x19_JHP", 3] call addItemsToUniform;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", 3] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addWeapon "rhsusf_weap_glock17g4";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_anprc148jem";

};

blufor_crew = {
	
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
	
	this forceAddUniform blufor_uniform;
	this addVest "rhsusf_spc_crewman";
	this addHeadgear (blufor_random_helmet call BIS_fnc_selectRandom);
	this addBackpack "rhsusf_assault_eagleaiii_coy";

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "rhsusf_mag_17Rnd_9x19_JHP", 3] call addItemsToUniform;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag", 6] call addMagazinesToVest;
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow", 3] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (blufor_random_primaryweapon call BIS_fnc_selectRandom);
	this addWeapon "rhsusf_weap_glock17g4";
	this addPrimaryWeaponItem "optic_Aco";
	this addPrimaryWeaponItem "acc_flashlight";

	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_anprc148jem";

};
