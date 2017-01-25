fnc_createEntryPicture = {
	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_class = _this select 4;
	_amountOfVehicles = _this select 5;

	_ctrlPicture = (_display displayCtrl _idc);

	//diag_log format ["Picture xPos = %1",_xPos];

	

	_model = getText ( configFile >> "CfgVehicles" >> _class >> "Model" );

	ctrlShow [_idc,true];


	_ctrlPicture ctrlsetModelScale 0.8/_amountOfVehicles;

	_ctrlPicture ctrlSetBackgroundColor [0,0,0,0];

	_ctrlPicture ctrlSetPosition [_xPos,3,0.25]; // 	_ctrlPicture ctrlSetPosition [_xPos,3,0.25];
	[_ctrlPicture,[20,0,0]] call fnc_SetModelPitchBankYaw;
	_ctrlPicture ctrlSetModel _model;
	// [_ctrlPicture,[10,0,10]] call fnc_SetModelPitchBankYaw;

	_ctrlPicture ctrlCommit 0;
};
