params ["_itemConfigName", "_baseConfigName"];

private _identifierSave = format ["BC_buymenu_boughtItemValues_%1_%2", _baseConfigName, _itemConfigName];
private _vehicleCountValue = missionNamespace getVariable [_identifierSave, 0];

// diag_log format ["getting _vehicleCountCacheValue %1 : %2", _identifierSave, _vehicleCountValue];

_vehicleCountValue