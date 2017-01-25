fnc_raiseBluforMoney = {
	while {true} do {
		moneyBlufor = moneyBlufor + moneyGainBlufor;
		publicVariable "moneyBlufor";
		sleep moneyGainIntervalBlufor;

		if (!isMultiplayer) then {
			// [moneyBlufor] spawn fnc_refreshCredits;
		};
	};
};

fnc_raiseOpforMoney = {
	while {true} do {
		moneyOpfor = moneyOpfor + moneyGainOpfor;
		publicVariable "moneyOpfor";
		sleep moneyGainIntervalOpfor;

		if (!isMultiplayer) then {
			// [moneyOpfor] spawn fnc_refreshCredits;
		};
	};
};
