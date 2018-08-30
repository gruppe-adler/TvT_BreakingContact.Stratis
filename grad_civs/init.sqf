GRAD_CIV_DEBUG = false;

if (isServer) then {

	// maximum persons on map
	GRAD_CIV_MAX_COUNT = 15;

	GRAD_CIV_MIN_SPAWN_DISTANCE = 1000;
	GRAD_CIV_MAX_SPAWN_DISTANCE = 4500;

	// do not edit below //
	GRAD_CIV_ONFOOT_COUNT = 0;
	GRAD_CIV_ONFOOT_GROUPS = [];

	// default clothes from vanilla + apex
	GRAD_civ_clothes = [
		"U_C_Man_casual_1_F",
		"U_C_Man_casual_2_F",
		"U_C_Man_casual_3_F",
		"U_C_Man_casual_4_F",
		"U_C_Man_casual_5_F",
		"U_C_Man_casual_6_F",
		"U_Competitor",
		"U_C_Poloshirt_tricolour",
		"U_C_Poloshirt_stripped",
		"U_C_Poloshirt_salmon",
		"U_C_Poloshirt_redwhite",
		"U_C_Poloshirt_burgundy",
		"U_C_Poloshirt_blue",
		"U_I_C_Soldier_Bandit_1_F",
		"U_I_C_Soldier_Bandit_2_F",
		"U_I_C_Soldier_Bandit_3_F",
		"U_I_C_Soldier_Bandit_4_F",
		"U_I_C_Soldier_Bandit_5_F",
		"U_C_Man_casual_1_F",
		"U_C_Man_casual_2_F",
		"U_C_Man_casual_3_F",
		"U_I_G_resistanceLeader_F",
		"U_BG_Guerrilla_6_1",
		"U_BG_Guerilla1_1",
		"U_BG_Guerilla2_1",
		"U_BG_Guerilla2_2",
		"U_BG_Guerilla2_3",
		"U_C_Journalist",
		"U_C_HunterBody_grn",
		"U_Marshal",
		"U_Rangemaster",
		"U_C_Poor_1"
	];

	// default headgear from vanilla + apex
	GRAD_civ_headgear = [
		"H_Bandanna_gry",
		"H_Beret_blk",
		"H_Booniehat_khk",
		"H_Booniehat_tan",
		"H_Booniehat_oli",
		"H_Cap_blk",
		"H_Cap_oli",
		"H_Cap_blu",
		"H_Cap_red",
		"H_Hat_tan",
		"H_Hat_brown",
		"H_Hat_grey",
		"H_MilCap_blue",
		"H_MilCap_gry",
		"H_StrawHat_dark",
		"H_Watchcap_blk",
		"H_Watchcap_cbr"
	];

	GRAD_civ_vehicles = 
	[
		"C_Offroad_01_F",
		"C_Offroad_01_repair_F",
		"C_Hatchback_01_F",
		"C_Hatchback_01_sport_F",
		"C_SUV_01_F",
		"C_Van_01_transport_F",
		"C_Van_01_box_F",
		"C_Van_01_fuel_F",
		"C_Truck_02_box_F",
		"C_Truck_02_fuel_F",
		"C_Truck_02_covered_F",
		"C_Offroad_02_unarmed_F"
	];

	GRAD_civ_vehicles_rds = [
		"RDS_Gaz24_Civ_01",
		"RDS_Gaz24_Civ_02",
		"RDS_Gaz24_Civ_03",
		"RDS_Gaz24_Civ_01",
		"RDS_Gaz24_Civ_02",
		"RDS_Gaz24_Civ_03",
		"RDS_Gaz24_Civ_01",
		"RDS_Gaz24_Civ_02",
		"RDS_Gaz24_Civ_03",

		"RDS_Ikarus_Civ_01",
		"RDS_Ikarus_Civ_02",
		"RDS_Ikarus_Civ_02",

		"RDS_S1203_Civ_01",
		"RDS_S1203_Civ_02",
		"RDS_S1203_Civ_03",

		"RDS_Octavia_Civ_01",

		"RDS_Lada_Civ_01",
		"RDS_Lada_Civ_02",
		"RDS_Lada_Civ_03",

		"RDS_Lada_Civ_05",
		"RDS_Lada_Civ_01",
		"RDS_Lada_Civ_02",
		"RDS_Lada_Civ_03",

		"RDS_Golf4_Civ_01",

		"RHS_Ural_Civ_01",
		"RHS_Ural_Civ_02",
		"RHS_Ural_Civ_03",
		"RHS_Ural_Open_Civ_01",
		"RHS_Ural_Open_Civ_02",
		"RHS_Ural_Open_Civ_03",

		"RDS_MMT_Civ_01",
		"RDS_Old_bike_Civ_01",
		"RDS_Zetor6945_Base",
		"RDS_JAWA353_Civ_01",
		"RDS_tt650_Civ_01"
	];

	if (!(isClass (configfile >> "CfgVehicles" >> "RDS_Gaz24_Civ_01"))) then {
		GRAD_civ_vehicles = GRAD_civ_vehicles + GRAD_civ_vehicles_rds;
	};

	publicVariable "GRAD_civ_vehicles";

	call GRAD_civs_fnc_clothDefinitions;
	call GRAD_civs_fnc_serverLoop;

	if (CIVILIAN_TRAFFIC == 1) then {
		[] execVM "Engima\Traffic\Init.sqf";
		[] execVM "Engima\Civilians\Init.sqf";
	};
};

if (hasInterface) then {

	call GRAD_civs_fnc_playerLoop;

	if (GRAD_CIV_DEBUG) then {
		call GRAD_civs_fnc_showWhatTheyThink;
	};

};