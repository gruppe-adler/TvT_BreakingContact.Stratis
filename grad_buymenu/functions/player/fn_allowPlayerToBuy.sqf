/*
	
	[] remoteExec ["GRAD_buymenu_fnc_allowPlayerToBuy", xivid];

*/

private _canBuy = if (side player == west) then {
	vehicleListBlufor
} else {
	vehicleListOpfor
};
	

player setVariable ["GRAD_canBuy", _canBuy];

if (side player == west) then {
	player setVariable ['GRAD_buymenu_money', {moneyBlufor}, true];
	player setVariable ['GRAD_buymenu_money_name', "moneyBlufor", true];
	player setVariable ['GRAD_buymenu_supplies', {suppliesBlufor}, true];
	player setVariable ['GRAD_buymenu_supplies_name', "suppliesBlufor", true];

	player setVariable ['GRAD_buymenu_spawn_water', {getMarkerPos spawnMarkerBluforWater}];
	player setVariable ['GRAD_buymenu_spawn_land', {getMarkerPos spawnMarkerBluforLand}];

} else {
	player setVariable ['GRAD_buymenu_money', {moneyOpfor}, true];
	player setVariable ['GRAD_buymenu_money_name', "moneyOpfor", true];
	player setVariable ['GRAD_buymenu_supplies', {suppliesOpfor}, true];
	player setVariable ['GRAD_buymenu_supplies_name', "suppliesOpfor", true];

	player setVariable ['GRAD_buymenu_spawn_water', {getMarkerPos spawnMarkerOpforWater}];
	player setVariable ['GRAD_buymenu_spawn_land', {getMarkerPos spawnMarkerOpforLand}];
};