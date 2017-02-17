createOpforStuff =  {
	_position = _this;

	if (!FACTIONS_DEFAULT) then {
		[_position] call spawnRadioTruck;
	} else {
		blufor_teamlead setVariable ["GRAD_isVIP", true, true];

		_terminal = createVehicle ['Land_DataTerminal_01_F', [0,0,0], [], 0, 'NONE'];
		hideObjectGlobal _terminal;

		missionNameSpace setVariable ["GRAD_tracking_radioVehObj", blufor_teamlead, true];
		missionNameSpace setVariable ["GRAD_tracking_terminalObj", _terminal, true];
		
		if (!isMultiplayer) then {
			[blufor_teamlead, _terminal] execVM "grad_tracking\init.sqf";
		} else {
			[[blufor_teamlead, _terminal], "grad_tracking\init.sqf"] remoteExec ["execVM", 0, true];
		};
		blufor_teamlead setVariable ["detachableRadio", 0, true];
		
		_startVehicle = [_position, 10, "rhsgref_BRDM2_HQ_msv"] call spawnOpforHQ;
		[_startVehicle] call clearInventory;
		_startVehicle setObjectTextureGlobal [0, "rhsgref\addons\rhsgref_a2port_armor\brdm2\data\brdm2_3tone_01_co.paa"];
        _startVehicle setObjectTextureGlobal [1, "rhsgref\addons\rhsgref_a2port_armor\brdm2\data\brdm2_3tone_02_co.paa"];
	};

	0 = [] execVM "server\spawn\showLeaderInformation.sqf";


	if (!isMultiplayer) then {
		_opfor_marker_start = createMarker ["debug_opfor_marker_start", (call RUS_VEHICLE_SPAWN)];
		_opfor_marker_start setMarkerType "hd_start";
		_opfor_marker_start setMarkerColor "ColorOpfor";
	};
};

createBluforStuff = {
	_opforposition = _this;

	if (!FACTIONS_DEFAULT) then {
	    if (IS_WOODLAND) then {
	       blufor_hq = "rhsusf_m998_w_4dr";
	    } else {
	       blufor_hq = "rhsusf_m998_d_4dr";
	    };
	} else {
		blufor_hq = "LOP_AM_Landrover_M2";
	};

	_spawnVehicle = [_opforposition, BLUFOR_SPAWN_DISTANCE, blufor_hq] call spawnBluforHQ;

	if (!isMultiplayer) then {
		_blufor_marker_start = createMarker ["debug_blufor_marker_start", (call US_VEHICLE_SPAWN)];
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
