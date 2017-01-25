

fnc_createEntryMouseOverArea = {

	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_selector = _this select 4;

	_mouseOverArea =  _display ctrlCreate ["RscStructuredText", _idc];

	_mouseOverArea ctrlSetPosition [_xPos, safeZoneY, _width, (safeZoneY + safeZoneH)/2];
	_mouseOverArea ctrlSetBackgroundColor [0,0,0,0];


	_mouseOverArea ctrlAddEventHandler ["MouseEnter",{
		ctrlShow [ctrlidc (_this select 0) + 3,true]; false
	}];
	_mouseOverArea ctrlAddEventHandler ["MouseExit",{
		ctrlShow [ctrlidc (_this select 0) + 3,false]; false
	}];

	_mouseOverArea setVariable ["GRAD_vehicleIndex" ,_selector];

	_mouseOverArea ctrlAddEventHandler ["MouseButtonClick", {
            [_this] call fnc_selectNextVehicleInArray;
        }];



	//	_mouseOverArea ctrlAddEventHandler ["onMouseMoving", {[_display displayCtrl ctrlidc (_idc-1), _this select 1, _this select 2] call fnc_rotatePicture;}];


	// systemchat format ["%1", allMouseOver select _mouseOverSelector];
	// _mouseOverArea ctrlAddEventHandler ["onMouseMoving",{systemchat format ["%1", (_this select 0)];}];


	_mouseOverArea ctrlCommit 0;
};
