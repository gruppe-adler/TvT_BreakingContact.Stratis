resetMudschahedinUI = {

		disableSerialization;

		_buttonRelease = "Anfordern";
		_headlineRelease = ["Nachschub anfordern"] call headlineString;

		disableSerialization;
		_display = findDisplay 3000;
		_display displayCtrl 3600 ctrlSetStructuredText parseText ([_headlineRelease] call headlineString);

		ctrlSetText [3501, _buttonRelease];
		ctrlSetText [3502, _buttonRelease];
		ctrlSetText [3503, _buttonRelease];
		ctrlSetText [3504, _buttonRelease];
		ctrlSetText [3505, _buttonRelease];

		ctrlEnable [3501, true];
		ctrlEnable [3502, true];
		ctrlEnable [3503, true];
		ctrlEnable [3504, true];
		ctrlEnable [3505, true];
		VEHICLE_ORDERED_EAST = [false,0];
		publicVariable "VEHICLE_ORDERED_EAST";
			
};

refreshMudschahedinOrder = {
	_bool = (_this select 0) select 0;
	_eta = (_this select 0) select 1;

	//if (DEBUG) then { diag_log format ["_bool is %1, _eta is %2",_bool, _eta];};

	_headlineBlocked = "Anforderung läuft";
	_refreshPleasewait = format ["noch %1 s",_eta];

	if (_bool) then {

		disableSerialization;
		_display = findDisplay 3000;
		_display displayCtrl 3600 ctrlSetStructuredText parseText ([_headlineBlocked] call headlineString);
		ctrlSetText [3501, _refreshPleasewait];
		ctrlSetText [3502, _refreshPleasewait];
		ctrlSetText [3503, _refreshPleasewait];
		ctrlSetText [3504, _refreshPleasewait];
		ctrlSetText [3505, _refreshPleasewait];

		ctrlEnable [3501, false];
		ctrlEnable [3502, false];
		ctrlEnable [3503, false];
		ctrlEnable [3504, false];
		ctrlEnable [3505, false];

		if (DEBUG) then { diag_log format ["_bool is %1, _eta is %2",_bool, _eta];};

	} else {

		[] call resetmudschahedinUI;
	};
	
};


refreshMudschahedinUI = {
	_array = _this select 0;
	_outOfMoney = _this select 1;
	_outOfStockIndicator = _this select 2;
	_vehicleOrdered = _this select 3;
	_vehicleExtras = _this select 4;
	_vehicleCalls = _this select 5;
	_vehicleEta = _this select 6;




	//_disabledButtons = [[3501,3502,3503,3504],_array] call checkForDisabledButtons;

	
	if (DEBUG) then {diag_log format ["_outOfStockIndicator is %1",_outOfStockIndicator]; };

	_pleasewait = "Bitte warten";
	_headlineBlocked = "Anforderung läuft";
	_moneyLeft = "<t align='left'>" + str (_array select 0) + "</t>";


	disableSerialization;
	_display = findDisplay 3000;

	if (!(_vehicleOrdered == "")) then {
		VEHICLE_ORDERED_EAST = [true,_vehicleEta];
		publicVariable "VEHICLE_ORDERED_EAST";

		_display displayCtrl 3600 ctrlSetStructuredText parseText ([_headlineBlocked] call headlineString);
		ctrlSetText [3501, _pleasewait];
		ctrlSetText [3502, _pleasewait];
		ctrlSetText [3503, _pleasewait];
		ctrlSetText [3504, _pleasewait];
		ctrlSetText [3505, _pleasewait];
	};

	[VEHICLE_ORDERED_EAST] call refreshMudschahedinOrder;

	


	if (_outOfMoney) exitWith {
		[] call resetMudschahedinUI;

		_brightness = 0;
		disableSerialization;
		_display displayCtrl _idc ctrlSetStructuredText parseText _moneyLeft;

		for [{_i=0}, {_i<10}, {_i=_i+1}] do
		{	

			_color = [1, _brightness, _brightness, 1];

			_brightness = _brightness + 0.1;
			_display displayCtrl 3700 ctrlSetTextColor _color;

			disableSerialization;
			sleep 0.05;
		};
	};

	if (_outOfStockIndicator != 0) exitWith {
		[] call resetMudschahedinUI;

		_idc = [_outOfStockIndicator] call mudschahedin_buttonIDC_to_countleftIDC;
		_countLeft = [_idc] call mudschahedin_IDC_to_countleft;

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

	

	

	_display displayCtrl 3101 ctrlSetStructuredText parseText ([_namedisplay_1] call centerString);
	_display displayCtrl 3201 ctrlSetStructuredText parseText ([_countleft_1] call centerString);
	_display displayCtrl 3301 ctrlSetStructuredText parseText ([_pricedisplay_1] call centerString);
	//_display displayCtrl 1401 ctrlSetStructuredText parseText _eta_1;
	// ctrlSetText [3501, _pleasewait];

	
	_display displayCtrl 3102 ctrlSetStructuredText parseText ([_namedisplay_2] call centerString);
	_display displayCtrl 3202 ctrlSetStructuredText parseText ([_countleft_2] call centerString);
	_display displayCtrl 3302 ctrlSetStructuredText parseText ([_pricedisplay_2] call centerString);
	//_display displayCtrl 1402 ctrlSetStructuredText parseText _eta_2;
	// ctrlSetText [3502, _pleasewait];

	
	_display displayCtrl 3103 ctrlSetStructuredText parseText ([_namedisplay_3] call centerString);
	_display displayCtrl 3203 ctrlSetStructuredText parseText ([_countleft_3] call centerString);
	_display displayCtrl 3303 ctrlSetStructuredText parseText ([_pricedisplay_3] call centerString);
	//_display displayCtrl 1403 ctrlSetStructuredText parseText _eta_3;
	// ctrlSetText [3503, _pleasewait];

	
	_display displayCtrl 3104 ctrlSetStructuredText parseText ([_namedisplay_4] call centerString);
	_display displayCtrl 3204 ctrlSetStructuredText parseText ([_countleft_4] call centerString);
	_display displayCtrl 3304 ctrlSetStructuredText parseText ([_pricedisplay_4] call centerString);
	//_display displayCtrl 1404 ctrlSetStructuredText parseText _eta_4;
	// ctrlSetText [3504, _pleasewait];

	_display displayCtrl 3105 ctrlSetStructuredText parseText ([_namedisplay_5] call centerString);
	_display displayCtrl 3205 ctrlSetStructuredText parseText ([_countleft_5] call centerString);
	_display displayCtrl 3305 ctrlSetStructuredText parseText ([_pricedisplay_5] call centerString);

	disableSerialization;
	
	_display displayCtrl 3700 ctrlSetStructuredText parseText _moneyLeft;

	if (_vehicleOrdered == "") exitWith {};

	// if (DEBUG) then { diag_log format ["end of refresh UI reached"]; };

	mudschahedinSupplies = _array;

	publicVariable "mudschahedinSupplies";
	
	// // // // //
	[_vehicleOrdered,_vehicleExtras,_vehicleCalls,_vehicleEta] spawn {
		_vehicle = _this select 0;
		_extras = _this select 1;
		_calls = _this select 2;
		_eta = _this select 3;

		while {_eta > 0} do
		{
			_eta = _eta - 1;
		
			VEHICLE_ORDERED_EAST = [true,_eta];
			publicVariable "VEHICLE_ORDERED_EAST";
			[VEHICLE_ORDERED_EAST] call refreshMudschahedinOrder;
			sleep 1;
		};

	

		[] call resetMudschahedinUI;

		[_vehicle, mudschahedinSpawnPos, _extras, _calls] call spawnSupplyDrop;
	};

};
