createOpforStuff =  {
	_position = _this;

	funkwagen = [_position, 0, 1, "rhs_gaz66_r142_vv"] call spawnStuff;
	// used for detachable radio unit
	funkwagen setVariable ["detachableRadio", 0, true];
	publicVariable "funkwagen";

	sleep 1;
	[funkwagen] call clearInventory;

	// hide light covers for optical reasons
	funkwagen animate ["light_hide",1];
	sleep 0.1;

	[getPos funkwagen, 50] call spawnOpforHQ;


	0 = [] execVM "server\spawn\showLeaderInformation.sqf";


	if (!isMultiplayer) then {
		_opfor_marker_start = createMarker ["debug_opfor_marker_start", RUS_VEHICLE_SPAWN];
		_opfor_marker_start setMarkerType "hd_start";
		_opfor_marker_start setMarkerColor "ColorOpfor";
	};
};

createBluforStuff = {
	_opforposition = _this;

	[_opforposition, BLUFOR_SPAWN_DISTANCE] call spawnBluforHQ;

	if (!isMultiplayer) then {
		_blufor_marker_start = createMarker ["debug_blufor_marker_start", US_VEHICLE_SPAWN];
		_blufor_marker_start setMarkerType "hd_start";
		_blufor_marker_start setMarkerColor "ColorBlufor";
	};
};

_OPFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;
	_pos spawn createOpforStuff;
	publicVariable "OPFOR_TELEPORT_TARGET";
	_pos spawn createBluforStuff;
};


_BLUFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;
	publicVariable "BLUFOR_TELEPORT_TARGET";
};


"OPFOR_TELEPORT_TARGET" addPublicVariableEventHandler _OPFOR_TELEPORT_TARGET_listener;
"BLUFOR_TELEPORT_TARGET" addPublicVariableEventHandler _BLUFOR_TELEPORT_TARGET_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_OPFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {OPFOR_TELEPORT_TARGET select 0 != 0};
		[0, OPFOR_TELEPORT_TARGET] call _this;
	};
};

if (!isMultiplayer) then {
	_BLUFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {BLUFOR_TELEPORT_TARGET select 0 != 0};
		[0, OPFOR_TELEPORT_TARGET] call _this;
	};
};
