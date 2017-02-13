spawnRadioTruck = {
	params ["_position"];

	radio_object = [_position, 0, 1, "rhs_gaz66_r142_vv"] call spawnStuff;
	// used for detachable radio unit
	radio_object setVariable ["detachableRadio", 0, true];
	publicVariable "radio_object";

	0 = [radio_object, true] execVM "spawn\flagsOnVehicles.sqf";

	sleep 1;
	[radio_object] call clearInventory;

	if (!IS_WOODLAND) then {
		radio_object setObjectTextureGlobal [0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa"];
	    radio_object setObjectTextureGlobal [1,"rhsafrf\addons\rhs_gaz66\data\tent_co.paa"];
	    radio_object setObjectTextureGlobal [2,"rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_kung_sand_co.paa"];
	    radio_object setObjectTextureGlobal [3,"rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_ap2kung_sand_co.paa"];
	    radio_object setObjectTextureGlobal [4,"rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_repkung_sand_co.paa"];
	};

	// hide light covers for optical reasons
	radio_object animate ["light_hide",1];
	sleep 0.1;


	[getPos radio_object, 50, "Land_ClutterCutter_large_F"] call spawnOpforHQ;
	radio_object addItemCargoGlobal ["ACE_SpraypaintBlack",10];
	radio_object addItemCargoGlobal ["ACE_SpraypaintBlue",10];
	radio_object addItemCargoGlobal ["ACE_SpraypaintGreen",10];
	radio_object addItemCargoGlobal ["ACE_SpraypaintRed",10];
	radio_object addItemCargoGlobal ["ACE_EntrenchingTool",10];
	if (!FACTIONS_DEFAULT) then {
		radio_object addItemCargoGlobal ["ACE_NVG_Gen2",50];
	};
};