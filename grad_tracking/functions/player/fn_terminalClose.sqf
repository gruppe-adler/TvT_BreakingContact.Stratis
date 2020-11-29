_object = _this select 0;
_object setVariable ["TerminalStatus",1,true];
[_object,0] call BIS_fnc_dataTerminalAnimate;
GRAD_TERMINAL_ACTIVE = false;
publicVariable "GRAD_TERMINAL_ACTIVE";
(uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;
sleep 2;
_object setVariable ["TerminalStatus",0,true];
_object setVariable ["grad_replay_color", nil, true];