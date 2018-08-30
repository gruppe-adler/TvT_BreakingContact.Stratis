disableSerialization;

params ["_tgui", "_isRefresh"];

_tmoney = missionNamespace getVariable [(player getVariable 'GRAD_buymenu_money_name'), 0];

_credits_x = safeZoneX + (safeZoneW/10);
_exitbtn_x =  safeZoneX + safeZoneW - (safeZoneW/10);
_credits_width = (safeZoneX + safeZoneW)/8;
_exit_width = (safeZoneX + safeZoneW)/10;

if (_isRefresh) exitWith {
      _credits = [2001, _tgui, _credits_x, _credits_width, _tmoney, _isRefresh] spawn GRAD_buymenu_fnc_createToolbarCredits;
};

_credits = [2001, _tgui, _credits_x, _credits_width, _tmoney, _isRefresh] spawn GRAD_buymenu_fnc_createToolbarCredits;
_headline = [2002, _tgui, localize "str_GRAD_buy_headline"] spawn GRAD_buymenu_fnc_createToolbarHeadline;
_exitbtn = [2003, _tgui, _exitbtn_x, _exit_width, localize "str_GRAD_buy_exit"] spawn GRAD_buymenu_fnc_createToolbarExitButton;