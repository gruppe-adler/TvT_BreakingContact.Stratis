params ["_parameter"];
_parameter params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

private _countDisplay = _control getVariable ["countCtrl", controlNull];
private _currentCount = _control getVariable ["countCtrlCurrent", 0];

private _countTotalDisplay = _control getVariable ["countCtrlTotal", controlNull];
private _currentTotalCount = _control getVariable ["countCtrlTotalValue", 0];

_currentCount = _currentCount + 1;


systemChat format ["%1, %2", _countDisplay, _currentCount];

disableSerialization;

_control setVariable ["countCtrlCurrent", _currentCount];
_countDisplay ctrlSetStructuredText parseText (
    "<t size='1.5' align='center' shadow='0' color='#333'>" + str _currentCount + "</t>"
); 
_countDisplay ctrlCommit 0;

private _currentValue = _countTotalDisplay getVariable ["value", 0];
private _maxValue = _countTotalDisplay getVariable ["maxValue", 0];
_countTotalDisplay ctrlSetStructuredText parseText ("<t size='1' align='center' color='#333333'>" + str _currentCount + "/" + str _maxValue + "</t>");

_countTotalDisplay ctrlCommit 0;