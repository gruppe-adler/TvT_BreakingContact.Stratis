/* 
 * This file contains config parameters and a function call to start the civilian script.
 * The parameters in this file may be edited by the mission developer.
 *
 * See file Engima\Civilians\Documentation.txt for documentation and a full reference of 
 * how to customize and use Engima's Civilians.
 */
 
private ["_parameters"];

// Set civilian parameters.
_parameters = [     ["UNIT_CLASSES", [
"C_Man_casual_1_F_tanoan",
"C_Man_casual_2_F_tanoan",
"C_Man_casual_3_F_tanoan",
"C_man_sport_1_F_tanoan",
"C_man_sport_3_F_tanoan",
"C_man_sport_2_F_tanoan",
"C_Man_casual_4_F_tanoan",
"C_Man_casual_5_F_tanoan",
"C_Man_casual_6_F_tanoan",
"C_man_p_beggar_F_asia",
"C_Man_casual_1_F_asia",
"C_man_sport_3_F_asia",
"C_Man_casual_6_F_asia",
"C_Man_casual_5_F_asia",
"C_Man_casual_4_F_asia",
"C_man_sport_1_F_asia"     ]],     ["UNITS_PER_BUILDING", 0.1],     ["MAX_GROUPS_COUNT", 20],     ["MIN_SPAWN_DISTANCE", 1000],     ["MAX_SPAWN_DISTANCE", 1500],     ["BLACKLIST_MARKERS", []],     ["HIDE_BLACKLIST_MARKERS", true],     ["ON_UNIT_SPAWNED_CALLBACK", {     	params ["_civ"];     	_civ enableDynamicSimulation true;     	_civ call GRAD_civs_fnc_dressAndBehave;     	[_civ] call GRAD_civs_fnc_addConversationAnswers;     	[_civ] call GRAD_civs_fnc_addBrainEventhandler;     	if (!isNil "GRAD_REPLAY_CIVILIAN_ONFOOT_TRACKED" && {GRAD_REPLAY_CIVILIAN_ONFOOT_TRACKED}) then {     		_civ setVariable ["GRAD_replay_track", true];     	};     }],     ["ON_UNIT_REMOVE_CALLBACK", { true }],     ["DEBUG", false]
];

// Start the script
_parameters spawn ENGIMA_CIVILIANS_StartCivilians;
