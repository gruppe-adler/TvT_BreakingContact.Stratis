_grp1 = _this select 0;
_car1 = _this select 1;

_crewCargo = _grp1 createUnit ["C_man_1", _pos, [], 0, "CARGO"];

_crewCargo disableAI "FSM";

_crewCargo call GRAD_civs_fnc_dressAndBehave;
[_crewCargo] call GRAD_civs_fnc_addConversationAnswers;
[_crewCargo] call GRAD_civs_fnc_addBrainEventhandler;

_crewCargo assignAsCargo _car1;
_crewCargo moveInCargo _car1;