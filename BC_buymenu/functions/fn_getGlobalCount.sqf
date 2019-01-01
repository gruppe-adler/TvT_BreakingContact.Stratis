params ["_identifier", "_classname"];

private _identifier = format ["BC_buymenu_buyList_%1", _identifier];
private _boughtVehicles = missionNamespace getVariable [_identifier, []];

({_x isEqualTo _classname} count _boughtVehicles)