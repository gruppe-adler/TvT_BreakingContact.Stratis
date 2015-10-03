createOpforStuff =  {
	_position = _this;

	diag_log format ["creating opfor stuff on position: %1",_position];

	funkwagen = [_position, 0, 1, "rhs_gaz66_r142_vv"] call spawnStuff;

	sleep 1;
	[funkwagen] call clearInventory;
	funkwagen animate ["light_hide",1];

	[opfor_teamlead, funkwagen, true] call ACE_VehicleLock_fnc_addKeyForVehicle;

	RUS_base = [_position, 15, 16, "TK_WarfareBUAVterminal_Base_EP1"] call spawnStuff;
	// RUS_base addAction["<t color=""#93E352"">" + localize "str_GRAD_buy_vehicles",{0 = createDialog "russianSupplyGUI"; [russianSupplies, false, 0, "","",""] call refreshRussianUI;}, _Args, 1, true, true, "","_this distance _target < 6  && side _this == east"];


	/*_mainAction = ["ACE_MainActions", (localize "str_GRAD_buy_vehicles"), "", {0 = createDialog "russianSupplyGUI"; [russianSupplies, false, 0, "","",""] call refreshRussianUI;},  {side player == east},{},[],[1,0,0],5] call ace_interact_menu_fnc_createAction;
	[RUS_base, 0, [], _mainAction] call ace_interact_menu_fnc_addActionToObject;*/


	//create action append to main menu
	/*_actionBuy = ["buy_objects",localize "str_GRAD_buy_vehicles", "", {0 = createDialog "russianSupplyGUI"; [russianSupplies, false, 0, "","",""] call refreshRussianUI;}, {side player == east}] call ace_interact_menu_fnc_createAction;
	[RUS_base, 0, ["ACE_MainActions"], _actionBuy] call ace_interact_menu_fnc_addActionToObject;*/

	sleep 1;

	RUS_VEHICLE_SPAWN = _position findEmptyPosition [0, 50, "Land_HelipadCivil_F"];
	publicVariable "RUS_VEHICLE_SPAWN";
	_RUS_spawnPad = createVehicle ["Land_HelipadCivil_F",RUS_VEHICLE_SPAWN,[],0,"NONE"];

	if (!isMultiplayer) then {
		_opfor_marker_start = createMarker ["debug_opfor_marker_start", RUS_VEHICLE_SPAWN];
		_opfor_marker_start setMarkerType "hd_start";
		_opfor_marker_start setMarkerColor "ColorOpfor";
	} else {

	};

};

createBluforStuff = {
	_opforposition = _this;
	_result = nil;
	while {!isNil _result} do {
		_result = [_opforposition, 1, 150, 10, 0, 20, 0] call findBISPos;
	};

	US_VEHICLE_SPAWN = _result;
	publicVariable "US_VEHICLE_SPAWN";
	_US_spawnPad = createVehicle ["Land_HelipadCivil_F",US_VEHICLE_SPAWN,[],0,"NONE"];

	BLUFOR_TELEPORT_TARGET = _result;
	publicVariableServer "BLUFOR_TELEPORT_TARGET";
	debugLog("blufor published target");

	diag_log format ["creating blufor stuff on position: %1",_result];

	sleep 1;

	US_base = [_result, 15, 50, "US_WarfareBUAVterminal_Base_EP1"] call spawnStuff;
	//US_base addAction["<t color=""#93E352"">" + localize "str_GRAD_buy_vehicles",{0 = createDialog "USSupplyGUI"; [USSupplies, false, 0, "","",""] call refreshUSUI;}, _Args, 1, true, true, "","_this distance _target < 6 && side _this == west"];

	
	/*_actionBuy = ["buy_objects",localize "str_GRAD_buy_vehicles", "", {0 = createDialog "USSupplyGUI"; [USSupplies, false, 0, "","",""] call refreshUSUI;}, {side player == west}] call ace_interact_menu_fnc_createAction;
	[US_base, 0, ["ACE_MainActions"], _actionBuy] call ace_interact_menu_fnc_addActionToObject;*/

	//_spawn call bluforTeleporting;
	
	

	if (!isMultiplayer) then {
		_blufor_marker_start = createMarker ["debug_blufor_marker_start", US_VEHICLE_SPAWN];
		_blufor_marker_start setMarkerType "hd_start";
		_blufor_marker_start setMarkerColor "ColorBlufor";
	};
};

_OPFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;
	_pos spawn createOpforStuff;
	publicVariable "OPFOR_TELEPORT_TARGET";
	_pos spawn createBluforStuff;
};


_BLUFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;
	publicVariable "BLUFOR_TELEPORT_TARGET";
};


"OPFOR_TELEPORT_TARGET" addPublicVariableEventHandler _OPFOR_TELEPORT_TARGET_listener;
"BLUFOR_TELEPORT_TARGET" addPublicVariableEventHandler _BLUFOR_TELEPORT_TARGET_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_OPFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {OPFOR_TELEPORT_TARGET select 0 != 0};
		[0, OPFOR_TELEPORT_TARGET] call _this;
	};
};

if (!isMultiplayer) then {
	_BLUFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {BLUFOR_TELEPORT_TARGET select 0 != 0};
		[0, OPFOR_TELEPORT_TARGET] call _this;
	};
};