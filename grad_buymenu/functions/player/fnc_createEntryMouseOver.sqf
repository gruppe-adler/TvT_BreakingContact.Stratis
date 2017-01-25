fnc_createEntryMouseOver = {

	disableSerialization;

	_idc = _this select 0;
	_display = _this select 1;
	_xPos = _this select 2;
	_width = _this select 3;
	_title = _this select 4;
	_class = _this select 5;

	

	_crew1 = [_class,false] call BIS_fnc_crewCount;
	_crew2 = [_class,true] call BIS_fnc_crewCount;
	_crew =	_crew2 - _crew1;
	_speed = 0;
	// diag_log format ["%1",_crew];
	if (!isNull (configFile >> "CfgVehicles" >> _class >> "maxSpeed")) then {
		_speed = getNumber( configFile >> "CfgVehicles" >> _class >> "maxSpeed" );
	} else {
		_speed = 0;
	};

	_mouseOver =  _display ctrlCreate ["RscStructuredText", _idc];

	_mouseOver ctrlSetPosition [_xPos, safeZoneH/20*4, _width, safeZoneH/10];
	//_mouseOver ctrlSetPosition [_xPos, safeZoneH/20*12, _width, safeZoneH/20];
	_mouseOver ctrlSetBackgroundColor [0,0,0,0.2];


	_mouseOver ctrlSetStructuredText parseText ("<t size='0.75' shadow='0' align='center'>" +
	 "Crew: " + str _crew1 + "<br/>" +
	 "Cargo: " + str _crew + "<br/>" +
	 "Max Speed: " + str _speed + " kph" +
	 "</t>");

	_mouseOver ctrlSetTextColor  [1,1,1,0.5];
	_mouseOver ctrlSetFontHeight 0.05;



	ctrlShow [ctrlidc _mouseOver,false];
	_mouseOver ctrlCommit 0;
};
