fnc_createToolbar = {

	disableSerialization;

	_tgui = _this select 0;
	_tmoney = missionNamespace getVariable [(player getVariable 'GRAD_buymenu_money_name'), 0];

	 _credits_x = safeZoneX + (safeZoneW/10);
	 _exitbtn_x =  safeZoneX + safeZoneW - (safeZoneW/10);
	 _credits_width = (safeZoneX + safeZoneW)/8;
	 _exit_width = (safeZoneX + safeZoneW)/10;

	 _credits = [2001, _tgui, _credits_x, _credits_width, _tmoney] spawn fnc_createToolbarCredits;
	 _headline = [2002, _tgui, "Buy vehicles"] spawn fnc_createToolbarHeadline;
	 _exitbtn = [2003, _tgui, _exitbtn_x, _exit_width,"Close"] spawn fnc_createToolbarExitButton;

};

_gui = [] call fnc_createEntries;
_toolbar = [_gui] spawn fnc_createToolbar;
