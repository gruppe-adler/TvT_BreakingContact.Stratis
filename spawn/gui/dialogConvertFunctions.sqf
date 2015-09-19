// converts credits to creditstring

creditString = {
    _credits = _this select 0;

    _string = "<t align='center'>" + (str _credits) + "</t>";

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
		default {};
	};

	_price
	
};


// takes IDC , gives back pricedisplay string
russian_IDC_to_pricedisplay = {
	_idc = _this select 0;
	_pricedisplay = 0;

	switch (_idc) do {

		case 1501: { _pricedisplay = ((russianSupplies select 1) select 4); };
		case 1502: { _pricedisplay = ((russianSupplies select 2) select 4); };
		case 1503: { _pricedisplay = ((russianSupplies select 3) select 4); };
		case 1504: { _pricedisplay = ((russianSupplies select 4) select 4); };
		case 1505: { _pricedisplay = ((russianSupplies select 5) select 4); };
		default {};
	};

	_pricedisplaystring = [_pricedisplay] call creditString;

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
		default {};
	};

	_calls
};











// MUDSCHAHEDIN


mudschahedin_IDC_to_selector = {
	_idc = _this select 0;
	_selector = 0;

	switch (_idc) do {

		case 3501: { _selector = 1; };
		case 3502: { _selector = 2; };
		case 3503: { _selector = 3; };
		case 3504: { _selector = 4; };
		case 3505: { _selector = 5; };
		default {};

	};

	_selector
	
};


// takes IDC , gives back classname
mudschahedin_IDC_to_classname = {
	_idc = _this select 0;
	_classname = "";

	switch (_idc) do {

		case 3501: { _classname = ((mudschahedinSupplies select 1) select 0); };
		case 3502: { _classname = ((mudschahedinSupplies select 2) select 0); };
		case 3503: { _classname = ((mudschahedinSupplies select 3) select 0); };
		case 3504: { _classname = ((mudschahedinSupplies select 4) select 0); };
		case 3505: { _classname = ((mudschahedinSupplies select 5) select 0); };
		default {};
	};

	_classname
};


// takes IDC , gives back displayname
mudschahedin_IDC_to_displayname = {
	_idc = _this select 0;
	_displayname = "";

	switch (_idc) do {

		case 3501: { _displayname = ((mudschahedinSupplies select 1) select 1); };
		case 3502: { _displayname = ((mudschahedinSupplies select 2) select 1); };
		case 3503: { _displayname = ((mudschahedinSupplies select 3) select 1); };
		case 3504: { _displayname = ((mudschahedinSupplies select 4) select 1); };
		case 3505: { _displayname = ((mudschahedinSupplies select 5) select 1); };
		default {};
	};

	_displayname
	
};


// takes IDC , gives back countleft
mudschahedin_IDC_to_countleft = {
	_idc = _this select 0;
	_countleft = 0;

	switch (_idc) do {

		case 3501: { _countleft = ((mudschahedinSupplies select 1) select 2); };
		case 3502: { _countleft = ((mudschahedinSupplies select 2) select 2); };
		case 3503: { _countleft = ((mudschahedinSupplies select 3) select 2); };
		case 3504: { _countleft = ((mudschahedinSupplies select 4) select 2); };
		case 3505: { _countleft = ((mudschahedinSupplies select 5) select 2); };
		default {};
	};

	_countleft
	
};

// takes IDC , gives back countleft IDC
mudschahedin_buttonIDC_to_countleftIDC = {
	_idc = _this select 0;
	_countleftIDC = 0;

	switch (_idc) do {

		case 3501: { _countleftIDC = 3201; };
		case 3502: { _countleftIDC = 3202; };
		case 3503: { _countleftIDC = 3203; };
		case 3504: { _countleftIDC = 3204; };
		case 3505: { _countleftIDC = 3205; };
		default {};
	};

	_countleftIDC
	
};

// takes IDC , gives back price number
mudschahedin_IDC_to_price = {
	_idc = _this select 0;
	_price = 0;

	switch (_idc) do {

		case 3501: { _price = ((mudschahedinSupplies select 1) select 3); };
		case 3502: { _price = ((mudschahedinSupplies select 2) select 3); };
		case 3503: { _price = ((mudschahedinSupplies select 3) select 3); };
		case 3504: { _price = ((mudschahedinSupplies select 4) select 3); };
		case 3505: { _price = ((mudschahedinSupplies select 5) select 3); };
		default {};
	};

	_price
	
};


// takes IDC , gives back pricedisplay string
mudschahedin_IDC_to_pricedisplay = {
	_idc = _this select 0;
	_pricedisplay = 0;

	switch (_idc) do {

		case 3501: { _pricedisplay = ((mudschahedinSupplies select 1) select 4); };
		case 3502: { _pricedisplay = ((mudschahedinSupplies select 2) select 4); };
		case 3503: { _pricedisplay = ((mudschahedinSupplies select 3) select 4); };
		case 3504: { _pricedisplay = ((mudschahedinSupplies select 4) select 4); };
		case 3505: { _pricedisplay = ((mudschahedinSupplies select 5) select 4); };
		default {};
	};

	_pricedisplaystring = [_pricedisplay] call creditString;

	_pricedisplaystring
	
};


// takes IDC, gives back ETA
mudschahedin_IDC_to_eta = {
	_idc = _this select 0;
	_eta = 0;

	switch (_idc) do {

		case 3501: { _eta = ((mudschahedinSupplies select 1) select 5); };
		case 3502: { _eta = ((mudschahedinSupplies select 2) select 5); };
		case 3503: { _eta = ((mudschahedinSupplies select 3) select 5); };
		case 3504: { _eta = ((mudschahedinSupplies select 4) select 5); };
		case 3505: { _eta = ((mudschahedinSupplies select 5) select 5); };
		default {};
	};

	_eta
};

// takes IDC, gives back extras
mudschahedin_IDC_to_extras = {
	_idc = _this select 0;
	_extras = 0;

	switch (_idc) do {

		case 3501: { _extras = ((mudschahedinSupplies select 1) select 6); };
		case 3502: { _extras = ((mudschahedinSupplies select 2) select 6); };
		case 3503: { _extras = ((mudschahedinSupplies select 3) select 6); };
		case 3504: { _extras = ((mudschahedinSupplies select 4) select 6); };
		case 3505: { _extras = ((mudschahedinSupplies select 5) select 6); };
		default {};
	};

	_extras
};

// takes IDC, gives back extras
mudschahedin_IDC_to_calls = {
	_idc = _this select 0;
	_calls = 0;

	switch (_idc) do {

		case 3501: { _calls = ((mudschahedinSupplies select 1) select 7); };
		case 3502: { _calls = ((mudschahedinSupplies select 2) select 7); };
		case 3503: { _calls = ((mudschahedinSupplies select 3) select 7); };
		case 3504: { _calls = ((mudschahedinSupplies select 4) select 7); };
		case 3505: { _calls = ((mudschahedinSupplies select 5) select 7); };
		default {};
	};

	_calls
};