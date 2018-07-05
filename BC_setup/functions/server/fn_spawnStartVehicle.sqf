// [EAST, getPos _vehicle, 50, "Land_ClutterCutter_large_F"] 
params ["_side", "_centerPosition", "_distance", "_vehicleclass"];

_searchDistance = 10; // threshold to search for alternative positions


diag_log format ["_vehicleclass %1", _vehicleclass];

_spawnedVehicles = [
    _centerPosition,
    [_vehicleclass,"RoadCone_L_F"],
    _distance,
    _searchDistance
] call BC_setup_fnc_findSpawnPosition;

_spawnedVehicles params ["_startVehicle", "_startCone"];

_startCone setVariable ["GRAD_spawnType", _side, true];
[_startCone, true, [0,0.5,0.5], 180] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];

if (_side isEqualTo west) then {
      ["Blufor Spawn successfully found."] remoteExec ["hintSilent"];

      [_startVehicle] call BC_setup_fnc_configureBluforStartVehicle;

      US_SPAWN_PAD = _startCone;
      publicVariable "US_SPAWN_PAD";

      US_VEHICLE_SPAWN = {getPos US_SPAWN_PAD};
      publicVariable "US_VEHICLE_SPAWN";

      "mrk_spawn_blufor_land_1" setMarkerPos (call US_VEHICLE_SPAWN);
      "respawn_west" setMarkerPos (call US_VEHICLE_SPAWN);

      debugLog("blufor published target");
      diag_log format ["creating blufor stuff on position: %1",call US_VEHICLE_SPAWN];

      if (!isMultiplayer) then {
    		private _blufor_marker_start = createMarker ["debug_blufor_marker_start", (call RUS_VEHICLE_SPAWN)];
    		_blufor_marker_start setMarkerType "hd_start";
    		_blufor_marker_start setMarkerColor "ColorBlufor";
    	};
} else {
      ["Opfor Spawn successfully found."] remoteExec ["hintSilent"];

      [_startVehicle] call BC_setup_fnc_configureOpforStartVehicle;

      RUS_SPAWN_PAD = _startCone;
      publicVariable "RUS_SPAWN_PAD";

      RUS_VEHICLE_SPAWN = {getPos RUS_SPAWN_PAD};
      publicVariable "RUS_VEHICLE_SPAWN";

      "mrk_spawn_opfor_land_1" setMarkerPos (call RUS_VEHICLE_SPAWN);
      "respawn_east" setMarkerPos (call RUS_VEHICLE_SPAWN);

      debugLog("opfor published target");
      diag_log format ["creating opfor stuff on position: %1",call RUS_VEHICLE_SPAWN];

      if (!isMultiplayer) then {
    		private _opfor_marker_start = createMarker ["debug_opfor_marker_start", (call RUS_VEHICLE_SPAWN)];
    		_opfor_marker_start setMarkerType "hd_start";
    		_opfor_marker_start setMarkerColor "ColorOpfor";
    	};

      sleep 7;

      [[REPLAY_ACCURACY], "node_modules\grad-replay\GRAD_replay_init.sqf"] remoteExec ["execVM", 0, true];

    	// create tasks
    	[[], "BC_objectives\init.sqf"] remoteExec ["execVM", 0, true];
};

_startVehicle
