disableSerialization;

params ["_idc", "_display", "_xPos", "_width", "_class", "_mouseOverSelector", ["_title",""]];


/*
	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_class = _this select 4;
	_mouseOverSelector = _this select 5;
*/

if (_title == "") then {
	_title = getText ( configFile >> "CfgVehicles" >> _class >> "DisplayName" ); // _this select 4; // wont be used anymore - config now
};

_ctrlTitle =  _display ctrlCreate ["RscStructuredText", _idc];

_ctrlTitle ctrlSetPosition [_xPos, safeZoneH/20*7, _width, safeZoneH/10];
_ctrlTitle ctrlSetBackgroundColor [0,0,0,0];

_ctrlTitle ctrlSetStructuredText parseText ("<t size='1.6' color='#ffffff' shadow='0' align='center'>" + _title + "</t>");
_ctrlTitle ctrlSetFade 0.5;


// _ctrlTitle ctrlAddEventHandler ["MouseEnter",{ctrlShow [ctrlidc (_this select 0) - 1,true]; false}];
// _ctrlTitle ctrlAddEventHandler ["MouseExit",{ctrlShow [ctrlidc (_this select 0) - 1,false]; false}];


_ctrlTitle ctrlCommit 0;