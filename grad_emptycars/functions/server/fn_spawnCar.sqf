params ["_pos", "_objType"];

private _obj = createVehicle [_objType, _pos, [], 0, "CAN_COLLIDE"];
_obj setVehicleLock "LOCKED";
_obj setVariable ["ace_vehiclelock_lockSide", civilian, true];
[_obj] call BC_setup_fnc_clearInventory;

private _road = [getPos _obj] call BIS_fnc_nearestRoad;

if (!isNull _road) then {     private _roadConnectedTo = roadsConnectedTo _road;
 	
    // yes there are roads without connections
    if (count _roadConnectedTo > 0) then {
      private _connectedRoad = _roadConnectedTo select 0;
 	  private _direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
 	  _obj setDir _direction;
    };
} else {
  _obj setDir (random 360);
};

if (!isMultiplayer) then {     	[_pos] call grad_emptycars_fnc_createDebugMarker;     } else {     	if (DEBUG_MODE) then {     		[_pos] call grad_emptycars_fnc_createDebugMarker;     	};
};
