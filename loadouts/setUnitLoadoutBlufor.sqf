_isWoodlandCamo = ((ISLAND_TARGET_POSITIONS select (ISLANDS find worldName)) select 3);

blufor_uniform_d = "rhs_uniform_cu_ocp";
blufor_uniform_w = "rhs_uniform_FROG01_wd";

blufor_random_primaryweapon = selectRandom [
	"rhs_weap_m4a1_carryhandle_grip2",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_carryhandle_pmag",
	"rhs_weap_m4a1_carryhandle_grip"
];

blufor_random_helmet_w = selectRandom [
	"rhsusf_mich_helmet_marpatwd",
	"rhsusf_mich_helmet_marpatwd_alt",
	"rhsusf_mich_helmet_marpatwd_norotos_arc",
	"rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
	"rhsusf_mich_helmet_marpatwd_norotos_headset",
	"rhsusf_mich_helmet_marpatwd_headset"
];

blufor_random_helmet_d = selectRandom [
	"rhsusf_mich_helmet_marpatd_headset",
	"rhsusf_mich_helmet_marpatd_norotos_arc",
	"rhsusf_mich_helmet_marpatd_norotos_arc_headset",
	"rhsusf_mich_helmet_marpatd_norotos_headset",
	"rhsusf_mich_helmet_marpatd_alt_headset"
];

_blufor_helmet_boss_d = "rhs_8point_marpatd";
_blufor_helmet_boss_w = "rhs_8point_marpatwd";

blufor_random_mg = selectRandom [
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_L_para",
	"rhs_weap_m249_pip_L_vfg",
	"rhs_weap_m249_pip_S",
	"rhs_weap_m249_pip_S_para",
	"rhs_weap_m249_pip_S_vfg"
];

blufor_helmet_crew_d = "rhsusf_cvc_helmet";
blufor_helmet_crew_w = "rhsusf_cvc_green_helmet";

_blufor_radio_lr_w = "tf_rt1523g_big_bwmod";
_blufor_radio_lr_d = "tf_rt1523g_big_bwmod_tropen";

_blufor_helmet = blufor_random_helmet_d;	
_blufor_helmet_crew = blufor_helmet_crew_d;
_blufor_uniform = blufor_uniform_d;

_blufor_radio_lr = _blufor_radio_lr_d;

_blufor_helmet_boss = _blufor_helmet_boss_d;

if (_isWoodlandCamo) then {
	_blufor_helmet = blufor_random_helmet_w;	
	_blufor_helmet_crew = blufor_helmet_crew_w;
	_blufor_uniform = blufor_uniform_w;

	_blufor_radio_lr = _blufor_radio_lr_w;

	_blufor_helmet_boss = _blufor_helmet_boss_w;
};




blufor_rifleman = [
	[blufor_random_primaryweapon,"","","rhsusf_acc_eotech_xps3",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
	[_blufor_uniform,[["acc_flashlight",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_KSF1",1],["ACE_key_west",1],["ACE_MapTools",1],["Chemlight_blue",2,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
	["rhsusf_iotv_ocp_Squadleader",[["SmokeShell",1,1],["SmokeShellRed",1,1],["HandGrenade",2,1]]],
	["rhsusf_assault_eagleaiii_coy",[["rhs_mag_30Rnd_556x45_M855A1_Stanag",6,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",7,30]]],
	_blufor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_anprc148jem","ItemCompass","ItemWatch",""]
];

blufor_mg = [
	[blufor_random_mg,"","","",["rhs_200rnd_556x45_M_SAW",200],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
	[_blufor_uniform,[["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_KSF1",1],["ACE_key_west",1],["ACE_MapTools",1],["Chemlight_blue",2,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
	["rhsusf_iotv_ocp_Repair",[["rhs_200rnd_556x45_T_SAW",1,200],["SmokeShell",2,1],["SmokeShellRed",2,1],["HandGrenade",1,1]]],
	["rhsusf_assault_eagleaiii_coy",[["rhs_200rnd_556x45_M_SAW",1,200],["rhs_200rnd_556x45_T_SAW",1,200]]],
	_blufor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_anprc148jem","ItemCompass","ItemWatch",""]
];


blufor_at = [
	[blufor_random_primaryweapon,"","","",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],["rhs_weap_M136_hedp","","","",["rhs_m136_hedp_mag",1],[],""],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
	[_blufor_uniform,[["acc_flashlight",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_KSF1",1],["ACE_key_west",1],["ACE_MapTools",1],["Chemlight_blue",2,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
	["rhsusf_iotv_ocp_Repair",[["rhs_mag_30Rnd_556x45_M855A1_Stanag",5,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",6,30],["SmokeShell",2,1],["SmokeShellRed",2,1]]],
	["B_Carryall_khk",[["rhs_mag_30Rnd_556x45_M855A1_Stanag",3,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",3,30]]],
	_blufor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_anprc148jem","ItemCompass","ItemWatch",""]
];


blufor_ammobearer = [
	[blufor_random_primaryweapon,"","","rhsusf_acc_eotech_xps3",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],"rhsusf_acc_grip1"],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
	[_blufor_uniform,[["acc_flashlight",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_KSF1",1],["ACE_key_west",1],["ACE_MapTools",1],["Chemlight_blue",2,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
	["rhsusf_iotv_ocp_Repair",[["rhs_mag_30Rnd_556x45_M855A1_Stanag",5,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",6,30],["SmokeShell",2,1],["SmokeShellRed",2,1]]],
	["B_Carryall_khk",[["rhs_200rnd_556x45_T_SAW",2,200],["rhs_200rnd_556x45_M_SAW",3,200]]],
	_blufor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_anprc148jem","ItemCompass","ItemWatch",""]
];


blufor_medic = [
	["rhs_weap_m4a1_carryhandle","","","rhsusf_acc_eotech_xps3",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
	[_blufor_uniform,[["acc_flashlight",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_KSF1",1],["ACE_key_west",1],["ACE_MapTools",1],["Chemlight_blue",2,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
	["rhsusf_iotv_ocp_Medic",[["rhs_mag_30Rnd_556x45_M855A1_Stanag",5,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",6,30],["SmokeShell",4,1],["SmokeShellRed",2,1]]],
	["rhsusf_assault_eagleaiii_coy",[["ACE_fieldDressing",40],["ACE_morphine",20],["ACE_epinephrine",20],["ACE_bloodIV_250",12],["HandGrenade",2,1]]],
	_blufor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_anprc148jem","ItemCompass","ItemWatch",""]
];


blufor_ftl = [
	["rhs_weap_m4a1_m203s","","","rhsusf_acc_eotech_xps3",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],["rhs_mag_M585_white",1],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
	[_blufor_uniform,[["acc_flashlight",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_KSF1",1],["ACE_key_west",1],["ACE_MapTools",1],["Chemlight_blue",2,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
	["rhsusf_iotv_ocp_Teamleader",[["rhs_mag_30Rnd_556x45_M855A1_Stanag",5,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",6,30],["SmokeShell",4,1],["SmokeShellRed",2,1],["HandGrenade",2,1]]],
	[_blufor_radio_lr,[["rhs_mag_M585_white",3,1],["rhs_mag_m662_red",2,1],["rhs_mag_m661_green",2,1],["rhs_mag_m713_Red",3,1],["rhs_mag_m714_White",3,1]]],
	_blufor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","ItemGPS","tf_anprc148jem","ItemCompass","ItemWatch",""]
];


blufor_sql = [
	["rhs_weap_m4a1_m203","","","rhsusf_acc_eotech_xps3",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],["rhs_mag_M585_white",1],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
	[_blufor_uniform,[["acc_flashlight",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_KSF1",1],["ACE_key_west",1],["ACE_MapTools",1],["Chemlight_blue",2,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
	["rhsusf_iotv_ocp_Grenadier",[["rhs_mag_30Rnd_556x45_M855A1_Stanag",11,30],["SmokeShell",4,1],["SmokeShellRed",2,1],["HandGrenade",2,1]]],
	[_blufor_radio_lr,[["rhs_mag_M585_white",3,1],["rhs_mag_m662_red",3,1],["rhs_mag_m661_green",3,1],["rhs_mag_m713_Red",3,1],["rhs_mag_m714_White",3,1]]],
	_blufor_helmet_boss,"",["Binocular","","","",[],[],""],
	["ItemMap","ItemGPS","tf_anprc148jem","ItemCompass","ItemWatch",""]
];


blufor_crewman = [
	["rhs_weap_m4a1_carryhandle_pmag","","","rhsusf_acc_eotech_xps3",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
	[_blufor_uniform,[["acc_flashlight",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_KSF1",1],["ACE_key_west",1],["ACE_MapTools",1],["Chemlight_blue",2,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
	["rhsusf_iotv_ocp",[["rhs_mag_30Rnd_556x45_M855A1_Stanag",1,30],["SmokeShell",1,1]]],
	["rhsusf_assault_eagleaiii_coy",[]],
	_blufor_helmet_crew,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_anprc148jem","ItemCompass","ItemWatch",""]
];