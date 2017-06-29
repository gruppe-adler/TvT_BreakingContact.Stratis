params ["_civ"];

[_civ, false] call ACE_captives_fnc_setSurrendered;

_civGroup = group _civ;

_vehicle = _civ getVariable ["GRAD_civs_carOwnerOf", objNull];

if (!isNull _vehicle && {(canMove _vehicle)}) then {         

        /* 
        dofollow again to move on to old waypoints from engima
        leader is safer, as driver could be dead already 
        */
       

        (leader _civGroup) assignAsDriver _vehicle;
        {
            if (_x != leader _civGroup) then {
                _x assignAsCargo _vehicle;
            }
        } forEach units _civGroup;

        (units _civGroup) orderGetIn true;
        diag_log format ["%1 ordered to get in", leader _civGroup];

        if (GRAD_CIV_DEBUG) then {
            (leader _civGroup) setVariable ["GRAD_civs_currentlyThinking", "lets get in", true];
        };

        _civ doFollow _civ;
        (units _civGroup) doFollow leader _civGroup;

} else {

    if (GRAD_CIV_DEBUG) then {
        (leader _civGroup) setVariable ["GRAD_civs_currentlyThinking", "lets patrol around", true];
    };

    _civ doFollow _civ;
    (units _civGroup) doFollow leader _civGroup;

};

_civ setVariable ["GRAD_civs_stopScriptRunning", false];
_civ setVariable ["GRAD_civs_civOccupied",false,true];
_civ setVariable ["GRAD_civs_brainStop", 0];