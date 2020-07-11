/*
    
    all logic belongs to us

*/

params ["_parameter", "_increaseValue"];
_parameter params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

private _parentControl = _control getVariable ["parentControl", controlNull];
private _buttons = _parentControl getVariable ["connectedButtons", []];
_buttons params ["_btnPlus", "_btnMinus"];

private _itemValue = _parentControl getVariable ["value", 0];
private _minItemValue = _parentControl getVariable ["minValue", 0];
private _maxItemValue = _parentControl getVariable ["maxValue", 0];

private _ctrlChosenInThisCat = _parentControl getVariable ["ctrlChosenInThisCat", controlNull];
private _valueMaxInThisCat = _parentControl getVariable ["valueMaxInThisCat", 0];

private _ctrlTotalSideCount = _parentControl getVariable ["ctrlTotalSideCount", controlNull];
private _valueTotalSideCount = _parentControl getVariable ["valueTotalSideCount", 1];

private _catValue = _ctrlChosenInThisCat getVariable ["value", 0];
private _maxValue = _ctrlChosenInThisCat getVariable ["maxValue", 0];
private _stock = _parentControl getVariable ["stock", 0];

private _crewCount = _parentControl getVariable ["crew", 0];
private _cargoCount = _parentControl getVariable ["cargo", 0];
private _ctrlCrewCount = _parentControl getVariable ["ctrlCrew", controlNull];
private _ctrlCargoCount = _parentControl getVariable ["ctrlCargo", controlNull];

private _ctrlSingleCount = _parentControl getVariable ["ctrlSingleCount", controlNull];

private _data = _parentControl getVariable ["data", []];

private _baseConfigName = _parentControl getVariable ["baseConfigName", "none"];
private _categoryName = _parentControl getVariable ["categoryConfigName", "none"];


private _catButtons = _ctrlChosenInThisCat getVariable ["catButtons", []];

// diag_log format ["_data in changeValue %1", _data];

private _catFormatting = "<t size='1' align='center' color='#999999'>";
private _catFormattingMaxed = "<t size='1' align='center' color='#66AA66'>";

if (_increaseValue) then {
    _itemValue = _itemValue + 1;
    _catValue = _catValue + 1;
} else {
    _itemValue = _itemValue - 1;
    _catValue = _catValue - 1;
};

private _itemConfigName = _data param [2, ""];
diag_log format ["_item is %1, _value %2, _stock is %3", _itemConfigName, _itemValue, _stock];


private _enableDisableButtons = {
    params ["_itemValue", "_maxItemValue", "_catValue", "_stock", "_btnPlus", "_btnMinus"];
    
    // reset to default
    _ctrlSingleCount ctrlSetBackgroundColor [0,0,0,0.8];
    _ctrlSingleCount ctrlSetStructuredText parseText ("<t size='0.7' align='center' shadow='0' color='#999999'>" + ("max " + str _stock) + "</t>");

    private _catMaxed = _catValue >= _valueMaxInThisCat;
    
    {
        _x params ["_ctrlItemCount", "_btnPlus", "_btnMinus"];

        // initially enable all, then look for conditions   
        _btnMinus ctrlEnable true;
        _btnPlus ctrlEnable true;

        // actual values for items of cat
        private _itemValue = _ctrlItemCount getVariable ["value", 0];
        private _minItemValue = _ctrlItemCount getVariable ["minValue", 0];
        private _maxItemValue = _ctrlItemCount getVariable ["maxValue", 0];

        if (_catMaxed) then {
             _btnPlus ctrlEnable false;
        };

        // max item value
        if (_itemValue == _maxItemValue) then {
            _btnPlus ctrlEnable false;
            _ctrlSingleCount ctrlSetBackgroundColor [0.4,0.66,0.4,1];
            _ctrlSingleCount ctrlSetStructuredText parseText ("<t size='0.7' align='center' shadow='0' color='#000000'>" + ("max " + str _stock) + "</t>");
        };

        if (_itemValue >= _stock) then {
            _btnPlus ctrlEnable false;
            _ctrlSingleCount ctrlSetBackgroundColor [0.4,0.66,0.4,1];
            _ctrlSingleCount ctrlSetStructuredText parseText ("<t size='0.7' align='center' shadow='0' color='#000000'>" + ("max " + str _stock) + "</t>");
        };        

        // minitemvalue is zero (or above if vehicle bought in previous session)
        if (_itemValue <= _minItemValue) then {
            _btnMinus ctrlEnable false;
        } else {
            _btnMinus ctrlEnable true;
        };

    } forEach _catButtons;

    _catMaxed
};

// needs to be before enabledisablebuttons
_ctrlChosenInThisCat setVariable ["value", _catValue];
_parentControl setVariable ["value", _itemValue];

private _catMaxed = [_itemValue, _maxItemValue, _catValue, _stock, _btnPlus, _btnMinus] call _enableDisableButtons;

if (_catMaxed) then {
    _catFormatting = _catFormattingMaxed
};

[_baseConfigName, _categoryName, _catValue] call BC_buymenu_fnc_saveCatGlobalCache;

// set cargo and crew count
if (_increaseValue) then {
    [true, _ctrlCrewCount, _ctrlCargoCount, _ctrlTotalSideCount, _crewCount, _cargoCount, _valueTotalSideCount] call BC_buymenu_fnc_adjustCrewCargoCount;
    [true, _data] call BC_buymenu_fnc_changeQueue;
    [true, _data] call BC_buymenu_fnc_saveItemGlobalCache;
} else {
    [false, _ctrlCrewCount, _ctrlCargoCount, _ctrlTotalSideCount, _crewCount, _cargoCount, _valueTotalSideCount] call BC_buymenu_fnc_adjustCrewCargoCount;
    [false, _data] call BC_buymenu_fnc_changeQueue;
    [false, _data] call BC_buymenu_fnc_saveItemGlobalCache;
};

// systemChat format ["%1, %2", _parentControl, _itemValue];
// disableSerialization;

_parentControl ctrlSetStructuredText parseText (
    "<t size='1.5' align='center' shadow='0' color='#999999'>" + str _itemValue + "</t>"
); 
_parentControl ctrlCommit 0;


_ctrlChosenInThisCat ctrlSetStructuredText parseText (
    _catFormatting + str _catValue + "/" + str _maxValue + "</t>"
);

_ctrlChosenInThisCat ctrlCommit 0;