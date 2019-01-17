params ["_itemConfigName"];

private _identifierSave = format ["BC_buymenu_boughtVehicleValues_%1", _itemConfigName];
private _vehicleCountValue = missionNamespace getVariable [_identifierSave, 0];

_vehicleCountValue