createOpforStuff =  {
	_position = _this;
	funkwagen = [getPos opfor_teamlead,10,"rhs_gaz66_r142_vv"] call spawnStuff;

	sleep 2;
	[funkwagen] call clearInventory;
	funkwagen animate ["light_hide",1];

	[opfor_teamlead, funkwagen, true] call ACE_VehicleLock_fnc_addKeyForVehicle;

	[_position, 50, funkwagen] call moveStuff;


	russian_brt = [_position, 10, "rhs_btr60_vv"] call spawnStuff;

	sleep 2;
	[opfor_teamlead, russian_brt, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
	gaz66 = [_position,10,"rhs_gaz66o_vdv"] call spawnStuff;
	[opfor_teamlead, gaz66, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
	sleep 2;
	[russian_brt] call clearInventory;

	gaz66 animate ["light_hide", 1];
};

createBluforStuff = {
	_position = _this;
	blufor_hmvv =  [_position, 10, "rhsusf_m1025_d_m2"] call spawnStuff;

	sleep 2;
	[opfor_teamlead, blufor_hmvv, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
	blufor_observer_heli = [_position, 10, "I_Heli_light_03_unarmed_F"] call spawnStuff;

	sleep 2;
	[opfor_teamlead, blufor_observer_heli, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
	[blufor_observer_heli] call clearInventory;

	[blufor_observer_heli,["green",1],true] call BIS_fnc_initVehicle;
};

_OPFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;
	_pos call createOpforStuff;
	publicVariable "OPFOR_TELEPORT_TARGET";
};


_BLUFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;
	_pos call createBluforStuff;
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




