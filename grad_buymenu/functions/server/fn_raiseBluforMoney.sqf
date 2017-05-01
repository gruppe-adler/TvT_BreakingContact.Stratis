while {true} do {
	moneyBlufor = moneyBlufor + moneyGainBlufor;
	publicVariable "moneyBlufor";
	sleep moneyGainIntervalBlufor;

	if (!isMultiplayer) then {
		// [moneyBlufor] spawn GRAD_buymenu_fnc_refreshCredits;
	};
};