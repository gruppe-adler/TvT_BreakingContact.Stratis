class usSPE {
	class AllUnits {
		uniform = "U_SPE_US_Private";
        vest = "V_SPE_US_Vest_Garand";
        backpack = "B_SPE_US_Backpack";
        headgear = "H_SPE_US_Helmet_29ID_Scrim_ns";
        primaryWeapon = "SPE_M1903A3_Springfield";
        primaryWeaponMagazine = "SPE_5Rnd_762x63";
        primaryWeaponOptics = "";
        primaryWeaponPointer = "";
        primaryWeaponMuzzle = "";
        primaryWeaponUnderbarrel = "";
        primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
        secondaryWeaponOptics = "";
        secondaryWeaponPointer = "";
        secondaryWeaponMuzzle = "";
        secondaryWeaponUnderbarrel = "";
        secondaryWeaponUnderbarrelMagazine = "";
        handgunWeapon = "";
        handgunWeaponMagazine = "";
        handgunWeaponOptics = "";
        handgunWeaponPointer = "";
        handgunWeaponMuzzle = "";
        handgunWeaponUnderbarrel = "";
        handgunWeaponUnderbarrelMagazine = "";
        binoculars = "SPE_Binocular_US";
        map = "ItemMap";
        compass = "SPE_US_ItemCompass";
        watch = "SPE_US_ItemWatch";
        gps = "";
        radio = "";
        nvgoggles = "";
		addItemsToUniform[] = {
			MEDICITEMS_BASE,
			"ACE_Flashlight_KSF1",
			"ACE_MapTools",
			LIST_1("ACE_EntrenchingTool")
		};
    };

	class Type {
		//rifleman
		class Soldier_F {
			addItemsToUniform[] = {
                LIST_2("SPE_US_M18"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_US_Mk_2_Yellow"),
                LIST_15("SPE_5Rnd_762x63")
            };
		};

		//autorifleman
		class Soldier_AR_F: Soldier_F {
			primaryWeapon = "SPE_M1919A6";
            primaryWeaponMagazine = "SPE_50Rnd_762x63";
            handgunWeapon = "SPE_M1911";
            handgunWeaponMagazine = "SPE_7Rnd_45ACP_1911";
            handgunWeaponOptics = "";
            addItemsToUniform[] = {
                LIST_2("SPE_US_M18"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_US_Mk_2_Yellow"),
                LIST_2("SPE_7Rnd_45ACP_1911")
            };
            addItemsToBackpack[] = {
                LIST_1("ACE_EntrenchingTool"),
                LIST_1("ACE_MapTools"),
                LIST_6("SPE_50Rnd_762x63")
            };
		};

		//light AT
		class Soldier_LAT_F: Soldier_F {
			secondaryWeapon = "SPE_M1A1_Bazooka";
            secondaryWeaponMagazine = "SPE_1Rnd_60mm_M6";
            addItemsToUniform[] = {
                LIST_2("SPE_US_M18"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_US_Mk_2_Yellow"),
                LIST_15("SPE_5Rnd_762x63")
            };
            addItemsToBackpack[] = {
                LIST_1("ACE_EntrenchingTool"),
                LIST_1("ACE_MapTools"),
				LIST_1("SPE_1Rnd_60mm_M6")
            };
		};

		//ammo bearer
		class Soldier_A_F: Soldier_F {
			primaryWeaponMuzzle = "SPE_ACC_M1_Bayo";
            addItemsToUniform[] = {
                LIST_2("SPE_US_M18"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_US_Mk_2_Yellow"),
                LIST_15("SPE_5Rnd_762x63")
            };
            addItemsToBackpack[] = {
                LIST_1("ACE_EntrenchingTool"),
                LIST_1("ACE_MapTools"),
                LIST_5("SPE_50Rnd_762x63")
            };
		};

		//assistant autorifleman
		class Soldier_AAR_F: Soldier_F {
			primaryWeaponMuzzle = "SPE_ACC_M1_Bayo";
            addItemsToUniform[] = {
                LIST_2("SPE_US_M18"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_US_Mk_2_Yellow"),
                LIST_15("SPE_5Rnd_762x63")
            };
            addItemsToBackpack[] = {
                LIST_1("ACE_EntrenchingTool"),
                LIST_1("ACE_MapTools"),
                LIST_5("SPE_50Rnd_762x63")
            };
		};

		//medic
		class Medic_F: Soldier_F {
			primaryWeaponMuzzle = "SPE_ACC_M1_Bayo";
            addItemsToUniform[] = {
                LIST_2("SPE_US_M18"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_US_Mk_2_Yellow"),
                LIST_15("SPE_5Rnd_762x63")
            };
            addItemsToBackpack[] = {
				LIST_20("ACE_fieldDressing"),
				LIST_10("ACE_fieldDressing"),
				LIST_15("ACE_morphine"),
				LIST_15("ACE_epinephrine"),
				LIST_2("ACE_bloodIV_250")
			};
		};

		//team leader
		class Soldier_TL_F: Soldier_F {
			backpack = "B_SPE_US_Radio_packboard";
            primaryWeapon = "SPE_M1A1_Thompson";
            primaryWeaponMagazine = "SPE_30Rnd_Thompson_45ACP";
            addItemsToUniform[] = {
                LIST_2("SPE_US_M18"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_US_Mk_2_Yellow"),
                LIST_7("SPE_20Rnd_Thompson_45ACP")
            };
            addItemsToBackpack[] = {
                LIST_1("ACE_EntrenchingTool"),
                LIST_1("ACE_MapTools")
            };
		};

		//squad leader
		class Soldier_SL_F: Soldier_TL_F {
			headgear = "H_SPE_US_Pilot_Cap";
		};
        
        //officer
        class officer_F: Soldier_SL_F {};
	};
};