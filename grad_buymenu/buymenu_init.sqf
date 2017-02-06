/*
	buy menu for gruppe adler
	by nomisum
*/

// hide all markers

// global values
if (isServer) then {

	suppliesBlufor = "Flag_NATO_F" createVehicle [0, 1, 0];
	suppliesOpfor = "Flag_NATO_F" createVehicle [1, 0, 0];
	publicVariable "suppliesBlufor";
	publicVariable "suppliesOpfor";

	// initial money, also used for tracking money during game
	moneyBlufor = 3000; // initial money
	moneyOpfor = 2000;
	publicVariable "moneyBlufor";
	publicVariable "moneyOpfor";

	moneyGainBlufor = 0; // credits added every interval
	moneyGainOpfor = 0;

	moneyGainIntervalBlufor = 10; // interval in seconds
	moneyGainIntervalOpfor = 10;

	spawnArrayBluforLand = [
		"mrk_spawn_blufor_land_1"
		];
	spawnArrayBluforCivilian = [
		"mrk_spawn_blufor_land_1"
		];
	spawnArrayBluforWater = [
		"mrk_spawn_blufor_land_1"
		];
	spawnArrayBluforPlane = [
		"mrk_spawn_blufor_land_1"
		];
	spawnArrayBluforHelicopter = [
		"mrk_spawn_blufor_land_1"
		];
	spawnArrayOpforLand = [
		"mrk_spawn_opfor_land_1"
	];
	spawnArrayOpforWater = [
		"mrk_spawn_opfor_land_1"
	];
	spawnArrayOpforCivilian = [
		"mrk_spawn_opfor_land_1"
	];
	spawnArrayOpforPlane = [
		"mrk_spawn_opfor_land_1"
		];
	spawnArrayOpforHelicopter = [
		"mrk_spawn_opfor_land_1"
		];

	civilianCarSupplier = "C_man_hunter_1_F"; // who will bring the cars if spawn method civilian is chosen

	spawnChuteVehicleClassBlufor = "RHS_C130J";
	spawnSlingLoadVehicleClassBlufor = "rhsusf_CH53E_USMC_D";

	spawnChuteVehicleClassOpfor = "RHS_C130J";
	spawnSlingLoadVehicleClassOpfor = "RHS_Mi8mt_Cargo_vdv";

	/// DO NOT EDIT BELOW ///

	_randBluInd = 0; // no randomization needed for BC
	_randOpfInd = 0;

	/*
	// delete bases not needed
	switch {_randBluInd} do {
		case 1: { {deleteVehicle _x} forEach list trg_base_blufor_2; {deleteVehicle _x} forEach list trg_base_blufor_3; {deleteVehicle _x} forEach list trg_base_blufor_4; };
		case 2: { {deleteVehicle _x} forEach list trg_base_blufor_1; {deleteVehicle _x} forEach list trg_base_blufor_3; {deleteVehicle _x} forEach list trg_base_blufor_4; };
		case 3: { {deleteVehicle _x} forEach list trg_base_blufor_1; {deleteVehicle _x} forEach list trg_base_blufor_2; {deleteVehicle _x} forEach list trg_base_blufor_4; };
		case 4: { {deleteVehicle _x} forEach list trg_base_blufor_1; {deleteVehicle _x} forEach list trg_base_blufor_2; {deleteVehicle _x} forEach list trg_base_blufor_3; };
		default {};
	};

	switch {_randOpfInd} do {
		case 1: { {deleteVehicle _x} forEach list trg_base_opfor_2; {deleteVehicle _x} forEach list trg_base_opfor_3; {deleteVehicle _x} forEach list trg_base_opfor_4; };
		case 2: { {deleteVehicle _x} forEach list trg_base_opfor_1; {deleteVehicle _x} forEach list trg_base_opfor_3; {deleteVehicle _x} forEach list trg_base_opfor_4; };
		case 3: { {deleteVehicle _x} forEach list trg_base_opfor_1; {deleteVehicle _x} forEach list trg_base_opfor_2; {deleteVehicle _x} forEach list trg_base_opfor_4; };
		case 4: { {deleteVehicle _x} forEach list trg_base_opfor_1; {deleteVehicle _x} forEach list trg_base_opfor_2; {deleteVehicle _x} forEach list trg_base_opfor_3; };
		default {};
	};*/
	

	spawnMarkerBluforLand = (spawnArrayBluforLand select _randBluInd);
	spawnMarkerBluforWater = (spawnArrayBluforWater select _randBluInd);
	spawnMarkerCivilianBlufor = (spawnArrayBluforCivilian select _randBluInd);
	spawnMarkerBluforPlane = (spawnArrayBluforPlane select _randBluInd);
	spawnMarkerBluforHelicopter = (spawnArrayBluforHelicopter select _randBluInd);

	spawnMarkerOpforLand = (spawnArrayOpforLand select _randOpfInd);
	spawnMarkerOpforWater = (spawnArrayOpforWater select _randOpfInd);
	spawnMarkerCivilianOpfor = (spawnArrayOpforCivilian select _randOpfInd);
	spawnMarkerOpforPlane = (spawnArrayOpforPlane select _randOpfInd);
	spawnMarkerOpforHelicopter = (spawnArrayOpforHelicopter select _randOpfInd);

	publicVariable "spawnMarkerBluforLand";
	publicVariable "spawnMarkerBluforWater";
	publicVariable "spawnMarkerCivilianBlufor";
	publicVariable "spawnMarkerBluforPlane";
	publicVariable "spawnMarkerBluforHelicopter";

	publicVariable "spawnMarkerOpforLand";
	publicVariable "spawnMarkerOpforWater";
	publicVariable "spawnMarkerCivilianOpfor";
	publicVariable "spawnMarkerOpforPlane";
	publicVariable "spawnMarkerOpforHelicopter";

	SPAWN_APPROACH_BLUFOR = "WEST";
	SPAWN_APPROACH_OPFOR = "EAST";

	publicVariable "SPAWN_APPROACH_BLUFOR";
	publicVariable "SPAWN_APPROACH_OPFOR";

	waitUntil { !isNil "FACTIONS_DEFAULT" };

	// broadcast supplies definitions
	if (!FACTIONS_DEFAULT) then {
		0 = [] execVM "grad_buymenu\definitions\suppliesUS.sqf";
		0 = [] execVM "grad_buymenu\definitions\suppliesRussians.sqf";
	} else {
		0 = [] execVM "grad_buymenu\definitions\suppliesMUD.sqf";
		0 = [] execVM "grad_buymenu\definitions\suppliesSOV.sqf";
	};

};


// arrays of menu content

if (hasInterface) then {
		buyMenuOpen = false; // checks if player has gui open

		_canBuy = [];
		if (playerSide == east) then {
			switch (rank player) do {
				case "CAPTAIN": { _canBuy = ['car', 'aatruck', 'ammotruck', 'uaz', 'btr', 'bmp', 't72', 'transmitter']; };
				default { _canBuy = []; };
			};
			player setVariable ["GRAD_canBuy", _canBuy];

			player setVariable ['GRAD_buymenu_money', {moneyOpfor}, true];
			player setVariable ['GRAD_buymenu_money_name', "moneyOpfor", true];
			player setVariable ['GRAD_buymenu_supplies', {suppliesOpfor}, true];
			player setVariable ['GRAD_buymenu_supplies_name', "suppliesOpfor", true];
			player setVariable ['GRAD_buymenu_spawn_water', {getMarkerPos spawnMarkerOpforWater}];
			player setVariable ['GRAD_buymenu_spawn_land', {getMarkerPos spawnMarkerOpforLand}];
		};
		if (playerSide == west) then {
			switch (rank player) do {
				case "CAPTAIN": { _canBuy = ['mrzr4','hmmwv_m2','mrap','ammo','melb','ch53', 'recon_box']; };
				default { _canBuy = []; };
			};
			player setVariable ["GRAD_canBuy", _canBuy];

			player setVariable ['GRAD_buymenu_money', {moneyBlufor}, true];
			player setVariable ['GRAD_buymenu_money_name', "moneyBlufor", true];
			player setVariable ['GRAD_buymenu_supplies', {suppliesBlufor}, true];
			player setVariable ['GRAD_buymenu_supplies_name', "suppliesBlufor", true];

			player setVariable ['GRAD_buymenu_spawn_water', {getMarkerPos spawnMarkerBluforWater}];
			player setVariable ['GRAD_buymenu_spawn_land', {getMarkerPos spawnMarkerBluforLand}];
		};

		// G U I   f u n c t i o n s // do not edit below
        call compile preprocessFileLineNumbers "grad_buymenu\currentMenuIDCs.sqf";
        call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_getNextIDC.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_showMarkers.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_SetModelPitchBankYaw.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_calculateValuesColumn.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_calculatePicturesColumn.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntries.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createKeys.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryPicture.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryTitle.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryPrice.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryMouseOver.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryMouseOverArea.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryETA.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntrySpawnMethod.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntrySpawnMethodMouseOverArea.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryBuyButton.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createEntryAmount.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_refreshEntryBuyButton.sqf";
		


		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createToolbarExitButton.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createToolbarheadline.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_createToolbarCredits.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_addOrder.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_refreshCredits.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_refreshGUI.sqf";

		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_moveFirstToLast.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_moveDropMarker.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\fnc_displayWindInfo.sqf";
		call compile preprocessFileLineNumbers "grad_buymenu\functions\player\api\invalidateSupply.sqf";


		// [] spawn fnc_showMarkers; // dont need this for BC
		
};


if (isServer) then {
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_raiseMoney.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnVehicleManager.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnChute.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnCiv.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnSimple.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnSlingLoad.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_spawnWater.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\fnc_prepareAfterBuyRefresh.sqf";
	call compile preprocessFileLineNumbers "grad_buymenu\functions\server\api\fnc_api_createOrder.sqf";

	[] spawn fnc_raiseBluforMoney;
	[] spawn fnc_raiseOpforMoney;
};
