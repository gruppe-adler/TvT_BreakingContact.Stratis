centerString = {
	_string = _this select 0;
	_newstring = "<t align='center'>" + (str _string) + "</t>";

	_newstring
};


headlineString = {
	_headlinestring = _this select 0;
	_headlinenewstring = "<t size='2' align='center' color='#33ffffff'>" + _headlinestring + "</t>";

	_headlinenewstring
};


resetRussianUI = {

		disableSerialization;

		_buttonRelease = "Anfordern";
		_headlineRelease = ["Nachschub anfordern"] call headlineString;

		disableSerialization;
		_display = findDisplay 1000;
		_display displayCtrl 1600 ctrlSetStructuredText parseText ([_headlineRelease] call headlineString);

		ctrlSetText [1501, _buttonRelease];
		ctrlSetText [1502, _buttonRelease];
		ctrlSetText [1503, _buttonRelease];
		ctrlSetText [1504, _buttonRelease];
		ctrlSetText [1505, _buttonRelease];

		ctrlEnable [1501, true];
		ctrlEnable [1502, true];
		ctrlEnable [1503, true];
		ctrlEnable [1504, true];
		ctrlEnable [1505, true];
		VEHICLE_ORDERED_WEST = [false,0];
		publicVariable "VEHICLE_ORDERED_WEST";
			
};

refreshRussianOrder = {
	_bool = (_this select 0) select 0;
	_eta = (_this select 0) select 1;

	// if (DEBUG) then { diag_log format ["_bool is %1, _eta is %2",_bool, _eta];};

	_headlineBlocked = "Anforderung läuft";
	_refreshPleasewait = format ["noch %1 s",_eta];

	if (_bool) then {
		
		disableSerialization;
		_display = findDisplay 1000;

		_display displayCtrl 1600 ctrlSetStructuredText parseText ([_headlineBlocked] call headlineString);
		ctrlSetText [1501, _refreshPleasewait];
		ctrlSetText [1502, _refreshPleasewait];
		ctrlSetText [1503, _refreshPleasewait];
		ctrlSetText [1504, _refreshPleasewait];
		ctrlSetText [1505, _refreshPleasewait];

		ctrlEnable [1501, false];
		ctrlEnable [1502, false];
		ctrlEnable [1503, false];
		ctrlEnable [1504, false];
		ctrlEnable [1505, false];

		if (DEBUG) then { diag_log format ["_bool is %1, _eta is %2",_bool, _eta];};


	} else {

		[] call resetRussianUI;
	};
	
};


refreshRussianUI = {
	_array = _this select 0;
	_outOfMoney = _this select 1;
	_outOfStockIndicator = _this select 2;
	_vehicleOrdered = _this select 3;
	_vehicleExtras = _this select 4;
	_vehicleCalls = _this select 5;
	_vehicleEta = _this select 6;




	//_disabledButtons = [[1501,1502,1503,1504],_array] call checkForDisabledButtons;

	
	if (DEBUG) then {diag_log format ["_outOfStockIndicator is %1",_outOfStockIndicator]; };

	_pleasewait = "Bitte warten";
	_headlineBlocked = "Anforderung läuft";
	_moneyLeft = "<t align='left'>" + str (_array select 0) + "</t>";


	disableSerialization;
	_display = findDisplay 1000;

	if (!(_vehicleOrdered == "")) then {
		VEHICLE_ORDERED_WEST = [true,_vehicleEta];
		publicVariable "VEHICLE_ORDERED_WEST";

		_display displayCtrl 1600 ctrlSetStructuredText parseText ([_headlineBlocked] call headlineString);
		ctrlSetText [1501, _pleasewait];
		ctrlSetText [1502, _pleasewait];
		ctrlSetText [1503, _pleasewait];
		ctrlSetText [1504, _pleasewait];
		ctrlSetText [1505, _pleasewait];
	};
	
	[VEHICLE_ORDERED_WEST] call refreshRussianOrder;

	if (_outOfMoney) exitWith {
		[] call resetRussianUI;

		_brightness = 0;
		disableSerialization;
		_display displayCtrl _idc ctrlSetStructuredText parseText _moneyLeft;

		for [{_i=0}, {_i<10}, {_i=_i+1}] do
		{	

			_color = [1, _brightness, _brightness, 1];

			_brightness = _brightness + 0.1;
			_display displayCtrl 1700 ctrlSetTextColor _color;

			disableSerialization;
			sleep 0.05;
		};
	};

	if (_outOfStockIndicator != 0) exitWith {
		[] call resetRussianUI;

		_idc = [_outOfStockIndicator] call russian_buttonIDC_to_countleftIDC;
		_countLeft = [_idc] call russian_IDC_to_countleft;

		_brightness = 0;

		disableSerialization;
		ctrlEnable [_idc, false];

		for [{_i=0}, {_i<10}, {_i=_i+1}] do
		{	

			_color = [1, _brightness, _brightness, 1];

			_brightness = _brightness + 0.1;
			_text = "<t align='center'>0</t>";
			_display displayCtrl _idc ctrlSetTextColor _color;
			_display displayCtrl _idc ctrlSetStructuredText parseText _text;
			
			disableSerialization;
			sleep 0.05;
		};
	};


	_namedisplay_1 = (_array select 1) select 1;
	_countleft_1 = (_array select 1) select 2;
	_pricedisplay_1 = (_array select 1) select 3;
	_eta_1 = (_array select 1) select 4;

	_namedisplay_2 = (_array select 2) select 1;
	_countleft_2 = (_array select 2) select 2;
	_pricedisplay_2 = (_array select 2) select 3;
	_eta_2 = (_array select 2) select 4;

	_namedisplay_3 = (_array select 3) select 1;
	_countleft_3 = (_array select 3) select 2;
	_pricedisplay_3 = (_array select 3) select 3;
	_eta_3 = (_array select 3) select 4;

	_namedisplay_4 = (_array select 4) select 1;
	_countleft_4 = (_array select 4) select 2;
	_pricedisplay_4 = (_array select 4) select 3;
	_eta_4 = (_array select 4) select 4;

	_namedisplay_5 = (_array select 5) select 1;
	_countleft_5 = (_array select 5) select 2;
	_pricedisplay_5 = (_array select 5) select 3;
	_eta_5 = (_array select 5) select 4;

	

	//if (DEBUG) then { diag_log format ["typeName _namedisplay_1: %1",typeName _namedisplay_1]; };

	

	

	_display displayCtrl 1101 ctrlSetStructuredText parseText ([_namedisplay_1] call centerString);
	_display displayCtrl 1201 ctrlSetStructuredText parseText ([_countleft_1] call centerString);
	_display displayCtrl 1301 ctrlSetStructuredText parseText ([_pricedisplay_1] call centerString);
	//_display displayCtrl 1401 ctrlSetStructuredText parseText _eta_1;
	// ctrlSetText [1501, _pleasewait];

	
	_display displayCtrl 1102 ctrlSetStructuredText parseText ([_namedisplay_2] call centerString);
	_display displayCtrl 1202 ctrlSetStructuredText parseText ([_countleft_2] call centerString);
	_display displayCtrl 1302 ctrlSetStructuredText parseText ([_pricedisplay_2] call centerString);
	//_display displayCtrl 1402 ctrlSetStructuredText parseText _eta_2;
	// ctrlSetText [1502, _pleasewait];

	
	_display displayCtrl 1103 ctrlSetStructuredText parseText ([_namedisplay_3] call centerString);
	_display displayCtrl 1203 ctrlSetStructuredText parseText ([_countleft_3] call centerString);
	_display displayCtrl 1303 ctrlSetStructuredText parseText ([_pricedisplay_3] call centerString);
	//_display displayCtrl 1403 ctrlSetStructuredText parseText _eta_3;
	// ctrlSetText [1503, _pleasewait];

	
	_display displayCtrl 1104 ctrlSetStructuredText parseText ([_namedisplay_4] call centerString);
	_display displayCtrl 1204 ctrlSetStructuredText parseText ([_countleft_4] call centerString);
	_display displayCtrl 1304 ctrlSetStructuredText parseText ([_pricedisplay_4] call centerString);
	//_display displayCtrl 1404 ctrlSetStructuredText parseText _eta_4;
	// ctrlSetText [1504, _pleasewait];

	_display displayCtrl 1105 ctrlSetStructuredText parseText ([_namedisplay_5] call centerString);
	_display displayCtrl 1205 ctrlSetStructuredText parseText ([_countleft_5] call centerString);
	_display displayCtrl 1305 ctrlSetStructuredText parseText ([_pricedisplay_5] call centerString);

	disableSerialization;
	
	_display displayCtrl 1700 ctrlSetStructuredText parseText _moneyLeft;

	if (_vehicleOrdered == "") exitWith {};

	// if (DEBUG) then { diag_log format ["end of refresh UI reached"]; };

	russianSupplies = _array;

	publicVariable "russianSupplies";
	
	// // // // //
	[_vehicleOrdered,_vehicleExtras,_vehicleCalls,_vehicleEta] spawn {
		_vehicle = _this select 0;
		_extras = _this select 1;
		_calls = _this select 2;
		_eta = _this select 3;


		while {_eta > 0} do
		{
			_eta = _eta - 1;
		
			VEHICLE_ORDERED_WEST = [true,_eta];
			publicVariable "VEHICLE_ORDERED_WEST";
			[VEHICLE_ORDERED_WEST] call refreshRussianOrder;
			sleep 1;
		};

		[] call resetRussianUI;

		[_vehicle, russianSpawnPos, _extras, _calls] call spawnSupplyDrop;
	};

};
