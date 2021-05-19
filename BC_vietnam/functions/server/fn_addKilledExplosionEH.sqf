params ["_vehicle"];

_vehicle addMPEventHandler ["MPKilled", {
    params ["_vehicle"];

    if (local _vehicle) then {
        [_vehicle] remoteExecCall ["BC_vietnam_fnc_explosionServer", 2];
    };
}];