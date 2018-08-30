/*     buy menu for gruppe adler     by nomisum
*/

// false if you want to spawn in diverse ways (chute/drop etc)
GRAD_BUYMENU_SINGLE_SPAWN_METHOD = true;

// global values
if (isServer) then {
     suppliesBlufor = "Flag_NATO_F" createVehicle [0, 1, 0];     suppliesOpfor = "Flag_NATO_F" createVehicle [1, 0, 0];     publicVariable "suppliesBlufor";     publicVariable "suppliesOpfor";
     // initial money, also used for tracking money during game     moneyBlufor = ["BLUFOR_MONEY", 3000] call BIS_fnc_getParamValue;     moneyOpfor = ["OPFOR_MONEY", 2000] call BIS_fnc_getParamValue;
     publicVariable "moneyBlufor";     publicVariable "moneyOpfor";
     moneyGainBlufor = 0; // credits added every interval     moneyGainOpfor = 0;
     moneyGainIntervalBlufor = 10; // interval in seconds     moneyGainIntervalOpfor = 10;
     spawnArrayBluforLand = [     	"mrk_spawn_blufor_land_1"     	];     spawnArrayBluforCivilian = [     	"mrk_spawn_blufor_land_1"     	];     spawnArrayBluforWater = [     	"mrk_spawn_blufor_land_1"     	];     spawnArrayBluforPlane = [     	"mrk_spawn_blufor_land_1"     	];     spawnArrayBluforHelicopter = [     	"mrk_spawn_blufor_land_1"     	];     spawnArrayOpforLand = [     	"mrk_spawn_opfor_land_1"     ];     spawnArrayOpforWater = [     	"mrk_spawn_opfor_land_1"     ];     spawnArrayOpforCivilian = [     	"mrk_spawn_opfor_land_1"     ];     spawnArrayOpforPlane = [     	"mrk_spawn_opfor_land_1"     	];     spawnArrayOpforHelicopter = [     	"mrk_spawn_opfor_land_1"     	];
     civilianCarSupplier = "C_man_hunter_1_F"; // who will bring the cars if spawn method civilian is chosen
     spawnChuteVehicleClassBlufor = "RHS_C130J";     spawnSlingLoadVehicleClassBlufor = "rhsusf_CH53E_USMC_D";
     spawnChuteVehicleClassOpfor = "RHS_C130J";     spawnSlingLoadVehicleClassOpfor = "RHS_Mi8mt_Cargo_vdv";
     /// DO NOT EDIT BELOW ///
     _randBluInd = 0; // no randomization needed for BC     _randOpfInd = 0;
     /*     // delete bases not needed     switch {_randBluInd} do {     	case 1: { {deleteVehicle _x} forEach list trg_base_blufor_2; {deleteVehicle _x} forEach list trg_base_blufor_3; {deleteVehicle _x} forEach list trg_base_blufor_4; };     	case 2: { {deleteVehicle _x} forEach list trg_base_blufor_1; {deleteVehicle _x} forEach list trg_base_blufor_3; {deleteVehicle _x} forEach list trg_base_blufor_4; };     	case 3: { {deleteVehicle _x} forEach list trg_base_blufor_1; {deleteVehicle _x} forEach list trg_base_blufor_2; {deleteVehicle _x} forEach list trg_base_blufor_4; };     	case 4: { {deleteVehicle _x} forEach list trg_base_blufor_1; {deleteVehicle _x} forEach list trg_base_blufor_2; {deleteVehicle _x} forEach list trg_base_blufor_3; };     	default {};     };
     switch {_randOpfInd} do {     	case 1: { {deleteVehicle _x} forEach list trg_base_opfor_2; {deleteVehicle _x} forEach list trg_base_opfor_3; {deleteVehicle _x} forEach list trg_base_opfor_4; };     	case 2: { {deleteVehicle _x} forEach list trg_base_opfor_1; {deleteVehicle _x} forEach list trg_base_opfor_3; {deleteVehicle _x} forEach list trg_base_opfor_4; };     	case 3: { {deleteVehicle _x} forEach list trg_base_opfor_1; {deleteVehicle _x} forEach list trg_base_opfor_2; {deleteVehicle _x} forEach list trg_base_opfor_4; };     	case 4: { {deleteVehicle _x} forEach list trg_base_opfor_1; {deleteVehicle _x} forEach list trg_base_opfor_2; {deleteVehicle _x} forEach list trg_base_opfor_3; };     	default {};     };*/

     spawnMarkerBluforLand = (spawnArrayBluforLand select _randBluInd);     spawnMarkerBluforWater = (spawnArrayBluforWater select _randBluInd);     spawnMarkerCivilianBlufor = (spawnArrayBluforCivilian select _randBluInd);     spawnMarkerBluforPlane = (spawnArrayBluforPlane select _randBluInd);     spawnMarkerBluforHelicopter = (spawnArrayBluforHelicopter select _randBluInd);
     spawnMarkerOpforLand = (spawnArrayOpforLand select _randOpfInd);     spawnMarkerOpforWater = (spawnArrayOpforWater select _randOpfInd);     spawnMarkerCivilianOpfor = (spawnArrayOpforCivilian select _randOpfInd);     spawnMarkerOpforPlane = (spawnArrayOpforPlane select _randOpfInd);     spawnMarkerOpforHelicopter = (spawnArrayOpforHelicopter select _randOpfInd);
     vehicleListBlufor = ['transportTruck', 'brdm', 'tigr', 'ammotruck', 'uaz', 'btr', 'bmp', 't72', 'transmitter', 'truckarmor'];     vehicleListOpfor = ['transportHMMWV', 'mrzr4','hmmwv_m2','m113', 'm113heavy','ammocar','melb','mh60'];     publicVariable "vehicleListBlufor";     publicVariable "vehicleListOpfor";
     publicVariable "spawnMarkerBluforLand";     publicVariable "spawnMarkerBluforWater";     publicVariable "spawnMarkerCivilianBlufor";     publicVariable "spawnMarkerBluforPlane";     publicVariable "spawnMarkerBluforHelicopter";
     publicVariable "spawnMarkerOpforLand";     publicVariable "spawnMarkerOpforWater";     publicVariable "spawnMarkerCivilianOpfor";     publicVariable "spawnMarkerOpforPlane";     publicVariable "spawnMarkerOpforHelicopter";
     SPAWN_APPROACH_BLUFOR = "WEST";     SPAWN_APPROACH_OPFOR = "EAST";
     publicVariable "SPAWN_APPROACH_BLUFOR";     publicVariable "SPAWN_APPROACH_OPFOR";
     // broadcast supplies definitions
     0 = [] execVM "grad_buymenu\definitions\suppliesUS.sqf";     0 = [] execVM "grad_buymenu\definitions\suppliesRussians.sqf";

  // set highest player rank able to buy
  {
    private _potentToBuy = [_x] call BC_setup_fnc_getHighestRankOfSide;
    _potentToBuy setVariable ["BC_potentToBuy", true, true];
    [] remoteExec ["GRAD_buymenu_fnc_setPlayerPotentToBuy", _potentToBuy];
  } forEach [west, east];
};


if (hasInterface) then {     	buyMenuOpen = false; // checks if player has gui open     	// G U I   f u n c t i o n s // do not edit below
        call compile preprocessFileLineNumbers "grad_buymenu\currentMenuIDCs.sqf";
};
