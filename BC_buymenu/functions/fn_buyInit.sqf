/*
    init buy on client
*/

params ["_button"];
private _baseConfigName = _button getVariable ["identifier", "none"];
// systemChat _baseConfigName;

private _display = uiNamespace getVariable ["BC_buymenu_display", displayNull];
private _startVehicle = uiNamespace getVariable ["BC_buymenu_startVehicle", objNull];
_display closeDisplay 1;

[player] remoteExec ["BC_buymenu_fnc_dropMoney", [0,-2] select isDedicated];

private _identifier = format ["BC_buymenu_spawnQueue_%1", _baseConfigName];
private _buyQueue = missionNamespace getVariable [_identifier, []];

[player, _identifier, _startVehicle, _buyQueue] remoteExec ["BC_buymenu_fnc_buyComplete", 2];