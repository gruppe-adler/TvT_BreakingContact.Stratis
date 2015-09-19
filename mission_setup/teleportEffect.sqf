_side = _this select 0;
_posi = _this select 1;

[_posi] spawn {
_position = _this select 0;
	if (isServer && !BLUFOR_TELEPORTED && OPFORCE == 3) then {
		funkwagen = [getPos opfor_teamlead,10,"rhs_gaz66_r142_vv"] call spawnStuff;
		sleep 2;
		[funkwagen] call clearInventory;
		funkwagen animate ["light_hide",1];
			
		[opfor_teamlead, funkwagen, true] call ACE_VehicleLock_fnc_addKeyForVehicle;

		[_position,50,funkwagen] call moveStuff;


		russian_brt = [_position,10,"rhs_btr60_vv"] call spawnStuff;
		sleep 2;
		[opfor_teamlead, russian_brt, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
		gaz66 = [_position,10,"rhs_gaz66o_vdv"] call spawnStuff;
		[opfor_teamlead, gaz66, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
		sleep 2;
		[russian_brt] call clearInventory;


		gaz66 animate ["light_hide",1];
		[[[funkwagen],"objectives\russianMarker.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
	};

	if (isServer && BLUFOR_TELEPORTED && OPFORCE == 3) then {
		
		blufor_hmvv =  [_position,10,"rhsusf_m1025_d_m2"] call spawnStuff;
		sleep 2;
		[opfor_teamlead, blufor_hmvv, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
		blufor_observer_heli = [_position,10,"I_Heli_light_03_unarmed_F"] call spawnStuff;

		sleep 2;
		[opfor_teamlead, blufor_observer_heli, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
		[blufor_observer_heli] call clearInventory;

		[blufor_observer_heli,["green",1],true] call BIS_fnc_initVehicle;
		
	};
};


if (side player != _side) exitWith {};

[_posi,50,player] call moveStuff;