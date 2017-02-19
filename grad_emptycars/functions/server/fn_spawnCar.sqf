params ["_pos"];

_objType = selectRandom grad_emptycars_types;

_obj = _objType createVehicle _pos;
_obj setDir (random 360);
_obj setVehicleLock "LOCKED";
_obj setVariable ["ace_vehiclelock_lockSide", west, true];

if (!isMultiplayer) then {
		[_pos] call grad_emptycars_fnc_createDebugMarker;
	} else {
		if (DEBUG_MODE) then {
			[_pos] call grad_emptycars_fnc_createDebugMarker;
		};
};	
