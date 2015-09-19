
waitUntil {
loadoutInitOpforFinished
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


switch (OPFORCE) do {
	
		// TALIBAN
		case 0: {
			_availableUniforms = randUniformTaliban;
			_availableVests = randVestTaliban;
			_availableHeadgear = randHeadGearTaliban;
			_availableBackpacks = randBackPackTaliban;
			_availableGuns = randWeaponTaliban + randLauncherTaliban;
		}; 

		// TERRORISTS
		case 1: {
			_availableUniforms = randUniformTerrorists;
			_availableVests = randVestTerrorists;
			_availableHeadgear = randHeadGearTerrorists;
			_availableBackpacks = randBackPackTerrorists;
			_availableGuns = randWeaponTerrorists + randLauncherTerrorists;
		}; 

		// EASTERN
		case 2: {
			_availableUniforms = randUniformEastern;
			_availableVests = randVestEastern;
			_availableHeadgear = randHeadGearEastern;
			_availableBackpacks = randBackPackEastern;
			_availableGuns = randWeaponEastern + randLauncherEastern;
		}; 
		
		// Russian
		case 3: {
			_availableUniforms = randUniformRussian;
			_availableVests = randVestRussian;
			_availableHeadgear = randHeadGearRussian;
			_availableBackpacks = randBackPackRussian;
			_availableGuns = randWeaponRussian + randLauncherRussian;
		};

		// African
		case 4: {
			_availableUniforms = randUniformAfrican;
			_availableVests = randVestAfrican;
			_availableHeadgear = randHeadGearAfrican;
			_availableBackpacks = randBackPackAfrican;
			_availableGuns = randWeaponAfrican + randLauncherAfrican;
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
	"ACE_key_east",
	"ACE_key_lockpick",
	"ACE_RangeTable_82mm",
	"ACE_MapTools",
	"ACE_wirecutter",
	"ACE_Kestrel4500",
	"ACE_Cellphone",
	"ACE_DeadManSwitch"
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

_availableGuns 	= _availableGuns + [
	
	"Binocular",
	"hgun_P07_F",
	"srifle_DMR_06_olive_F",
	"MMG_02_black_F",
	"MMG_02_sand_F"
	];
_availableMagazines 	= [];
_availableAttachments = [
"SMA_eotech552_3XDOWN",
	"SMA_eotech552_3XDOWN_wdl",
	"SMA_eotech552_3XDOWN_des",
	"optic_Hamr",
 	"optic_Aco",
 	"bipod_03_F_oli",
 	"bipod_02_F_tan",
 	"bipod_01_F_blk"
	];


_availableItems = [
	"ItemMap",
	"ItemCompass",
	"ItemWatch",
	"tf_fadak",
	"ItemGPS",
	"ACE_Earbuds",
	"tf_fadak",
	"L_Shemagh_Red",
	"NeckTight_Tan",
	"LBG_Shemagh_Gry",
	"G_Balaclava_blk",
	"G_Balaclava_oli",
	"G_Bandanna_tan",
	"G_Bandanna_oli",
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
	"ACE_EarPlugs"
];




_availableMagazines = [
	"16Rnd_9x21_Mag",
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


	"SMA_30Rnd_762x39_SKS",
	"SMA_30Rnd_762x39_SKS_Red",
	"20Rnd_762x51_Mag",
	"130Rnd_338_Mag",

	"rhs_30Rnd_762x39mm",
	"rhs_30Rnd_762x39mm_tracer",
	"rhs_30Rnd_762x39mm_89",
	"rhsusf_8Rnd_00Buck",
	"rhs_100Rnd_762x54mmR",
	"rhs_100Rnd_762x54mmR_green",
	"rhs_30Rnd_545x39_AK",
	"rhs_30Rnd_545x39_AK_no_tracers",
	"rhs_30Rnd_545x39_7N10_AK",
	"rhs_30Rnd_545x39_7N22_AK",
	"rhs_30Rnd_545x39_AK_green",
	"rhs_45Rnd_545X39_AK",
	"rhs_45Rnd_545X39_7N10_AK",
	"rhs_45Rnd_545X39_7N22_AK",
	"rhs_45Rnd_545X39_AK_Green",
	"rhs_30Rnd_762x39mm",
	"rhs_30Rnd_762x39mm_tracer",
	"rhs_30Rnd_762x39mm_89",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_Mk262_Stanag",
	"rhs_mag_30Rnd_556x45_Mk318_Stanag",
	"rhs_30Rnd_545x39_AK",
	"rhs_30Rnd_545x39_AK_no_tracers",
	"rhs_30Rnd_545x39_7N10_AK",
	"rhs_30Rnd_545x39_7N22_AK",
	"rhs_30Rnd_545x39_AK_green",
	"rhs_45Rnd_545X39_AK",
	"rhs_45Rnd_545X39_7N10_AK",
	"rhs_45Rnd_545X39_7N22_AK",
	"rhs_45Rnd_545X39_AK_Green",
	"rhs_100Rnd_762x54mmR",
	"rhs_100Rnd_762x54mmR_green",
	"rhs_rpg7_TBG7V_mag",
	"rhs_rpg7_OG7V_mag",
	"rhs_rpg7_PG7VR_mag",
	"rhs_rpg7_PG7VL_mag"
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
