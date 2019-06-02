params ["_vehicle"];

private _terminal = missionNameSpace getVariable ["GRAD_tracking_terminalObj", objNull];

if (!local _vehicle && !local _terminal) exitWith {};

diag_log format ["disabling collision between %1 - %2", _terminal, _vehicle];

_vehicle disableCollisionWith _terminal;