_object = _this select 0;
_object setVariable ["RadioInterference",1,true];
[_object,0] call BIS_fnc_dataTerminalAnimate;
GRAD_TERMINAL_ACTIVE = false;
publicVariableServer "GRAD_TERMINAL_ACTIVE";
(uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;
sleep 2;
_object setVariable ["RadioInterference",0,true];