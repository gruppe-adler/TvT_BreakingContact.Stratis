disableSerialization;
params ["_idc", "_display", "_xPos", "_width", "_title", "_isRefresh"];

if (!_isRefresh) then {
	_ctrlCredits =  _display ctrlCreate ["RscStructuredText", _idc];
	_ctrlCredits ctrlSetPosition [_xPos, safeZoneY + safeZoneH/20, _width, safeZoneH/20];
	_ctrlCredits ctrlSetBackgroundColor [-1,-1,-1,0];
};

[_title] spawn GRAD_buymenu_fnc_refreshCredits;