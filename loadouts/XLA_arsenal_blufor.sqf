
waitUntil {
loadoutInitBluforFinished
};

#define NO_SIDE -1
#define EAST_SIDE 0
#define WEST_SIDE 1
#define INDEP_SIDE 2
#define CIV_SIDE 3
#define NEUTRAL_SIDE 4
#define ENEMY_SIDE 5
#define FRIENDLY_SIDE 6
#define LOGIC_SIDE 7

_availableUniforms = [];
_availableVests = [];
_availableHeadgear = [];
_availableBackpacks = [];
_availableGuns = [];


switch (BLUFORCE) do {
	
		// BW Fleck
		case 0: {
			_availableUniforms = randUniformBWFleck + randUniformBWTropen;
			_availableVests = randVestBWFleck + randVestBWTropen;
			_availableHeadgear = randHeadGearBWFleck + randHeadGearBWTropen;
			_availableBackpacks = randBackpackBWFleck + randBackpackBWTropen;
			_availableGuns = randWeaponBWFleck + randLauncherBWFleck;
		}; 

		// BW Tropen
		case 1: {
			_availableUniforms = randUniformBWTropen + randUniformBWFleck;
			_availableVests = randVestBWTropen + randVestBWFleck;
			_availableHeadgear = randHeadGearBWTropen + randHeadGearBWFleck;
			_availableBackpacks = randBackpackBWTropen + randBackpackBWFleck;
			_availableGuns = randWeaponBWTropen + randLauncherBWTropen;
		}; 

		// US Desert
		case 2: {
			_availableUniforms = randUniformUSOCP;
			_availableVests = randVestUSOCP;
			_availableHeadgear = randHeadGearUSOCP;
			_availableBackpacks = randBackpackUSOCP;
			_availableGuns = randWeaponUSOCP + randLauncherUSOCP;
		}; 
		
		// US Tropen
		case 3: {
			_availableUniforms = randUniformUSUCP;
			_availableVests = randVestUSUCP;
			_availableHeadgear = randHeadGearUSUCP;
			_availableBackpacks = randBackpackUSUCP;
			_availableGuns = randWeaponUSUCP + randLauncherUSOCP;
		};
		default {
		hintSilent "error in reading faction parameter";
		};
	};

// -------------------------------------------------------------------
// 		ACE Grenades
// -------------------------------------------------------------------
_ACE_grenades_Magazines = [
	"ACE_HandFlare_White",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Yellow",
	"ACE_M84",
	"3Rnd_UGL_FlareGreen_F", //Do we need this? Seems like vanilla
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F"
];
_ACE_grenades_Weapons = [
	"ACE_HandFlare_WhiteMuzzle",
	"ACE_HandFlare_RedMuzzle",
	"ACE_HandFlare_GreenMuzzle",
	"ACE_HandFlare_YellowMuzzle",
	"ACE_M84Muzzle"
];

// -------------------------------------------------------------------
// 		ACE Attach
// -------------------------------------------------------------------
_ACE_attach_Weapons = [
	"ACE_IR_Strobe_Item"
];
_ACE_attach_Magazines = [
	"B_IR_Grenade",
	"Chemlight_green"
];

// -------------------------------------------------------------------
// 		ACE Ballistics
// -------------------------------------------------------------------
_ACE_ballistics_Magazines = [
	"ACE_30Rnd_65x39_caseless_mag_Tracer_Dim",
	"ACE_30Rnd_65x39_caseless_mag_SD",
	"ACE_30Rnd_65x39_caseless_mag_AP",
	"ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim",
	"ACE_30Rnd_65x39_caseless_green_mag_SD",
	"ACE_30Rnd_65x39_caseless_green_mag_AP",
	"ACE_30Rnd_556x45_Stanag_Tracer_Dim",
	"ACE_30Rnd_556x45_Stanag_SD",
	"ACE_30Rnd_556x45_Stanag_AP",
	"ACE_20Rnd_762x51_Mag_Tracer",
	"ACE_20Rnd_762x51_Mag_Tracer_Dim",
	"ACE_20Rnd_762x51_Mag_SD",
	"ACE_20Rnd_762x51_Mag_AP"
];
_ACE_ballistics_attachments = [
	"ACE_muzzle_mzls_H",
	"ACE_muzzle_mzls_B",
	"ACE_muzzle_mzls_L",
	"ACE_muzzle_mzls_smg_01",
	"ACE_muzzle_mzls_smg_02"
];

// -------------------------------------------------------------------
// 		ACE Disposable (Launchers)
// -------------------------------------------------------------------
	//This is a design choice - do we want people saving spent tubes?
_ACE_disposable_Weapons = [
	"ACE_launch_NLAW_Used_F"
];
_ACE_disposable_Magazines = [
	"ACE_UsedTube_F"
];

// -------------------------------------------------------------------
// 		ACE Explosives
// -------------------------------------------------------------------
_ACE_explosives_Weapons = [
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DefusalKit",
	"ACE_DeadManSwitch"
];
_ACE_explosives_Magazines = [
	"ATMine_Range_Mag",
	"APERSBoundingMine_Range_Mag",
	"APERSMine_Range_Mag",
	"APERSTripMine_Wire_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"DemoCharge_Remote_Mag",
	"SLAMDirectionalMine_Wire_Mag"
];

// -------------------------------------------------------------------
// 		ACE Hearing (Earbuds)
// -------------------------------------------------------------------
_ACE_hearing_Weapons = [
	"ACE_EarBuds"
];

// -------------------------------------------------------------------
// 		ACE Interaction (Handcuffs)
// -------------------------------------------------------------------
_ACE_interaction_Weapons = [
	"ACE_CableTie",
	"ACE_key_west",
	"ACE_key_lockpick",
	"ACE_RangeTable_82mm",
	"ACE_MapTools",
	"ACE_wirecutter",
	"ACE_Kestrel4500",
	"ACE_DefusalKit",
	"ACE_microDAGR"
];

// -------------------------------------------------------------------
// 		ACE Logistics (UAV Batteries)
// -------------------------------------------------------------------
_ACE_logistics_Weapons = [
	"ACE_UAVBattery"
];

// -------------------------------------------------------------------
// 		ACE Map (Maptool)
// -------------------------------------------------------------------
_ACE_map_Weapons = [
	"ACE_MapTools"
];

// -------------------------------------------------------------------
// 		ACE Medical
// -------------------------------------------------------------------
_ACE_medical_Weapons = [
	"ACE_Bandage",
	"ACE_Morphine",
	"ACE_Epipen",
	"ACE_Bloodbag"
];

// -------------------------------------------------------------------
// 		ACE Overheating (Spare Barrels)
// -------------------------------------------------------------------
_ACE_overheating_Weapons = [
	"ACE_SpareBarrel"
];

// -------------------------------------------------------------------
// 		ACE Parachute (Altimeter)
// -------------------------------------------------------------------
_ACE_parachute_Weapons = [
	"ACE_Altimeter"
];

// -------------------------------------------------------------------
// 		ACE Vector
// -------------------------------------------------------------------
_ACE_vector_Weapons = [
	"ACE_Vector",
	"ACE_Item_Vector"
];

// -------------------------------------------------------------------
// 		ACE Wind (Kestrel)
// -------------------------------------------------------------------
_ACE_wind_Weapons = [
	"ACE_ItemKestrel"
];




// -------------------------------------------------------------------
// 		Combine lists
// -------------------------------------------------------------------



_availableMagazines 	= [];
_availableAttachments = [
	"FHQ_acc_LLM01F",
	"FHQ_acc_ANPEQ15_black",
	"FHQ_acc_ANPEQ15",
	"FHQ_optic_AC11704",
	"FHQ_optic_AC11704_tan",
	"FHQ_optic_MARS",
	"SMA_eotech552_3XDOWN",
	"SMA_eotech552_3XDOWN_wdl",
	"SMA_eotech552_3XDOWN_des",
	"SMA_supp2btanSCAR_556",
	"SMA_supp2bSCAR_556",
	"SMA_spSCARtan_762",
	"SMA_spSCAR_762",
 	"optic_Hamr",
 	"optic_Aco",
 	"bipod_01_F_blk",
 	"bipod_01_F_snd"
	];

_availableItems = [
	"L_Shemagh_Gry",
	"L_Shemagh_OD",
	"L_Shemagh_Red",
	"L_Shemagh_Tan",
	"L_shemagh_white",
	"NeckTight_Dmaripat",
	"NeckTight_Gry",
	"NeckTight_OD",
	"NeckTight_Red",
	"NeckTight_Tan",
	"NeckTight_white",
	"G_Balaclava_blk",
	"G_Balaclava_oli",
	"ItemMap",
	"ItemCompass",
	"ItemWatch",
	"ItemGPS",
	"ACE_fieldDressing",
	"ACE_packingBandage",
	"ACE_elasticBandage",
	"ACE_quikclot",
	"ACE_tourniquet",
	"ACE_atropine",
	"ACE_morphine",
	"ACE_epinephrine",
	"ACE_plasmaIV",
	"ACE_plasmaIV_250",
	"ACE_plasmaIV_500",
	"ACE_salineIV",
	"ACE_salineIV_250",
	"ACE_salineIV_500",
	"ACE_bloodIV",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500",
	"ACE_personalAidKit",
	"ACE_surgicalKit",
	"ACE_bodyBag",
	"ACE_EarPlugs",
	"tf_anprc152"
];


_availableMagazines = [
	"UGL_FlareRed_F",
	"UGL_FlareGreen_F",
	"UGL_FlareWhite_F",
	"UGL_FlareYellow_F",
	"UGL_FlareCIR_F",
	"SMA_30Rnd_556x45_M855A1_Tracer",
	"SMA_30Rnd_556x45_M855A1",
	"SMA_30Rnd_556x45_M855A1_IR",
	"SMA_30Rnd_556x45_Mk318",
	"SMA_30Rnd_556x45_Mk318_Tracer",
	"SMA_30Rnd_556x45_Mk318_IR",
	"SMA_30Rnd_556x45_Mk262",
	"SMA_30Rnd_556x45_Mk262_Tracer",
	"SMA_30Rnd_556x45_Mk262_IR",
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
	"30Rnd_45ACP_Mag_SMG_01",
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
	"16Rnd_9x21_Mag",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeOrange_Grenade_shell",
	"1Rnd_SmokePurple_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_Smoke_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell",
	"HandGrenade",
	"SmokeShell",
	"SmokeShellYellow",
	"SmokeShellRed",
	"SmokeShellGreen",
	"SmokeShellPurple",
	"SmokeShellBlue",
	"SmokeShellOrange",
	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_yellow",
	"Chemlight_blue",
	"B_IR_Grenade",
	"SLAMDirectionalMine_Wire_Mag",
	"SMA_20Rnd_762x51mm_M80A1_EPR",
	"SMA_20Rnd_762x51mm_M80A1_EPR_Tracer",
	"SMA_20Rnd_762x51mm_M80A1_EPR_IR",
	"SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range",
	"SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range_Tracer",
	"SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range_IR",
	"SMA_20Rnd_762x51mm_Mk319_Mod_0_Ball_Barrier",
	"SMA_20Rnd_762x51mm_Mk319_Mod_0_Ball_Barrier_Tracer",
	"SMA_20Rnd_762x51mm_Mk319_Mod_0_Ball_Barrier_IR",
	"SMA_20Rnd_762x51mm_Lapua_FMJ_Subsonic",
	"SMA_20Rnd_762x51mm_Lapua_FMJ_Subsonic_Tracer",
	"SMA_20Rnd_762x51mm_Lapua_FMJ_Subsonic_IR",


	"SMA_30Rnd_762x39_SKS",
	"SMA_30Rnd_762x39_SKS_Red",
	"130Rnd_338_Mag",
	"150Rnd_93x64_Mag",
	"20Rnd_762x51_Mag",
	"DemoCharge_Remote_Mag",
	"ACE_M26_Clacker",


	"SMA_30Rnd_556x45_M855A1",
	"SMA_30Rnd_556x45_M855A1_Tracer",
	"SMA_30Rnd_556x45_M855A1_IR",
	"SMA_30Rnd_556x45_Mk318_Tracer",
	"SMA_30Rnd_556x45_Mk318",
	"SMA_30Rnd_556x45_Mk318_IR",
	"SMA_30Rnd_556x45_Mk262",
	"SMA_30Rnd_556x45_Mk262_Tracer",
	"SMA_30Rnd_556x45_Mk262_IR",
	"SMA_20Rnd_762x51mm_M80A1_EPR",
	"SMA_20Rnd_762x51mm_M80A1_EPR_Tracer",
	"SMA_20Rnd_762x51mm_M80A1_EPR_IR",
	"SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range",
	"SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range_Tracer",
	"SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range_IR",
	"SMA_20Rnd_762x51mm_Mk319_Mod_0_Ball_Barrier",
	"SMA_20Rnd_762x51mm_Mk319_Mod_0_Ball_Barrier_Tracer",
	"SMA_20Rnd_762x51mm_Mk319_Mod_0_Ball_Barrier_IR",
	"SMA_20Rnd_762x51mm_Lapua_FMJ_Subsonic",
	"SMA_20Rnd_762x51mm_Lapua_FMJ_Subsonic_Tracer",
	"SMA_20Rnd_762x51mm_Lapua_FMJ_Subsonic_IR",
	"150Rnd_93x64_Mag",
	"130Rnd_338_Mag",
	"rhs_m136_hedp_mag",
	"rhs_m136_hp_mag",
	"rhs_m136_mag"
];


_availableAttachments = _availableAttachments
	+ _ACE_ballistics_attachments;

_availableItems = _availableItems;

_availableMagazines = _availableMagazines
	+ _ACE_grenades_Magazines
	+ _ACE_attach_Magazines
	+ _ACE_ballistics_Magazines
	+ _ACE_disposable_Magazines
	+ _ACE_explosives_Magazines;

_availableGuns = _availableGuns
	+ _ACE_grenades_Weapons
	+ _ACE_attach_Weapons
	+ _ACE_disposable_Weapons
	+ _ACE_explosives_Weapons
	+ _ACE_hearing_Weapons
	+ _ACE_interaction_Weapons
	+ _ACE_logistics_Weapons
	+ _ACE_map_Weapons
	+ _ACE_medical_Weapons
	+ _ACE_overheating_Weapons
	+ _ACE_parachute_Weapons
	+ _ACE_vector_Weapons
	+ _ACE_wind_Weapons;

sleep 1;
if (isServer && !IS_VANILLA) then {

	// Grab the parameter that was passed in.
	// The box should have "this execVM <scriptname>" in it's init field.
	_box = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	

	// Check if @XLA_FixedArsenal is loaded
	 if (isnil "XLA_fnc_addVirtualItemCargo") then {

	 	hint "@XLA_FixedArsenal not found.";

	} else {
		

		[_box, _availableBackpacks,true,false] call XLA_fnc_addVirtualBackpackCargo;
		[_box, (_availableGuns + _availableAttachments +_availableItems + _availableUniforms + _availableVests + _availableHeadgear),true,false] call  XLA_fnc_addVirtualItemCargo;
		[_box, _availableMagazines,true,false] call XLA_fnc_addVirtualMagazineCargo;
		[_box, (_availableGuns),true,false] call XLA_fnc_addVirtualWeaponCargo;
		//[_box, [WEST_SIDE,FRIENDLY_SIDE],true,false] call XLA_fnc_addVirtualSideCargo;

		
		// Start the arsenal on it
		_addActionText = "<t color='#45B6EA'>" + localize "str_GRAD_openSupplyBox";
		["AmmoboxInit",[_box,false,{true},_addActionText,false]] spawn XLA_fnc_arsenal;



	};
};
