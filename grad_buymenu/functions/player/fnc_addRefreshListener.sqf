/* client side */

_suppliesName =  (player getVariable 'GRAD_buymenu_supplies_name');
_moneyName = (player getVariable 'GRAD_buymenu_money_name');

// money
_moneyListener = {
	if (buyMenuOpen) then {
		[_this select 1] spawn fnc_refreshCredits;
	};
};

_moneyName addPublicVariableEventHandler _moneyListener;

/* E M U L A T I O N  for singleplayer tests */
// MONEY
if (isMultiplayer) exitWith {};

diag_log "entering singleplayer PVEH emulation";

_moneyListener spawn {
	waitUntil {
		sleep 20;
		[0,  missionNamespace getVariable (player getVariable 'GRAD_buymenu_money_name')] call _this;
	}
};
