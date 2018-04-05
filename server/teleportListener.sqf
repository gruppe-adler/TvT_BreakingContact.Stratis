_OPFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;
  [_pos, 0, "rhs_gaz66_r142_vv"] spawn BC_setup_fnc_spawnStartVehicle;

	publicVariable "OPFOR_TELEPORT_TARGET";

};


_BLUFOR_TELEPORT_TARGET_listener = {
	_pos = _this select 1;

  if (IS_WOODLAND) then {
     blufor_hq = "rhsusf_m998_w_4dr";
  } else {
     blufor_hq = "rhsusf_m998_d_4dr";
  };

	[_pos, BLUFOR_SPAWN_DISTANCE, blufor_hq] spawn BC_setup_fnc_spawnStartVehicle;
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
