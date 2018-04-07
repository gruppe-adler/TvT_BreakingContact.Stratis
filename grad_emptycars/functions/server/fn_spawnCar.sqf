params ["_pos", "_objType"];

private _obj = _objType createVehicle _pos;
_obj setVehicleLock "LOCKED";
_obj setVariable ["ace_vehiclelock_lockSide", civilian, true];
[_obj] call BC_setup_fnc_clearInventory;

private _road = [getPos _obj] call BIS_fnc_nearestRoad;
if (!isNull _road) then {
	_roadConnectedTo = roadsConnectedTo _road;
 	_connectedRoad = _roadConnectedTo select 0;
 	_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
 	_obj setDir _direction;
} else {
  _obj setDir (random 360);
};

if (!isMultiplayer) then {
		[_pos] call grad_emptycars_fnc_createDebugMarker;
	} else {
		if (DEBUG_MODE) then {
			[_pos] call grad_emptycars_fnc_createDebugMarker;
		};
};
