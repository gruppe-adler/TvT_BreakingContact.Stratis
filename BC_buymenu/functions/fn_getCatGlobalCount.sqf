params ["_baseConfigName", "_catName"];

private _identifierSave = format ["BC_buymenu_catValueValues_%1_%2", _baseConfigName, _catName];
private _catCountValue = missionNamespace getVariable [_identifierSave, 0];

// diag_log format ["getting _catCountValue %1 : %2", _identifierSave, _catCountValue];

_catCountValue