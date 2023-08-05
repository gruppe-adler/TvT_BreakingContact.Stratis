class wehrmachtSPE {
	class AllUnits {
		uniform = "U_SPE_GER_Soldier_camo";
        vest = "V_SPE_GER_VestKar98";
        backpack = "B_SPE_GER_A_frame";
        headgear = "H_SPE_GER_HelmetCamo";
        primaryWeapon = "SPE_K98_Late";
        primaryWeaponMagazine = "SPE_5Rnd_792x57";
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
        binoculars = "SPE_Binocular_GER";
        map = "ItemMap";
        compass = "SPE_GER_ItemCompass_deg";
        watch = "SPE_GER_ItemWatch";
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
			primaryWeaponMuzzle = "SPE_ACC_K98_Bayo";
            addItemsToUniform[] = {
                LIST_2("SPE_NB39"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_Shg24"),
                LIST_15("SPE_5Rnd_792x57")
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
                LIST_2("SPE_Handrauchzeichen_Violet"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_Shg24"),
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
			primaryWeaponMuzzle = "SPE_ACC_K98_Bayo";
			secondaryWeapon = "SPE_PzFaust_30m";
			secondaryWeaponMagazine = "SPE_1Rnd_PzFaust_30m";
            addItemsToUniform[] = {
                LIST_2("SPE_NB39"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_Shg24"),
                LIST_15("SPE_5Rnd_792x57")
            };
			addItemsToBackpack[] = {
				LIST_1("SPE_1Rnd_PzFaust_30m")
			};
		};

		//ammo bearer
		class Soldier_A_F: Soldier_F {
			vest = "V_SPE_GER_VestMG";
            backpack = "B_SPE_GER_Tonister41_Frame";
            primaryWeapon = "SPE_MG42";
            primaryWeaponMagazine = "SPE_50Rnd_792x57";
            handgunWeapon = "SPE_P08";
            handgunWeaponMagazine = "SPE_8Rnd_9x19_P08";
            handgunWeaponOptics = "";
            addItemsToUniform[] = {
                LIST_2("SPE_NB39"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_Shg24"),
                LIST_3("SPE_8Rnd_9x19_P08")
            };
            addItemsToBackpack[] = {
                LIST_6("SPE_50Rnd_792x57")
            };
		};

		//assistant autorifleman
		class Soldier_AAR_F: Soldier_F {
			backpack = "B_SPE_GER_Tonister34_canvas";
            primaryWeaponMuzzle = "SPE_ACC_K98_Bayo";
            addItemsToUniform[] = {
                LIST_2("SPE_NB39"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_Shg24"),
                LIST_15("SPE_5Rnd_792x57")
            };
            addItemsToBackpack[] = {
                LIST_5("SPE_50Rnd_792x57")
            };
		};

		//medic
		class Medic_F: Soldier_F {
			primaryWeaponMuzzle = "SPE_ACC_K98_Bayo";
            addItemsToUniform[] = {
                LIST_2("SPE_NB39"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_Shg24"),
                LIST_15("SPE_5Rnd_792x57")
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
			vest = "V_SPE_DAK_VestMP40";
            backpack = "B_SPE_GER_Radio";
            primaryWeapon = "SPE_MP40";
            primaryWeaponMagazine = "SPE_32Rnd_9x19";
            addItemsToUniform[] = {
                LIST_2("SPE_NB39"),
				MEDICITEMS_BASE
            };
            addItemsToVest[] = {
                LIST_2("SPE_Shg24"),
                LIST_7("SPE_32Rnd_9x19")
            };
		};

		//squad leader
		class Soldier_SL_F: Soldier_TL_F {
			headgear = "H_SPE_GER_OfficerCap";
		};

        //officer
        class officer_F: Soldier_SL_F {};
	};
};