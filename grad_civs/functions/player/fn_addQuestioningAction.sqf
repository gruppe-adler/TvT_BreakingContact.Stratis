// for local execution of interrogation actions

_verhoer = _this addAction ["<t color='#66aa66'>Verhören</t>",{
	[_this select 0, _this select 1] remoteExec ["GRAD_civs_fnc_questionCiv", [2,0] select (isMultiplayer && isDedicated), false];
[player] call ace_weaponselect_fnc_putWeaponAway;},
0, 100, true, true, '',
"player distance _target < 3 && !(_target getVariable ['GRAD_civs_isOccupied',false]) && alive _target"];
_this setUserActionText [_verhoer, "<t color='#66aa66'>Verhören</t>"];

_endVerhoer = _this addAction ["<t color='#F24F0F'>Verhör beenden</t>",{
	[_this select 0] remoteExec ["GRAD_civs_fnc_stopCivAbort", [2,0] select (isMultiplayer && isDedicated), false];},
0, 100, true, true, '',
"player distance _target < 3 && !(_target getVariable ['GRAD_civs_isOccupied',false]) && alive _target"];
_this setUserActionText [_endVerhoer, "<t color='#ff3333'>Verhör beenden</t>"];