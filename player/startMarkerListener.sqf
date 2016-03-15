_US_SPAWN_PAD_listener = {
	_pos = getPos US_SPAWN_PAD;
	
	_blufor_marker_start = createMarkerLocal ["blufor_marker_spawnpad", _pos];
	_blufor_marker_start setMarkerShapeLocal "ICON";
	_blufor_marker_start setMarkerTypeLocal "hd_pickup";
	_blufor_marker_start setMarkerColorLocal "ColorWEST";
};

_RUS_SPAWN_PAD_listener = {
	_pos = getPos RUS_SPAWN_PAD;
	
	_opfor_marker_start = createMarkerLocal ["opfor_marker_spawnpad", _pos];
	_opfor_marker_start setMarkerShapeLocal "ICON";
	_opfor_marker_start setMarkerTypeLocal "hd_pickup";
	_opfor_marker_start setMarkerColorLocal "ColorEAST";
};



if (side player == west) then {
		"US_SPAWN_PAD" addPublicVariableEventHandler _US_SPAWN_PAD_listener;
	};

if (side player == east) then {
		"RUS_SPAWN_PAD" addPublicVariableEventHandler _RUS_SPAWN_PAD_listener;
	};


// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_US_SPAWN_PAD_listener spawn {
		waitUntil {US_SPAWN_PAD select 0 != 0};
		[0, US_SPAWN_PAD] call _this;
	};
};

if (!isMultiplayer) then {
	_RUS_SPAWN_PAD_listener spawn {
		waitUntil {RUS_SPAWN_PAD select 0 != 0};
		[0, RUS_SPAWN_PAD] call _this;
	};
};