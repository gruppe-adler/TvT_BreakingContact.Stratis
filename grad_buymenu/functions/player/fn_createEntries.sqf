disableSerialization;
params ["_isRefresh"];

_givenSupplies = missionNamespace getVariable (player getVariable 'GRAD_buymenu_supplies_name');
_allowedSupplies = player getVariable ["GRAD_canBuy", []];


// info: changed this part for BC, only one guy can buy anyway, but all can see
_applicableSupplies = [];
{

		_applicableSupplies pushBack _x;
} forEach (allVariables _givenSupplies);

if (!_isRefresh) then {
	createDialog "GRAD_buy_menu";
	buyMenuOpen = true;
};

_dummyPictureIDCs = [
	1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349
];


_createdGui = uiNamespace getVariable ['GRAD_buy_menu_var',displayNull];
if (!_isRefresh) then {
	{ctrlShow [_x, false];} forEach _dummyPictureIDCs;
};


if (isNull _createdGui) exitWith {displayNull};
randIDC = 1000;
randIDC = [randIDC] call GRAD_buymenu_fnc_getNextIDC;
picIDC = 1338;
allMouseOver = [];
_amountOfVehicles = count _applicableSupplies;

// sorting vehicles
_applicableSupplies = [
	_applicableSupplies,
	[],
	{(_givenSupplies getVariable _x) select 4 },
	"ASCEND"
] call BIS_fnc_sortBy;

// sort boxes
/*
{
// diag_log format ["sort before: %1", _applicableSupplies];
  if (_x == "recon_box" || _x == "transmitter" || _x == "ammo_box") then {

  	_applicableSupplies = _applicableSupplies - [_x];
  	_applicableSupplies pushBack _x;
  	diag_log format ["sort after %1", _applicableSupplies];
  };
} forEach _applicableSupplies;
*/

[randIDC, _createdGui] call GRAD_buymenu_fnc_createKeys;

{
	_supplyItem = _givenSupplies getVariable _x;
	//diag_log format ["foreachindex: %1",_forEachIndex];
	_valueMeasurements = [_amountOfVehicles,_amountOfVehicles - _forEachIndex] call GRAD_buymenu_fnc_calculateValuesColumn;
	_picMeasurements = [_amountOfVehicles,_amountOfVehicles - _forEachIndex] call GRAD_buymenu_fnc_calculatePicturesColumn;

	_xCoord = _valueMeasurements select 0;
	_width = _valueMeasurements select 1;
	_picXCoord = _picMeasurements select 0;



	 randIDC = [randIDC] call GRAD_buymenu_fnc_getNextIDC;
	 if (!_isRefresh) then {
	 	_btn = [randIDC, _createdGui, _xCoord, _width, _x] spawn GRAD_buymenu_fnc_createEntryMouseOverArea;
	 };


	 randIDC = [randIDC] call GRAD_buymenu_fnc_getNextIDC;
	 _pic = [picIDC, _createdGui, _picXCoord,_width, _supplyItem select 0 select 0,_amountOfVehicles] spawn GRAD_buymenu_fnc_createEntryPicture;
	 picIDC = [picIDC] call GRAD_buymenu_fnc_getNextIDC;

	 randIDC = [randIDC] call GRAD_buymenu_fnc_getNextIDC;
	 if (!_isRefresh) then {
	 	_title = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 0 select 0, _forEachIndex, _supplyItem select 1] spawn GRAD_buymenu_fnc_createEntryTitle;
	 };

	 randIDC = [randIDC] call GRAD_buymenu_fnc_getNextIDC;
	 if (!_isRefresh) then {
	 	_btn = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 7, _supplyItem select 0 select 0] spawn GRAD_buymenu_fnc_createEntryMouseOver;
	 };

	 randIDC = [randIDC] call GRAD_buymenu_fnc_getNextIDC;
	 if (!_isRefresh) then {
	 	_price = [randIDC, _createdGui, _xCoord, _width, _supplyItem select 3] spawn GRAD_buymenu_fnc_createEntryPrice;
	 };

	 randIDC = [randIDC] call GRAD_buymenu_fnc_getNextIDC;
	 if (_isRefresh) then {
	 	_amount = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 2] spawn GRAD_buymenu_fnc_refreshEntryAmount;
	 } else {
	 	_amount = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 2] spawn GRAD_buymenu_fnc_createEntryAmount;
	 };

	 randIDC = [randIDC] call GRAD_buymenu_fnc_getNextIDC;
	 if (!_isRefresh && !GRAD_BUYMENU_SINGLE_SPAWN_METHOD) then {
	 	_amount = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 8] spawn GRAD_buymenu_fnc_createEntrySpawnMethod;
	 };

	 randIDC = [randIDC] call GRAD_buymenu_fnc_getNextIDC;
	 if (!_isRefresh) then {
	 	_amount = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 8] spawn GRAD_buymenu_fnc_createEntrySpawnMethodMouseOverArea;
	 };


	 // randIDC = [randIDC] call fnc_getNextIDC;
	 // _eta = [randIDC, _createdGui, _xCoord, _width,_supplyItem select 4] spawn fnc_createEntryETA;
	 randIDC = [randIDC] call GRAD_buymenu_fnc_getNextIDC;
	 if (count _allowedSupplies > 0) then {
	 	if (_isRefresh) then {
				_btn = [randIDC, _createdGui, _xCoord, _width, _x, _givenSupplies, _supplyItem select 8, _supplyItem select 9, _supplyItem select 3] spawn GRAD_buymenu_fnc_refreshEntryBuyButton;
			} else {
				_btn = [randIDC, _createdGui, _xCoord, _width, _x, _givenSupplies, _supplyItem select 8, _supplyItem select 9, _supplyItem select 3] spawn GRAD_buymenu_fnc_createEntryBuyButton;
			};
		};





} forEach _applicableSupplies;

_createdGui
