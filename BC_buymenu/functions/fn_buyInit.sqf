/*
    init buy on client
*/

params ["_control"];
_control params ["_baseConfigName"];

private _display = uiNamespace getVariable ["BC_buymenu_display", _display];
private _spawnCone = uiNamespace getVariable ["BC_buymenu_spawnCone", objNull];
_display closeDisplay 1;

[player] remoteExec ["BC_buymenu_fnc_dropMoney", [0,-2] select isDedicated];

private _identifier = format ["BC_buymenu_spawnQueue_%1", _baseConfigName];
private _buyQueue = missionNamespace getVariable [_identifier, []];

[_identifier, _spawnCone, _buyQueue] remoteExec ["BC_buymenu_fnc_buyComplete", 2];