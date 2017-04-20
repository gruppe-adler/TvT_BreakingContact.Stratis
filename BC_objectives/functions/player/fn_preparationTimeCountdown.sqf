params [["_timeLeft",0]];

if (!hasInterface) exitWith {};

disableSerialization;
"grad_preparationTime" cutRsc ["grad_preparationTime", "PLAIN"];

private _textCtrl = uiNamespace getVariable ['grad_preparationTime',controlNull];
if (isNull _textCtrl) exitWith {};

private _message = if (_timeLeft > 0) then {
    "Game starts in: <br/>%1"
} else {
    player say "TacticalPing";
    "<t size='1.2'>&#160;</t><br/><t color='#00ff00'>Game on!</t>"
};
_textCtrl ctrlSetStructuredText parseText format [_message,[_timeLeft,"MM:SS"] call BIS_fnc_secondsToString];
