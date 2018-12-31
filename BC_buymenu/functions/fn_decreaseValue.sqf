params ["_parameter"];
_parameter params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

private _connectedControl = _control getVariable ["connectedControl", controlNull];

private _itemValue = _connectedControl getVariable ["value", 0];
private _maxItemValue = _connectedControl getVariable ["maxValue", 0];

if (_itemValue isEqualTo 0) exitWith {};

private _ctrlChosenInThisCat = _connectedControl getVariable ["ctrlChosenInThisCat", controlNull];
private _currentTotalCount = _connectedControl getVariable ["valueCanBuyInThisCat", 0];

private _catValue = _ctrlChosenInThisCat getVariable ["value", 0];
private _maxValue = _ctrlChosenInThisCat getVariable ["maxValue", 0];

_itemValue = _itemValue - 1;
_catValue = _catValue - 1;

_ctrlChosenInThisCat setVariable ["value", _catValue];
_connectedControl setVariable ["value", _itemValue];

if (_itemValue == 0) then {
    _control ctrlEnable false;
} else {
    _control ctrlEnable true;
};


// systemChat format ["%1, %2", _connectedControl, _itemValue];
// disableSerialization;

_connectedControl ctrlSetStructuredText parseText (
    "<t size='1.5' align='center' shadow='0' color='#333'>" + str _itemValue + "</t>"
); 
_connectedControl ctrlCommit 0;


_ctrlChosenInThisCat ctrlSetStructuredText parseText (
    "<t size='1' align='center' color='#333333'>" + 
    str _catValue + "/" + str _maxValue + "</t>"
);

_ctrlChosenInThisCat ctrlCommit 0;