fillOpforLoadouts = {

	// Russian (emr summer)

	randUniformRussian = 
	[
	"rhs_uniform_emr_patchless"
	];

	randVestRussian = 
	[
	"rhs_6b23_digi",
	"rhs_6b23_digi_6sh92",
	"rhs_6b23_digi_6sh92_headset_mapcase",
	"rhs_6b23_digi_6sh92_radio",
	"rhs_6b23_digi_6sh92_vog",
	"rhs_6b23_digi_6sh92_vog_headset",
	"rhs_6b23_digi_crewofficer",
	"rhs_6b23_digi_crew",
	"rhs_6b23_digi_engineer",
	"rhs_6b23_digi_medic",
	"rhs_6b23_digi_rifleman",
	"rhs_6b23_digi_sniper"
	];

	randHeadGearRussian =
	[
	"rhs_6b27m_digi",
	"rhs_6b27m_digi_bala",
	"rhs_6b27m_digi_ess",
	"rhs_6b27m_digi_ess_bala"
	];

	randHeadGearRussianOfficer =
	[
	"rhs_fieldcap_digi",
	"rhs_fieldcap_helm_digi"
	];

	randBackPackRussian = [
	"rhs_sidor",
	"B_Carryall_oli",
	"rhs_assault_umbts",
	"rhs_assault_umbts_demo",
	"rhs_rpg_empty"
	];

	randWeaponRussian = 
	[
	"rhs_weap_M590_8RD",
	"rhs_weap_pkm",
	"rhs_weap_pkp",
	"rhs_weap_ak74m_2mag_camo",
	"rhs_weap_ak74m_2mag_npz",
	"rhs_weap_ak74m_camo_npz",
	"rhs_weap_ak74m_npz",
	"rhs_weap_ak103_npz",
	"hgun_P07_F"
	];

	randLauncherRussian = 
	[
	"rhs_weap_rpg7"
	];


	randLauncherTerrorists = 
	[
	"rhs_weap_rpg7"
	];


	loadoutInitOpforFinished = true;
};

fillOpforVariables = {

	customUniformOpfor = randUniformRussian call BIS_fnc_selectRandom;
	customVestOpfor = randVestRussian call BIS_fnc_selectRandom;
	customHeadgearOpfor = randHeadGearRussian call BIS_fnc_selectRandom;
	customBackpackOpfor = randBackPackRussian call BIS_fnc_selectRandom;
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
	
	this forceAddUniform customUniformOpfor;
	this addVest customVestOpfor;
	this addHeadgear customHeadgearOpfor;
	this addBackpack customBackpackOpfor;

	if (OPFORCE == 4) then {
		this setFace customHeadOpfor;
	};
	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";

};

// below currently not used
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
	
	this forceAddUniform customUniformOpfor;
	this addVest customVestOpfor;
	this addHeadgear customHeadgearOpfor;
	this addBackpack customBackpackOpfor;
	
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
	
	this forceAddUniform customUniformOpfor;
	this addVest customVestOpfor;
	this addHeadgear customHeadgearOpfor;
	this addBackpack customBackpackOpfor;
	
	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";

};

[] call fillOpforLoadouts;

waitUntil {loadoutInitOpforFinished};
[] call fillOpforVariables;
