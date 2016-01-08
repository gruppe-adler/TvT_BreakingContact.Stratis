// converts credits to creditstring

creditString = {
    _credits = _this select 0;

    _string = "<t align='center'>" + (str _credits) + "</t>";

    _string
};

pricedisplayString = {
    _price = _this select 0;

    _string = "<t align='center'>" + (str _price) + " cr </t>";

    _string
};


// RUSSIANS


// takes IDC, gives back selector
russian_IDC_to_selector = {
	_idc = _this select 0;
	_selector = 0;

	switch (_idc) do {

		case 1501: { _selector = 1; };
		case 1502: { _selector = 2; };
		case 1503: { _selector = 3; };
		case 1504: { _selector = 4; };
		case 1505: { _selector = 5; };
		case 1506: { _selector = 6; };
		case 1507: { _selector = 7; };
		default {};

	};

	_selector
	
};


// takes IDC , gives back classname
russian_IDC_to_classname = {
	_idc = _this select 0;
	_classname = "";

	switch (_idc) do {

		case 1501: { _classname = ((russianSupplies select 1) select 0); };
		case 1502: { _classname = ((russianSupplies select 2) select 0); };
		case 1503: { _classname = ((russianSupplies select 3) select 0); };
		case 1504: { _classname = ((russianSupplies select 4) select 0); };
		case 1505: { _classname = ((russianSupplies select 5) select 0); };
		case 1506: { _classname = ((russianSupplies select 6) select 0); };
		case 1507: { _classname = ((russianSupplies select 7) select 0); };
		default {};
	};

	_classname
};


// takes IDC , gives back displayname
russian_IDC_to_displayname = {
	_idc = _this select 0;
	_displayname = "";

	switch (_idc) do {

		case 1501: { _displayname = ((russianSupplies select 1) select 1); };
		case 1502: { _displayname = ((russianSupplies select 2) select 1); };
		case 1503: { _displayname = ((russianSupplies select 3) select 1); };
		case 1504: { _displayname = ((russianSupplies select 4) select 1); };
		case 1505: { _displayname = ((russianSupplies select 5) select 1); };
		case 1506: { _displayname = ((russianSupplies select 6) select 1); };
		case 1507: { _displayname = ((russianSupplies select 7) select 1); };
		default {};
	};

	_displayname
	
};


// takes IDC , gives back countleft
russian_IDC_to_countleft = {
	_idc = _this select 0;
	_countleft = 0;

	switch (_idc) do {

		case 1501: { _countleft = ((russianSupplies select 1) select 2); };
		case 1502: { _countleft = ((russianSupplies select 2) select 2); };
		case 1503: { _countleft = ((russianSupplies select 3) select 2); };
		case 1504: { _countleft = ((russianSupplies select 4) select 2); };
		case 1505: { _countleft = ((russianSupplies select 5) select 2); };
		case 1506: { _countleft = ((russianSupplies select 6) select 2); };
		case 1507: { _countleft = ((russianSupplies select 7) select 2); };
		default {};
	};

	_countleft
	
};

// takes IDC , gives back countleft IDC
russian_buttonIDC_to_countleftIDC = {
	_idc = _this select 0;
	_countleftIDC = 0;

	switch (_idc) do {

		case 1501: { _countleftIDC = 1201; };
		case 1502: { _countleftIDC = 1202; };
		case 1503: { _countleftIDC = 1203; };
		case 1504: { _countleftIDC = 1204; };
		case 1505: { _countleftIDC = 1205; };
		case 1506: { _countleftIDC = 1206; };
		case 1507: { _countleftIDC = 1207; };
		default {};
	};

	_countleftIDC
	
};

// takes IDC , gives back price number
russian_IDC_to_price = {
	_idc = _this select 0;
	_price = 0;

	switch (_idc) do {

		case 1501: { _price = ((russianSupplies select 1) select 3); };
		case 1502: { _price = ((russianSupplies select 2) select 3); };
		case 1503: { _price = ((russianSupplies select 3) select 3); };
		case 1504: { _price = ((russianSupplies select 4) select 3); };
		case 1505: { _price = ((russianSupplies select 5) select 3); };
		case 1506: { _price = ((russianSupplies select 6) select 3); };
		case 1507: { _price = ((russianSupplies select 7) select 3); };
		default {};
	};

	_price
	
};


// takes IDC , gives back pricedisplay string
russian_IDC_to_pricedisplay = {
	_idc = _this select 0;
	_pricedisplay = 0;

	switch (_idc) do {

		case 1501: { _pricedisplay = ((russianSupplies select 1) select 3); };
		case 1502: { _pricedisplay = ((russianSupplies select 2) select 3); };
		case 1503: { _pricedisplay = ((russianSupplies select 3) select 3); };
		case 1504: { _pricedisplay = ((russianSupplies select 4) select 3); };
		case 1505: { _pricedisplay = ((russianSupplies select 5) select 3); };
		case 1506: { _pricedisplay = ((russianSupplies select 6) select 3); };
		case 1507: { _pricedisplay = ((russianSupplies select 7) select 3); };
		default {};
	};

	_pricedisplaystring = [_pricedisplay] call pricedisplayString;

	_pricedisplaystring
	
};


// takes IDC, gives back ETA
russian_IDC_to_eta = {
	_idc = _this select 0;
	_eta = 0;

	switch (_idc) do {

		case 1501: { _eta = ((russianSupplies select 1) select 5); };
		case 1502: { _eta = ((russianSupplies select 2) select 5); };
		case 1503: { _eta = ((russianSupplies select 3) select 5); };
		case 1504: { _eta = ((russianSupplies select 4) select 5); };
		case 1505: { _eta = ((russianSupplies select 5) select 5); };
		case 1506: { _eta = ((russianSupplies select 6) select 5); };
		case 1507: { _eta = ((russianSupplies select 7) select 5); };
		default {};
	};

	_eta
};

// takes IDC, gives back extras
russian_IDC_to_extras = {
	_idc = _this select 0;
	_extras = 0;

	switch (_idc) do {

		case 1501: { _extras = ((russianSupplies select 1) select 6); };
		case 1502: { _extras = ((russianSupplies select 2) select 6); };
		case 1503: { _extras = ((russianSupplies select 3) select 6); };
		case 1504: { _extras = ((russianSupplies select 4) select 6); };
		case 1505: { _extras = ((russianSupplies select 5) select 6); };
		case 1506: { _extras = ((russianSupplies select 6) select 6); };
		case 1507: { _extras = ((russianSupplies select 7) select 6); };
		default {};
	};

	_extras
};


// takes IDC, gives back calls
russian_IDC_to_calls = {
	_idc = _this select 0;
	_calls = 0;

	switch (_idc) do {

		case 1501: { _calls = ((russianSupplies select 1) select 7); };
		case 1502: { _calls = ((russianSupplies select 2) select 7); };
		case 1503: { _calls = ((russianSupplies select 3) select 7); };
		case 1504: { _calls = ((russianSupplies select 4) select 7); };
		case 1505: { _calls = ((russianSupplies select 5) select 7); };
		case 1506: { _calls = ((russianSupplies select 6) select 7); };
		case 1507: { _calls = ((russianSupplies select 7) select 7); };
		default {};
	};

	_calls
};











// US


US_IDC_to_selector = {
	_idc = _this select 0;
	_selector = 0;

	switch (_idc) do {

		case 3501: { _selector = 1; };
		case 3502: { _selector = 2; };
		case 3503: { _selector = 3; };
		case 3504: { _selector = 4; };
		case 3505: { _selector = 5; };
		case 3506: { _selector = 6; };
		case 3507: { _selector = 7; };
		case 3508: { _selector = 8; };
		default {};

	};

	_selector
	
};


// takes IDC , gives back classname
US_IDC_to_classname = {
	_idc = _this select 0;
	_classname = "";

	switch (_idc) do {

		case 3501: { _classname = ((USSupplies select 1) select 0); };
		case 3502: { _classname = ((USSupplies select 2) select 0); };
		case 3503: { _classname = ((USSupplies select 3) select 0); };
		case 3504: { _classname = ((USSupplies select 4) select 0); };
		case 3505: { _classname = ((USSupplies select 5) select 0); };
		case 3506: { _classname = ((USSupplies select 6) select 0); };
		case 3507: { _classname = ((USSupplies select 7) select 0); };
		case 3508: { _classname = ((USSupplies select 8) select 0); };
		default {};
	};

	_classname
};


// takes IDC , gives back displayname
US_IDC_to_displayname = {
	_idc = _this select 0;
	_displayname = "";

	switch (_idc) do {

		case 3501: { _displayname = ((USSupplies select 1) select 1); };
		case 3502: { _displayname = ((USSupplies select 2) select 1); };
		case 3503: { _displayname = ((USSupplies select 3) select 1); };
		case 3504: { _displayname = ((USSupplies select 4) select 1); };
		case 3505: { _displayname = ((USSupplies select 5) select 1); };
		case 3506: { _displayname = ((USSupplies select 6) select 1); };
		case 3507: { _displayname = ((USSupplies select 7) select 1); };
		case 3508: { _displayname = ((USSupplies select 8) select 1); };
		default {};
	};

	_displayname
	
};


// takes IDC , gives back countleft
US_IDC_to_countleft = {
	_idc = _this select 0;
	_countleft = 0;

	switch (_idc) do {

		case 3501: { _countleft = ((USSupplies select 1) select 2); };
		case 3502: { _countleft = ((USSupplies select 2) select 2); };
		case 3503: { _countleft = ((USSupplies select 3) select 2); };
		case 3504: { _countleft = ((USSupplies select 4) select 2); };
		case 3505: { _countleft = ((USSupplies select 5) select 2); };
		case 3506: { _countleft = ((USSupplies select 6) select 2); };
		case 3507: { _countleft = ((USSupplies select 7) select 2); };
		case 3508: { _countleft = ((USSupplies select 8) select 2); };
		default {};
	};

	_countleft
	
};

// takes IDC , gives back countleft IDC
US_buttonIDC_to_countleftIDC = {
	_idc = _this select 0;
	_countleftIDC = 0;

	switch (_idc) do {

		case 3501: { _countleftIDC = 3201; };
		case 3502: { _countleftIDC = 3202; };
		case 3503: { _countleftIDC = 3203; };
		case 3504: { _countleftIDC = 3204; };
		case 3505: { _countleftIDC = 3205; };
		case 3506: { _countleftIDC = 3206; };
		case 3507: { _countleftIDC = 3207; };
		case 3508: { _countleftIDC = 3208; };
		default {};
	};

	_countleftIDC
	
};

// takes IDC , gives back price number
US_IDC_to_price = {
	_idc = _this select 0;
	_price = 0;

	switch (_idc) do {

		case 3501: { _price = ((USSupplies select 1) select 3); };
		case 3502: { _price = ((USSupplies select 2) select 3); };
		case 3503: { _price = ((USSupplies select 3) select 3); };
		case 3504: { _price = ((USSupplies select 4) select 3); };
		case 3505: { _price = ((USSupplies select 5) select 3); };
		case 3506: { _price = ((USSupplies select 6) select 3); };
		case 3507: { _price = ((USSupplies select 7) select 3); };
		case 3508: { _price = ((USSupplies select 8) select 3); };
		default {};
	};

	_price
	
};


// takes IDC , gives back pricedisplay string
US_IDC_to_pricedisplay = {
	_idc = _this select 0;
	_pricedisplay = 0;

	switch (_idc) do {

		case 3501: { _pricedisplay = ((USSupplies select 1) select 3); };
		case 3502: { _pricedisplay = ((USSupplies select 2) select 3); };
		case 3503: { _pricedisplay = ((USSupplies select 3) select 3); };
		case 3504: { _pricedisplay = ((USSupplies select 4) select 3); };
		case 3505: { _pricedisplay = ((USSupplies select 5) select 3); };
		case 3506: { _pricedisplay = ((USSupplies select 6) select 3); };
		case 3507: { _pricedisplay = ((USSupplies select 7) select 3); };
		case 3508: { _pricedisplay = ((USSupplies select 8) select 3); };
		default {};
	};

	_pricedisplaystring = [_pricedisplay] call pricedisplayString;

	_pricedisplaystring
	
};


// takes IDC, gives back ETA
US_IDC_to_eta = {
	_idc = _this select 0;
	_eta = 0;

	switch (_idc) do {

		case 3501: { _eta = ((USSupplies select 1) select 5); };
		case 3502: { _eta = ((USSupplies select 2) select 5); };
		case 3503: { _eta = ((USSupplies select 3) select 5); };
		case 3504: { _eta = ((USSupplies select 4) select 5); };
		case 3505: { _eta = ((USSupplies select 5) select 5); };
		case 3506: { _eta = ((USSupplies select 6) select 5); };
		case 3507: { _eta = ((USSupplies select 7) select 5); };
		case 3508: { _eta = ((USSupplies select 8) select 5); };
		default {};
	};

	_eta
};

// takes IDC, gives back extras
US_IDC_to_extras = {
	_idc = _this select 0;
	_extras = 0;

	switch (_idc) do {

		case 3501: { _extras = ((USSupplies select 1) select 6); };
		case 3502: { _extras = ((USSupplies select 2) select 6); };
		case 3503: { _extras = ((USSupplies select 3) select 6); };
		case 3504: { _extras = ((USSupplies select 4) select 6); };
		case 3505: { _extras = ((USSupplies select 5) select 6); };
		case 3506: { _extras = ((USSupplies select 6) select 6); };
		case 3507: { _extras = ((USSupplies select 7) select 6); };
		case 3508: { _extras = ((USSupplies select 8) select 6); };
		default {};
	};

	_extras
};

// takes IDC, gives back extras
US_IDC_to_calls = {
	_idc = _this select 0;
	_calls = 0;

	switch (_idc) do {

		case 3501: { _calls = ((USSupplies select 1) select 7); };
		case 3502: { _calls = ((USSupplies select 2) select 7); };
		case 3503: { _calls = ((USSupplies select 3) select 7); };
		case 3504: { _calls = ((USSupplies select 4) select 7); };
		case 3505: { _calls = ((USSupplies select 5) select 7); };
		case 3506: { _calls = ((USSupplies select 6) select 7); };
		case 3507: { _calls = ((USSupplies select 7) select 7); };
		case 3508: { _calls = ((USSupplies select 8) select 7); };
		default {};
	};

	_calls
};