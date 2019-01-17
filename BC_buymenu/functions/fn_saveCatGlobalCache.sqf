params ["_baseConfigName", "_categoryName", "_catValue"];

private _catValueIdentifierCache = format ["BC_buymenu_catValueCache_%1_%2", _baseConfigName, _categoryName];

missionNamespace setVariable [_catValueIdentifierCache, _catValue, true];