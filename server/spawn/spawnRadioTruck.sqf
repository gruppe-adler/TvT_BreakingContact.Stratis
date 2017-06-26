spawnRadioTruck = {
	params ["_position"];

	_radioVeh = [_position, 0, 1, "rhs_gaz66_r142_vv"] call spawnStuff;

	// used for detachable radio unit
	_radioVeh setVariable ["detachableRadio", 0, true];
 
 	_radioVeh addMPEventHandler ["MPKilled", {
 		params ["_unit", "_killer", "_instigator", "_useEffects"];

 		_unit setVariable ["BC_lastDamageSource_causedBy", _killer, true];
 		_unit setVariable ["ace_medical_lastDamageSource", _killer, true];

 	}];

	0 = [_radioVeh, true] execVM "spawn\flagsOnVehicles.sqf";

	sleep 1;
	[_radioVeh] call clearInventory;

	_terminal = createVehicle ['Land_DataTerminal_01_F', [0,0,0], [], 0, 'NONE'];
	hideObjectGlobal _terminal;

	missionNameSpace setVariable ["GRAD_tracking_radioVehObj", _radioVeh, true];
	missionNameSpace setVariable ["GRAD_tracking_terminalObj", _terminal, true];
	
	[[_radioVeh, _terminal, _position], "grad_tracking\init.sqf"] remoteExec ["execVM", 0, true];

	// create replay
	[[REPLAY_ACCURACY, _radioVeh], "node_modules\grad_replay\GRAD_replay_init.sqf"] remoteExec ["execVM", 0, true];

	// create tasks
	[[], "BC_objectives\init.sqf"] remoteExec ["execVM", 0, true];


	if (!IS_WOODLAND) then {
		_radioVeh setObjectTextureGlobal [0,"rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa"];
	    _radioVeh setObjectTextureGlobal [1,"rhsafrf\addons\rhs_gaz66\data\tent_co.paa"];
	    _radioVeh setObjectTextureGlobal [2,"rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_kung_sand_co.paa"];
	    _radioVeh setObjectTextureGlobal [3,"rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_ap2kung_sand_co.paa"];
	    _radioVeh setObjectTextureGlobal [4,"rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_repkung_sand_co.paa"];
	};

	// hide light covers for optical reasons
	_radioVeh animate ["light_hide",1];
	sleep 0.1;


	[getPos _radioVeh, 50, "Land_ClutterCutter_large_F"] call spawnOpforHQ;
	_radioVeh addItemCargoGlobal ["ACE_SpraypaintBlack",10];
	_radioVeh addItemCargoGlobal ["ACE_SpraypaintBlue",10];
	_radioVeh addItemCargoGlobal ["ACE_SpraypaintGreen",10];
	_radioVeh addItemCargoGlobal ["ACE_SpraypaintRed",10];
	_radioVeh addItemCargoGlobal ["ACE_EntrenchingTool",10];
	_radioVeh addItemCargoGlobal ["ACE_NVG_Gen2",50];
	_radioVeh addItemCargoGlobal ["tf_fadak", 10];

};