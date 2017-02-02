params ["_cone"];

_type = _cone getVariable ["GRAD_spawnType","none"];
diag_log format ["disable Spawn sqf"];

switch (_type) do {
	case "blufor": {
		BUY_OPTION_BLUFOR = false; 
		publicVariableServer 'BUY_OPTION_BLUFOR'; 
		blufor_teamlead setVariable ['GRAD_canBuy', false]; 
		closeDialog 0;
		hideObjectGlobal US_SPAWN_PAD;
	};
	case "opfor": {
		BUY_OPTION_OPFOR = false; 
		publicVariableServer 'BUY_OPTION_OPFOR'; 
		opfor_teamlead setVariable ['GRAD_canBuy', false]; 
		closeDialog 0;
		hideObjectGlobal RUS_SPAWN_PAD;
		diag_log format ["opfor spawn removed"];
	};
	default { diag_log format ["error: no spawn type defined"];};
};

// deleteVehicle _cone;