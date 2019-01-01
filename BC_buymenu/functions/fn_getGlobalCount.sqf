params ["_baseConfigName", "_classname"];

private _identifier = format ["BC_buymenu_buyList_%1", _baseConfigName];
private _boughtVehicles = missionNamespace getVariable [_identifier, []];

({_x isEqualTo _classname} count _boughtVehicles)