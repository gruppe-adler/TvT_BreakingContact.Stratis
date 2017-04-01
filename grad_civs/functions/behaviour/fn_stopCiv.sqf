_civ = _this select 0;

if (_civ getVariable ["GRAD_isPointedAtBy",0] > 0) exitWith {};

[_civ] spawn {
    params ["_civ"];

    doStop _civ;
    _civ leaveVehicle (vehicle _civ);

    waitUntil {vehicle _civ == _civ};


    _civ playMoveNow "AidlPercSnonWnonDnon_talk1";
    sleep 0.1;
    _civ disableAI "MOVE";
    _civ disableAI "FSM";
    _civ disableAI "CHECKVISIBLE";
    _civ disableAI "ANIM";
    diag_log format ["disabling AI"];

    waitUntil {sleep 3; _civ getVariable ["GRAD_isPointedAtBy",0] == 0};
    _civ playMoveNow "";
    // diag_log format ["reenabling AI"];
    _civ enableAI "MOVE";
    _civ enableAI "FSM";
    _civ enableAI "CHECKVISIBLE";
    _civ enableai "ANIM";

    [group _civ, _position, 400 - (random 300), [3,6], [0,2,10]] call GRAD_civs_fnc_taskPatrol;

};