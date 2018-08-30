params ["_cone"];

_type = _cone getVariable ["GRAD_spawnType",civilian];

// disable buying as there is no spawn cone anymore
switch (_type) do {     case west: {     	BUY_OPTION_BLUFOR = false;     	publicVariableServer 'BUY_OPTION_BLUFOR';     	blufor_teamlead setVariable ['GRAD_canBuy', [], true];     };     case east: {     	BUY_OPTION_OPFOR = false;     	publicVariableServer 'BUY_OPTION_OPFOR';     	opfor_teamlead setVariable ['GRAD_canBuy', [], true];     };     default { diag_log format ["error: no spawn type defined"];};
};

closeDialog 0;
hideObjectGlobal _cone;
