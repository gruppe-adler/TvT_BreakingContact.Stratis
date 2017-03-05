params ["_radioVeh"];

if (typeOf _radioVeh == "rhs_gaz66_r142_vv") then {
    if (_radioVeh getHit "karoserie" == 1 && _radioVeh getHit "motor" == 1 && !(_radioVeh getVariable ["isCookingOff", false])) then {
        _radioVeh setVariable ["isCookingOff", true, true];
        [_radioVeh] remoteExec ["ace_cookoff_fnc_cookOff",_radioVeh,false];
    };
};