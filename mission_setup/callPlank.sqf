_target = _this select 0;

if (_target == opfor_teamlead) then {



[] spawn {
	while {true} do {

		sleep 1;
		

		if (OPFOR_TELEPORTED) exitWith {

			if (!IS_VANILLA) then {
			[player, [0, 3, 3, 0, 0, 0, 0, 0, 3, 1,0]] call plank_deploy_fnc_init;
			} else {
			[player, [0, 0, 3, 0, 0, 0, 0, 0, 0, 0,1]] call plank_deploy_fnc_init;
			};
			player setVariable ["buildReady", false];
			buildReadyAction1 = player addAction["<t color='#ff5555'>" + localize "str_GRAD_endPlacement" + "</t>",{player setVariable ["buildReady", true]; player removeAction buildReadyAction1;}];
			};

		};
};

};

if (!isNil "opfor_engi") then {
if (_target == opfor_engi) then {

[] spawn {
	while {true} do {

		sleep 1;
		

		if (OPFOR_TELEPORTED) exitWith {
			if (!IS_VANILLA) then {
			[player, [0, 1, 3, 0, 0, 0, 0, 0, 3, 1,0]] call plank_deploy_fnc_init;
			} else {
			[player, [0, 0, 3, 0, 0, 0, 0, 0, 0, 0,1]] call plank_deploy_fnc_init;
			};
			player setVariable ["buildReady", false];
			buildReadyAction2 = player addAction["<t color='#ff5555'>" + localize "str_GRAD_endPlacement" + "</t>",{player setVariable ["buildReady", true]; player removeAction buildReadyAction2;}];
			};

		};
};
};
};