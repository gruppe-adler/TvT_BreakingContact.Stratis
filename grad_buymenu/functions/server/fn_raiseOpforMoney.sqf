while {true} do {
	moneyOpfor = moneyOpfor + moneyGainOpfor;
	publicVariable "moneyOpfor";
	sleep moneyGainIntervalOpfor;

	if (!isMultiplayer) then {
		// [moneyOpfor] spawn GRAD_buymenu_fnc_refreshCredits;
	};
};