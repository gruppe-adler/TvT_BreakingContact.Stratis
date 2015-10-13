_OPFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;
	// do nothing at all : TODO CLEANUP
};

"OPFOR_TELEPORT_TARGET" addPublicVariableEventHandler _OPFOR_TELEPORT_TARGET_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_OPFOR_TELEPORT_TARGET_listener spawn {
		waitUntil {OPFOR_TELEPORT_TARGET select 0 != 0};
		[0, OPFOR_TELEPORT_TARGET] call _this;
	};
};
