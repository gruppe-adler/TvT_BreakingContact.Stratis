/*
    
    all logic belongs to us

*/

params ["_parameter", "_increaseValue"];
_parameter params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

private _parentControl = _control getVariable ["parentControl", controlNull];
private _buttons = _parentControl getVariable ["connectedButtons", []];
_buttons params ["_btnPlus", "_btnMinus"];

private _itemValue = _parentControl getVariable ["value", 0];
private _maxItemValue = _parentControl getVariable ["maxValue", 0];

private _ctrlChosenInThisCat = _parentControl getVariable ["ctrlChosenInThisCat", controlNull];
private _valueMaxInThisCat = _parentControl getVariable ["valueMaxInThisCat", 0];

private _ctrlTotalSideCount = _parentControl getVariable ["ctrlTotalSideCount", controlNull];
private _valueTotalSideCount = _parentControl getVariable ["valueTotalSideCount", 1];

private _catValue = _ctrlChosenInThisCat getVariable ["value", 0];
private _maxValue = _ctrlChosenInThisCat getVariable ["maxValue", 0];

private _crewCount = _parentControl getVariable ["crew", 0];
private _cargoCount = _parentControl getVariable ["cargo", 0];
private _ctrlCrewCount = _parentControl getVariable ["ctrlCrew", controlNull];
private _ctrlCargoCount = _parentControl getVariable ["ctrlCargo", controlNull];

private _data = _parentControl getVariable ["data", []];
private _catPlusMinusButtons = _ctrlChosenInThisCat getVariable ["catPlusMinusButtons", []];

private _catFormatting = "<t size='1' align='center' color='#999999'>";
private _catFormattingMaxed = "<t size='1' align='center' color='#66AA66'>";

if (_increaseValue) then {
    _itemValue = _itemValue + 1;
    _catValue = _catValue + 1;
} else {
    _itemValue = _itemValue - 1;
    _catValue = _catValue - 1;
};

////// LIMITER
// dont allow going above max value
if (_itemValue == _maxItemValue) then {
    _btnPlus ctrlEnable false;
} else {
    _btnPlus ctrlEnable true;
};

// dont allow going below zero
if (_itemValue < 1) then {
    _btnMinus ctrlEnable false;
} else {
    _btnMinus ctrlEnable true;
};

// dont allow overall count above max count
if (_catValue >= _valueMaxInThisCat) then {
    {
        _x params ["_btnPlus", "_btnMinus"];
        _btnPlus ctrlEnable false;
    } forEach _catPlusMinusButtons;

    // indicate change in header
    _catFormatting = _catFormattingMaxed;
} else {
    {
        _x params ["_btnPlus", "_btnMinus"];
        _btnPlus ctrlEnable true; 
    } forEach _catPlusMinusButtons;
};
/////////////


_ctrlChosenInThisCat setVariable ["value", _catValue];
_parentControl setVariable ["value", _itemValue];


// set cargo and crew count
if (_increaseValue) then {
    [true, _ctrlCrewCount, _ctrlCargoCount, _ctrlTotalSideCount, _crewCount, _cargoCount, _valueTotalSideCount] call BC_buymenu_fnc_adjustCrewCargoCount;
    [true, _data] call BC_buymenu_fnc_changeQueue;
} else {
    [false, _ctrlCrewCount, _ctrlCargoCount, _ctrlTotalSideCount, _crewCount, _cargoCount, _valueTotalSideCount] call BC_buymenu_fnc_adjustCrewCargoCount;
    [false, _data] call BC_buymenu_fnc_changeQueue;
};

// systemChat format ["%1, %2", _parentControl, _itemValue];
// disableSerialization;

_parentControl ctrlSetStructuredText parseText (
    "<t size='1.5' align='center' shadow='0' color='#333333'>" + str _itemValue + "</t>"
); 
_parentControl ctrlCommit 0;


_ctrlChosenInThisCat ctrlSetStructuredText parseText (
    _catFormatting + str _catValue + "/" + str _maxValue + "</t>"
);

_ctrlChosenInThisCat ctrlCommit 0;