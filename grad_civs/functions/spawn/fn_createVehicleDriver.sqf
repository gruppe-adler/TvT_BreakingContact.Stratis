_grp0 = _this select 0;
_car0 = _this select 1;

_crewDriver = _grp0 createUnit ["C_man_1", _pos, [], 0, "CARGO"];

_crewDriver call GRAD_civs_fnc_dressAndBehave;
[_crewDriver] call GRAD_civs_fnc_addConversationAnswers;
[_crewDriver] call GRAD_civs_fnc_addBrainEventhandler;

[_crewDriver, _car0, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
_car0 setFuel 0.1;

_crewDriver assignAsDriver _car0;
_crewDriver moveInDriver _car0;
sleep 0.1;
_crewDriver action ["lightOn", _car0];

_crewDriver setVariable ["GRAD_civs_carOwnerOf", _car0];

if (!isNil "GRAD_REPLAY_CIVILIAN_TRAFFIC_TRACKED" && {GRAD_REPLAY_CIVILIAN_TRAFFIC_TRACKED}) then {
     _crewDriver setVariable ["GRAD_replay_track", true];
};
// hintsilent format ["ordered %1 to enter %2", _crewDriver,_car0];