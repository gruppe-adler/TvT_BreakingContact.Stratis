/*
 *	params ["_dropPosition", "_height", "_crateVeh", "_crateCode", "_side"];
 *  start with 
 *
 *	[
 		position player, 
 		150, 
 		"rhsusf_launcher_crate", 
 		{
 			(_this select 0) addWeaponCargoGlobal ['rhs_weap_fim92',2]; 
 			(_this select 0) addMagazineCargoGlobal ['rhs_fim92_mag',2];	
 		},
 		west] spawn grad_supplydrops_fnc_createCarrier;

 		
 *
 */



GRAD_SUPPLY_DROP_MIN_DISTANCE = 1500;

// type of vehicles used
_plane = "RHS_C130J";
_chute = "B_Parachute_02_F";



missionNameSpace setVariable ["GRAD_SUPPLY_DROP_TYPE_PLANE", _plane, true];
missionNameSpace setVariable ["GRAD_SUPPLY_DROP_TYPE_CHUTE", _chute, true];