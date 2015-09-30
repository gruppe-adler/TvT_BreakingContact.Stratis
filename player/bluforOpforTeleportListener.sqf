createBluforSpawnLimitsMarkers = {
	_pos = _this;
	_inner_marker = createMarkerLocal ["inner_marker", _pos];
	_inner_marker setMarkerTypeLocal "mil_unknown";
	_inner_marker setMarkerColorLocal "ColorEast";
	_inner_marker setMarkerShapeLocal "ELLIPSE";
	_inner_marker setMarkerSizeLocal [BLUFOR_SPAWN_DISTANCE, BLUFOR_SPAWN_DISTANCE];
	_inner_marker setMarkerBrushLocal "SolidBorder";

	_outer_marker = createMarkerLocal ["outer_marker", _pos];
	_outer_marker setMarkerTypeLocal "mil_unknown";
	_outer_marker setMarkerColorLocal "ColorEast";
	_outer_marker setMarkerShapeLocal "ELLIPSE";
	_outer_marker setMarkerSizeLocal [BLUFOR_SPAWN_DISTANCE, BLUFOR_SPAWN_DISTANCE];
	_outer_marker setMarkerBrushLocal "Border";
};

_OPFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;

	
	_pos call createBluforSpawnLimitsMarkers;
	if (player == blufor_teamlead) then {
		hintSilent "Jetzt Spawnpunkt aussuchen!";
	};

};

"OPFOR_TELEPORT_TARGET" addPublicVariableEventHandler _OPFOR_TELEPORT_TARGET_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_OPFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {OPFOR_TELEPORT_TARGET select 0 != 0};
		[0, OPFOR_TELEPORT_TARGET] call _this;
	};
};
