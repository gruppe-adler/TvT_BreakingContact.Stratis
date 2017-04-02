/* 
 * This file contains parameters to config and function call to start an instance of
 * traffic in the mission. The file is edited by the mission developer.
 *
 * See file Engima\Traffic\Documentation.txt for documentation and a full reference of 
 * how to customize and use Engima's Traffic.
 */
 
 private ["_parameters"];

// Set traffic parameters.
_parameters = [
	["SIDE", civilian],
	["VEHICLES", [


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

	"RDS_S1203_Civ_02",

	"RDS_Octavia_Civ_01",

	"RDS_Lada_Civ_02",
	"RDS_Lada_Civ_03",
	"RDS_Lada_Civ_04",
	"RDS_Lada_Civ_05",
	"RDS_Lada_Civ_02",
	"RDS_Lada_Civ_03",
	"RDS_Lada_Civ_04",

	"RDS_Zetor6945_Base",

	"RHS_Ural_Civ_01",
	"RHS_Ural_Civ_02",
	"RHS_Ural_Civ_03",
	"RHS_Ural_Open_Civ_01",
	"RHS_Ural_Open_Civ_02",
	"RHS_Ural_Open_Civ_03",
	"rhsgref_nat_uaz",
	"RDS_JAWA353_Civ_01",
	"RDS_JAWA353_Civ_01",
	"RDS_JAWA353_Civ_01",
	"RDS_tt650_Civ_01",
	"RDS_tt650_Civ_01",
	"RDS_tt650_Civ_01",
	"RDS_tt650_Civ_01"
	]],
	["VEHICLES_COUNT", 15],
	["MIN_SPAWN_DISTANCE", 1500],
	["MAX_SPAWN_DISTANCE", 2500],
	["MIN_SKILL", 1],
	["MAX_SKILL", 1],
	["ON_SPAWN_CALLBACK", {
		{
			[_x] call GRAD_civs_fnc_dressAndBehave;
		} forEach crew (_this select 0);
	}],
	["DEBUG", ((["DEBUG_MODE", 0] call BIS_fnc_getParamValue) == 1 || !isMultiplayer)]
];

// Start an instance of the traffic
_parameters spawn ENGIMA_TRAFFIC_StartTraffic;
