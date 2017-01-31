fnc_eradicateSpawnPadButton = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_selector = _this select 4;
	_supplies = _this select 5;
	_spawnMethod = _this select 6;
	_status = _this select 7;


	_btn =  _display ctrlCreate ["RscButton", _idc];

	_btn ctrlSetPosition [_xPos + (_width/4) - _width/16, safeZoneH/20*14, _width/2 + _width/8, safeZoneH/16];
	_btn ctrlSetBackgroundColor [0,0,0,0];
	_btn ctrlSetTextColor  [1,1,1,1];

	_actionBlufor = "BUY_OPTION_BLUFOR = false; publicVariableServer 'BUY_OPTION_BLUFOR'; blufor_teamlead setVariable ['GRAD_canBuy', false]; closeDialog 0;";
	_actionOpfor = "BUY_OPTION_OPFOR = false; publicVariableServer 'BUY_OPTION_OPFOR'; opfor_teamlead setVariable ['GRAD_canBuy', false]; closeDialog 0;";

	if (playerSide == WEST) then {
		buttonSetAction [_idc, _actionBlufor];
	} else {
		buttonSetAction [_idc, _actionOpfor];
	};
	_display displayctrl _idc ctrlSetTooltip "WARNING: you cant undo this & you cant buy anymore.";

	_btn ctrlCommit 0;
};