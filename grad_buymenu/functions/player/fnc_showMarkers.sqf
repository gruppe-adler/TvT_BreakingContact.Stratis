fnc_showMarkers = {

	waitUntil {!isNil "spawnMarkerBluforLand" && !isNil "spawnMarkerOpforHelicopter"};

	diag_log "fnc show markers";

	if (playerside == west) then {
		{_x setMarkerAlphaLocal 1;} forEach [
			spawnMarkerBluforLand,
			spawnMarkerBluforWater,
			spawnMarkerBluforPlane,
			spawnMarkerBluforHelicopter
			];
	}; 

	if (playerside == east) then {
		{_x setMarkerAlphaLocal 1;} forEach [
			spawnMarkerOpforLand,
			spawnMarkerOpforWater,
			spawnMarkerOpforPlane,
			spawnMarkerOpforHelicopter
			];
	};
};
