params ["_unit", "_loadout"];

_isWoodlandCamo = ((ISLAND_TARGET_POSITIONS select (ISLANDS find worldName)) select 3);

opfor_uniform_d = "rhs_uniform_flora_patchless_alt";
opfor_uniform_w = "rhs_uniform_flora_patchless_alt";

opfor_random_primaryweapon = selectRandom [
	"rhs_weap_akm",
	"rhs_weap_akm",
	"rhs_weap_akm",
	"rhs_weap_akm"
];

opfor_random_helmet_w = selectRandom [
	"rhs_6b27m_ml"
];

opfor_random_helmet_d = selectRandom [
	"rhs_6b27m_ml"
];

opfor_helmet_boss_d = "rhs_fieldcap_ml";
opfor_helmet_boss_w = "rhs_fieldcap_ml";

opfor_helmet_crew_d = "rhs_tsh4";
opfor_helmet_crew_w = "rhs_tsh4";

// default desert
_opfor_helmet = opfor_random_helmet_d;	
_opfor_helmet_crew = opfor_helmet_crew_d;
_opfor_uniform = opfor_uniform_d;
_opfor_helmet_boss = opfor_helmet_boss_d;

if (_isWoodlandCamo) then {
	_opfor_helmet = opfor_random_helmet_w;	
	_opfor_helmet_crew = opfor_helmet_crew_w;
	_opfor_uniform = opfor_uniform_w;
	_opfor_helmet_boss = opfor_helmet_boss_w;
};


opfor_rifleman = [
	["rhs_weap_akm","","","",["rhs_30Rnd_762x39mm",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
	[_opfor_uniform,[["rhs_acc_2dpZenit",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_MX991",1],["ACE_key_east",1],["ACE_MapTools",1],["Chemlight_red",1,2],["16Rnd_9x21_Mag",17,2]]],
	["rhs_6b23_ML_rifleman",[["SmokeShell",1,1],["SmokeShellRed",1,1],["rhs_mag_rgd5",1,2]]],
	["rhs_sidor",[["rhs_30Rnd_762x39mm",30,10]]],
	_opfor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_fadak","ItemCompass","ItemWatch","ACE_NVG_Gen2"]
];

opfor_mg = [
	["rhs_weap_pkm","","","",["rhs_100Rnd_762x54mmR",100],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
	[_opfor_uniform,[["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_MX991",1],["ACE_key_east",1],["ACE_MapTools",1],["Chemlight_red",1,2],["16Rnd_9x21_Mag",17,2]]],
	["rhs_6b23_ML_6sh92_vog",[["rhs_100Rnd_762x54mmR_green",100,1],["SmokeShell",1,2],["SmokeShellRed",1,2],["rhs_mag_rgd5",1,1]]],
	["rhs_sidor",[["rhs_100Rnd_762x54mmR",100,1],["rhs_100Rnd_762x54mmR_green",100,1]]],
	_opfor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_fadak","ItemCompass","ItemWatch","ACE_NVG_Gen2"]
];


opfor_at = [
	["rhs_weap_akm","","","",["rhs_30Rnd_762x39mm",30],[],""],["rhs_weap_rpg7","","","",["rhs_rpg7_PG7VL_mag",1],[],""],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
	[_opfor_uniform,[["rhs_acc_2dpZenit",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_MX991",1],["ACE_key_east",1],["ACE_MapTools",1],["Chemlight_red",1,2],["16Rnd_9x21_Mag",17,2]]],
	["rhs_6b23_ML_engineer",[["rhs_30Rnd_762x39mm",30,4],["SmokeShell",1,2]]],["rhs_rpg_empty",[["rhs_rpg7_PG7VL_mag",1,2]]],
	_opfor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_fadak","ItemCompass","ItemWatch","ACE_NVG_Gen2"]
];


opfor_ammobearer = [
	["rhs_weap_akm","","","",["rhs_30Rnd_762x39mm",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
	[_opfor_uniform,[["rhs_acc_2dpZenit",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_MX991",1],["ACE_key_east",1],["ACE_MapTools",1],["Chemlight_red",1,2],["16Rnd_9x21_Mag",17,2]]],
	["rhs_6b23_ML_6sh92_headset",[["rhs_30Rnd_762x39mm",30,4],["rhs_30Rnd_762x39mm_tracer",30,2]]],
	["rhs_sidor",[["rhs_100Rnd_762x54mmR_green",100,2],["rhs_100Rnd_762x54mmR",100,1]]],
	_opfor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_fadak","ItemCompass","ItemWatch","ACE_NVG_Gen2"]
];


opfor_medic = [
	["rhs_weap_akm","","","",["rhs_30Rnd_762x39mm",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
	[_opfor_uniform,[["rhs_acc_2dpZenit",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_MX991",1],["ACE_key_east",1],["ACE_MapTools",1],["Chemlight_red",1,2],["16Rnd_9x21_Mag",17,2]]],
	["rhs_6b23_ML_medic",[["rhs_30Rnd_762x39mm",30,4],["rhs_30Rnd_762x39mm_tracer",30,4]]],
	["rhs_sidor",[["ACE_fieldDressing",40],["ACE_morphine",20],["ACE_epinephrine",20],["ACE_bloodIV_250",12],["rhs_mag_rgd5",1,2]]],
	_opfor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_fadak","ItemCompass","ItemWatch","ACE_NVG_Gen2"]
];


opfor_ftl = [
	["rhs_weap_akm_gp25","","","",["rhs_30Rnd_762x39mm",30],["rhs_VG40OP_white",1],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
	[_opfor_uniform,[["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_MX991",1],["ACE_key_east",1],["ACE_MapTools",1],["Chemlight_red",1,2],["16Rnd_9x21_Mag",17,2]]],
	["rhs_6b23_ML_6sh92_headset_mapcase",[["rhs_30Rnd_762x39mm",30,4],["rhs_30Rnd_762x39mm_tracer",30,3],["SmokeShell",1,1]]],
	["tf_rt1523g_big",[["rhs_mag_rgd5",1,2],["rhs_GRD40_White",1,4],["rhs_GRD40_Green",1,2],["rhs_GRD40_Red",1,2],["rhs_VG40OP_green",1,3],["rhs_VG40OP_white",1,2]]],
	_opfor_helmet,"",["Binocular","","","",[],[],""],
	["ItemMap","ItemGPS","tf_fadak","ItemCompass","ItemWatch","ACE_NVG_Gen2"]
];


opfor_sql = [
	["rhs_weap_akm_gp25","","","",["rhs_30Rnd_762x39mm",20],["rhs_VG40OP_white",1],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
	[_opfor_uniform,[["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_MX991",1],["ACE_key_east",1],["ACE_MapTools",1],["Chemlight_red",1,2],["16Rnd_9x21_Mag",17,2]]],
	["rhs_6b23_ML_6sh92_headset_mapcase",[["rhs_30Rnd_762x39mm",30,4],["rhs_30Rnd_762x39mm_tracer",30,3],["SmokeShell",1,1]]],
	["tf_rt1523g_big",[["rhs_mag_rgd5",1,2],["rhs_GRD40_White",1,4],["rhs_GRD40_Green",1,2],["rhs_GRD40_Red",1,2],["rhs_VG40OP_green",1,3],["rhs_VG40OP_white",1,2]]],
	_opfor_helmet_boss,"",["Binocular","","","",[],[],""],
	["ItemMap","ItemGPS","tf_fadak_2","ItemCompass","ItemWatch","ACE_NVG_Gen2"]
];


opfor_crewman = [
	["rhs_weap_akm","","","",["rhs_30Rnd_762x39mm",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],
	["rhs_uniform_flora_patchless_alt",[["rhs_acc_2dpZenit",1],["ACE_fieldDressing",6],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_Flashlight_MX991",1],["ACE_key_east",1],["ACE_MapTools",1],["Chemlight_red",1,2],["16Rnd_9x21_Mag",17,2]]],
	["rhs_6b23_ML_6sh92_headset",[["rhs_30Rnd_762x39mm",30,4],["rhs_30Rnd_762x39mm_tracer",30,2]]],
	["rhs_sidor",[]],
	_opfor_helmet_crew,"",["Binocular","","","",[],[],""],
	["ItemMap","","tf_fadak","ItemCompass","ItemWatch","ACE_NVG_Gen2"]
];