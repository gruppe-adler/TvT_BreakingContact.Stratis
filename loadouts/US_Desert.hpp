
class US_Desert {
	class AllUnits {
        primaryWeapon = "rhs_weap_m4a1_carryhandle";
        primaryWeaponMagazine = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
		handgunWeapon = "rhsusf_weap_glock17g4";
		handgunWeaponMagazine = "rhsusf_mag_17Rnd_9x19_JHP";
		uniform = "rhs_uniform_cu_ocp"; // differentiate desert/woodland
		addItemsToUniform[] = {"acc_flashlight", LIST_6("ACE_fieldDressing"), LIST_2("ACE_morphine"), "ACE_epinephrine", "ACE_Flashlight_KSF1", "ACE_key_west", "ACE_MapTools", LIST_2("Chemlight_blue"), LIST_2("rhsusf_mag_17Rnd_9x19_JHP")};
		vest = "rhsusf_iotv_ocp_Squadleader";
		backpack = "rhsusf_assault_eagleaiii_coy";
		headgear = "rhsusf_mich_helmet_marpatd_headset";
		radio = "tf_anprc148jem";
	};

	class Type {
		class Soldier_F {
			primaryWeaponOptics = "rhsusf_acc_eotech_xps3";
			vest = "rhsusf_iotv_ocp_Squadleader";
			addItemsToVest[] = {"SmokeShell", "SmokeShellRed", LIST_2("HandGrenade")};
			addItemsToBackpack[] = {LIST_6("rhs_mag_30Rnd_556x45_M855A1_Stanag"), LIST_7("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow")};
		};
		class Soldier_AR_F {
			primaryWeapon = "rhs_weap_m249_pip_L";
			primaryWeaponMagazine = "rhs_200rnd_556x45_M_SAW";
			vest = "rhsusf_iotv_ocp_Repair";
			addItemsToVest[] = {"rhs_200rnd_556x45_T_SAW", LIST_2("SmokeShell"), LIST_2("SmokeShellRed"), "HandGrenade"};
			addItemsToBackpack[] = {"rhs_200rnd_556x45_M_SAW", "rhs_200rnd_556x45_T_SAW"};
		};
		class Soldier_AT_F {
			secondaryWeapon = "rhs_weap_M136_hedp";
			vest = "rhsusf_iotv_ocp_Repair";
			addItemsToVest[] = {LIST_5("rhs_mag_30Rnd_556x45_M855A1_Stanag"), LIST_6("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow"), LIST_2("SmokeShell"), LIST_2("SmokeShellRed")};
			backpack = "B_Carryall_khk";
			addItemsToBackpack[] = {LIST_3("rhs_mag_30Rnd_556x45_M855A1_Stanag"), LIST_3("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow")};
		};
		class Soldier_A_F {
			primaryWeaponOptics = "rhsusf_acc_eotech_xps3";
			primaryWeaponUnderbarrel = "rhsusf_acc_grip1";
			vest = "rhsusf_iotv_ocp_Repair";
			addItemsToVest[] = {LIST_5("rhs_mag_30Rnd_556x45_M855A1_Stanag"), LIST_6("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow"), LIST_2("SmokeShell"), LIST_2("SmokeShellRed")};
			backpack = "B_Carryall_khk";
			addItemsToBackpack[] = {LIST_2("rhs_200rnd_556x45_T_SAW"), LIST_3("rhs_200rnd_556x45_M_SAW")};
		};
		class Medic_F {
			primaryWeaponOptics = "rhsusf_acc_eotech_xps3";
			vest = "rhsusf_iotv_ocp_Medic";
			addItemsToVest[] = {LIST_5("rhs_mag_30Rnd_556x45_M855A1_Stanag"), LIST_6("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow"), LIST_4("SmokeShell"), LIST_2("SmokeShellRed")};
			addItemsToBackpack[] = {LIST_10("ACE_fieldDressing"), LIST_10("ACE_morphine"), LIST_10("ACE_epinephrine"), LIST_8("ACE_bloodIV_250"), LIST_2("HandGrenade")};
		};
		class Soldier_TL_F {
			primaryWeapon = "rhs_weap_m4a1_m203s";
			primaryWeaponOptics = "rhsusf_acc_eotech_xps3";
			vest = "rhsusf_iotv_ocp_Teamleader";
			addItemsToVest[] = {LIST_5("rhs_mag_30Rnd_556x45_M855A1_Stanag"), LIST_6("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow"), LIST_4("SmokeShell"), LIST_2("SmokeShellRed"), LIST_2("HandGrenade")};
			backpack = "tf_rt1523g_big_bwmod_tropen";
			addItemsToBackpack[] = {LIST_3("rhs_mag_M585_white"), LIST_2("rhs_mag_m662_red"), LIST_2("rhs_mag_m661_green"), LIST_3("rhs_mag_m713_Red"), LIST_3("rhs_mag_m714_White")};
			gps = "ItemGPS";
		};
		class Soldier_SL_F: Soldier_TL_F {
			vest = "rhsusf_iotv_ocp_Grenadier";
			headgear = "rhs_8point_marpatd";
		};
		class officer_F: Soldier_SL_F {};
		class Crew_F {
			primaryWeapon = "rhs_weap_m4a1_carryhandle_pmag";
			primaryWeaponOptics = "rhsusf_acc_eotech_xps3";
			vest = "rhsusf_iotv_ocp";
			addItemsToVest[] = {LIST_11("rhs_mag_30Rnd_556x45_M855A1_Stanag"), "SmokeShell"};
			addItemsToBackpack[] = {};
			headgear = "rhsusf_cvc_helmet";
		};
		class Helipilot_F: Crew_F {};
	};
};
