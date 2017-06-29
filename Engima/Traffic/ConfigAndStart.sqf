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
	["VEHICLES", GRAD_civ_vehicles],
	["VEHICLES_COUNT", 15],
	["MIN_SPAWN_DISTANCE", 800],
	["MAX_SPAWN_DISTANCE", 2000],
	["MIN_SKILL", 0],
	["MAX_SKILL", 0],
  	["AREA_MARKER", ""],
  	["ON_SPAWN_CALLBACK", {
		// check grad_civs_fnc_createvehicle
	}],
	["ON_REMOVE_CALLBACK", { true }],
	["DEBUG", false]
];

// Start an instance of the traffic
_parameters spawn ENGIMA_TRAFFIC_StartTraffic;
