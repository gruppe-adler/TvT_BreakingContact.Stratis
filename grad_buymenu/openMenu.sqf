_isRefresh = false;

_gui = [false] call GRAD_buymenu_fnc_createEntries;
if (isNull _gui) exitWith {};
_toolbar = [_gui, _isRefresh] spawn GRAD_buymenu_fnc_createToolbar;