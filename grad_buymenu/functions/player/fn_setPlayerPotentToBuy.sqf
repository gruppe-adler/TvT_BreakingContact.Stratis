
if (playerSide == east) then {
    private _canBuy = vehicleListOpfor;

    player setVariable ["GRAD_canBuy", _canBuy];

    player setVariable ['GRAD_buymenu_money', {moneyOpfor}, true];
    player setVariable ['GRAD_buymenu_money_name', "moneyOpfor", true];
    player setVariable ['GRAD_buymenu_supplies', {suppliesOpfor}, true];
    player setVariable ['GRAD_buymenu_supplies_name', "suppliesOpfor", true];
    player setVariable ['GRAD_buymenu_spawn_water', {getMarkerPos spawnMarkerOpforWater}];
    player setVariable ['GRAD_buymenu_spawn_land', {getMarkerPos spawnMarkerOpforLand}];
};

if (playerSide == west) then {
    private _canBuy = vehicleListBlufor;

    player setVariable ["GRAD_canBuy", _canBuy];

    player setVariable ['GRAD_buymenu_money', {moneyBlufor}, true];
    player setVariable ['GRAD_buymenu_money_name', "moneyBlufor", true];
    player setVariable ['GRAD_buymenu_supplies', {suppliesBlufor}, true];
    player setVariable ['GRAD_buymenu_supplies_name', "suppliesBlufor", true];

    player setVariable ['GRAD_buymenu_spawn_water', {getMarkerPos spawnMarkerBluforWater}];
    player setVariable ['GRAD_buymenu_spawn_land', {getMarkerPos spawnMarkerBluforLand}];
};

hint "You are the one able to buy stuff for your team at the start vehicle.";
