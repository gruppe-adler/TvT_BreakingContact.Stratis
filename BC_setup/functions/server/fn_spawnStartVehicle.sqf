// [EAST, getPos _vehicle, 50, "Land_ClutterCutter_large_F"] 
params ["_side", "_centerPosition", "_distance", "_vehicleclass"];

_searchDistance = 10; // threshold to search for alternative positions
_startVehicle = objNull;

diag_log format ["_vehicleclass %1", _vehicleclass];

_spawnedVehicles = [
    _centerPosition,
    [_vehicleclass,"RoadCone_L_F"],
    _distance,
    _searchDistance,
    _side
] call BC_setup_fnc_findSpawnPosition;

_spawnedVehicles params ["_startVehicle", "_startCone"];

_startCone setVariable ["GRAD_spawnType", _side, true];
[_startCone, true, [0,0.5,0.5], 180] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];

if (_side isEqualTo west) then {
      ["Blufor Spawn successfully found."] remoteExec ["hintSilent"];

      [_startVehicle] call BC_setup_fnc_configureBluforStartVehicle;

      US_SPAWN_PAD = _startCone;
      publicVariable "US_SPAWN_PAD";

      private _string = format ["BC_spawnPos_%1", west];
      private _pos = getPos _startVehicle;
      missionNamespace setVariable [_string, _pos, true];

      _string = format ["BC_startVehicle_%1", west];
      _pos = getPos _startCone;
      missionNamespace setVariable [_string, _pos, true];

      US_VEHICLE_SPAWN = _pos;
      publicVariable "US_VEHICLE_SPAWN";

      "mrk_spawn_blufor_land_1" setMarkerPos ([west] call BC_setup_fnc_getSpawnPos);
      "respawn_west" setMarkerPos ([west] call BC_setup_fnc_getSpawnPos);

      debugLog("blufor published target");
      diag_log format ["creating blufor stuff on position: %1",([west] call BC_setup_fnc_getSpawnPos)];

      if (!isMultiplayer) then {
    		private _blufor_marker_start = createMarker ["debug_blufor_marker_start", ([east] call BC_setup_fnc_getSpawnPos)];
    		_blufor_marker_start setMarkerType "hd_start";
    		_blufor_marker_start setMarkerColor "ColorBlufor";
    	};
} else {
      ["Opfor Spawn successfully found."] remoteExec ["hintSilent"];

      [_startVehicle] call BC_setup_fnc_configureOpforStartVehicle;

      RUS_SPAWN_PAD = _startCone;
      publicVariable "RUS_SPAWN_PAD";

      private _string = format ["BC_spawnPos_%1", east];
      private _pos = getPos RUS_SPAWN_PAD;
      missionNamespace setVariable [_string, _pos, true];

      RUS_VEHICLE_SPAWN = _pos;
      publicVariable "RUS_VEHICLE_SPAWN";

      "mrk_spawn_opfor_land_1" setMarkerPos ([east] call BC_setup_fnc_getSpawnPos);
      "respawn_east" setMarkerPos ([east] call BC_setup_fnc_getSpawnPos);

      debugLog("opfor published target");
      diag_log format ["creating opfor stuff on position: %1",([east] call BC_setup_fnc_getSpawnPos)];

      if (!isMultiplayer) then {
    		private _opfor_marker_start = createMarker ["debug_opfor_marker_start", ([east] call BC_setup_fnc_getSpawnPos)];
    		_opfor_marker_start setMarkerType "hd_start";
    		_opfor_marker_start setMarkerColor "ColorOpfor";
    	};

      sleep 7;

      [REPLAY_ACCURACY] remoteExec ["GRAD_replay_fnc_init", 0, true];

    	// create tasks
    	[] remoteExec ["BC_objectives_fnc_init", 0, true];
};

_startVehicle
