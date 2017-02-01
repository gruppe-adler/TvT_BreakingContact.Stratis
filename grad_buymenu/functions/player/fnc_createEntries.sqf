fnc_createEntries = {
	_givenSupplies = missionNamespace getVariable (player getVariable 'GRAD_buymenu_supplies_name');
	_allowedSupplies = player getVariable ['GRAD_canBuy', []];

	/*
	_applicableSupplies = [];
	{
		if ((_allowedSupplies find (toLower _x)) != -1) then {
			_applicableSupplies pushBack _x;
		} else {
			diag_log format ["FUUUU not applicable: %1 in %2", _x, allVAriables _givenSupplies];
			// TODO  debug log...
		};
	} forEach (allVariables _givenSupplies);
	*/

	_applicableSupplies = _givenSupplies; // changed this for BC, only one guy can buy anyway, but all can see

	0 = createDialog "GRAD_buy_menu";
	buyMenuOpen = true;

	_dummyPictureIDCs = [
		1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349
	];

	disableSerialization;
	_createdGui = uiNamespace getVariable ['GRAD_buy_menu_var',0];
	{ctrlShow [_x, false];} forEach _dummyPictureIDCs;


	// waitUntil {!isNull _createdGui};
	randIDC = 1000;
	randIDC = [randIDC] call fnc_getNextIDC;
	picIDC = 1338;
	allMouseOver = [];
	_amountOfVehicles = count _applicableSupplies;

	// sorting vehicles
	_applicableSupplies = [
		_applicableSupplies,
		[],
		{(_givenSupplies getVariable _x) select 3 },
		"ASCEND"
	] call BIS_fnc_sortBy;

	// sort boxes
	
	{
	// diag_log format ["sort before: %1", _applicableSupplies];
	  if (_x == "recon_box" || _x == "transmitter" || _x == "ammo_box") then {
	  	
	  	_applicableSupplies = _applicableSupplies - [_x];
	  	_applicableSupplies pushBack _x;
	  	diag_log format ["sort after %1", _applicableSupplies];
	  };
	} forEach _applicableSupplies;

	[randIDC, _createdGui] call fnc_createKeys;

	{
		_supplyItem = _givenSupplies getVariable _x;
		//diag_log format ["foreachindex: %1",_forEachIndex];
		_valueMeasurements = [_amountOfVehicles,_amountOfVehicles - _forEachIndex] call fnc_calculateValuesColumn;
		_picMeasurements = [_amountOfVehicles,_amountOfVehicles - _forEachIndex] call fnc_calculatePicturesColumn;

		_xCoord = _valueMeasurements select 0;
		_width = _valueMeasurements select 1;
		_picXCoord = _picMeasurements select 0;


		 randIDC = [randIDC] call fnc_getNextIDC;
		 _btn = [randIDC, _createdGui, _xCoord, _width, _x] spawn fnc_createEntryMouseOverArea;


		 randIDC = [randIDC] call fnc_getNextIDC;
		 _pic = [picIDC, _createdGui, _picXCoord,_width, _supplyItem select 0 select 0,_amountOfVehicles] spawn fnc_createEntryPicture;
		 picIDC = [picIDC] call fnc_getNextIDC;


		 randIDC = [randIDC] call fnc_getNextIDC;
		 _title = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 0 select 0, _forEachIndex, _supplyItem select 1] spawn fnc_createEntryTitle;


		 randIDC = [randIDC] call fnc_getNextIDC;
		 _btn = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 7, _supplyItem select 0 select 0] spawn fnc_createEntryMouseOver;


		 randIDC = [randIDC] call fnc_getNextIDC;
		 _price = [randIDC, _createdGui, _xCoord, _width, _supplyItem select 3] spawn fnc_createEntryPrice;

		 randIDC = [randIDC] call fnc_getNextIDC;
		 _amount = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 2] spawn fnc_createEntryAmount;


		 randIDC = [randIDC] call fnc_getNextIDC;
		 _amount = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 8] spawn fnc_createEntrySpawnMethod;

		 randIDC = [randIDC] call fnc_getNextIDC;
		 _amount = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 8] spawn fnc_createEntrySpawnMethodMouseOverArea;

		 // randIDC = [randIDC] call fnc_getNextIDC;
		 // _eta = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 4] spawn fnc_createEntryETA;

		 if (count _allowedSupplies > 0) then {
		 	randIDC = [randIDC] call fnc_getNextIDC;
 			_btn = [randIDC, _createdGui, _xCoord, _width, _x, _givenSupplies, _supplyItem select 8, _supplyItem select 9] spawn fnc_createEntryBuyButton;
 		};

 		

	} forEach _applicableSupplies;

	_createdGui
};
