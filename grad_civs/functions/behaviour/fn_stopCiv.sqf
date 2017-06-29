params ["_civ"];

_civ = driver _civ;
_civGroup = group _civ;

_panic = _civ getVariable ["GRAD_civs_brainPanic", 0];

if (_civ getVariable ["GRAD_civs_stopScriptRunning", false]) exitWith {
    diag_log format ["already one instance of stopciv running"];
};

if (_civ getVariable ["GRAD_civs_isFleeing", false]) exitWith { 
    _civ setVariable ["GRAD_civs_currentlyThinking", "i wont stop, i'm already fleeing for gods sake", true];
};


diag_log format ["stopping civ"];

_civ setVariable ["GRAD_civs_stopScriptRunning", true];


_vehicle = vehicle _civ;
_vehicleCrew = crew _vehicle;
_isCarOwner = _vehicle isKindOf 'LandVehicle';

if (GRAD_CIV_DEBUG) then {
    _civ setVariable ["GRAD_civs_currentlyThinking", "aaaah i need to stop", true];
};

/* _vehicleCrew = group _civ; */


if (_isCarOwner) then {

    if (GRAD_CIV_DEBUG) then {
        _civ setVariable ["GRAD_civs_currentlyThinking", "aaaah i need to stop the car", true];
    };

    doStop _civ;
    
    waitUntil {speed _vehicle < 1};
   
    { unassignVehicle _x } forEach _vehicleCrew;

    { doGetOut _x } forEach _vehicleCrew;

    waitUntil {isTouchingGround _civ};
    sleep 1;
} else {

    if (GRAD_CIV_DEBUG) then {
        _civ setVariable ["GRAD_civs_currentlyThinking", "aaaah i need to stop myself", true];
    };

    doStop _civ;
};


[_civ, true] call ACE_captives_fnc_setSurrendered;



if (GRAD_CIV_DEBUG) then {
    _civ setVariable ["GRAD_civs_currentlyThinking", "cant run away or i will be shot", true];
};