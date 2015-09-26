createBluforSpawnLimitsMarkers = {
	_pos = _this;
		_inner_marker = createMarkerLocal ["inner_marker", _pos];
	_inner_marker setMarkerTypeLocal "mil_unknown";
	_inner_marker setMarkerColorLocal "ColorEast";
	_inner_marker setMarkerShapeLocal "ELLIPSE";
	_inner_marker setMarkerSizeLocal [MINIMAL_BLUFOR_SPAWN_DISTANCE, MINIMAL_BLUFOR_SPAWN_DISTANCE];
	_inner_marker setMarkerBrushLocal "SolidBorder";

	_outer_marker = createMarkerLocal ["outer_marker", _pos];
	_outer_marker setMarkerTypeLocal "mil_unknown";
	_outer_marker setMarkerColorLocal "ColorEast";
	_outer_marker setMarkerShapeLocal "ELLIPSE";
	_outer_marker setMarkerSizeLocal [MAXIMAL_BLUFOR_SPAWN_DISTANCE, MAXIMAL_BLUFOR_SPAWN_DISTANCE];
	_outer_marker setMarkerBrushLocal "Border";
};

openBluforLeaderTeleportPrompt = {
	ctrlSetText [8002, "Spawnpunkt aussuchen"];
	8002 ctrlSetTooltip "Jetzt Spawnpunkt aussuchen";
	ctrlEnable [8002, true];
};

_OPFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;

	_pos call createBluforSpawnLimitsMarkers;
	if (player == blufor_teamlead) then {
		call openBluforLeaderTeleportPrompt;
	}

};

"OPFOR_TELEPORT_TARGET" addPublicVariableEventHandler _OPFOR_TELEPORT_TARGET_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_OPFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {OPFOR_TELEPORT_TARGET select 0 != 0};
		[0, OPFOR_TELEPORT_TARGET] call _this;
	};
};

if (player == blufor_teamlead) then {
	[] spawn {
		waitUntil {!isNull player && time > 1};
		[] call checkSpawnButton;

		disableSerialization;
		ctrlEnable [8002, false];
	};
};
