params ["_vehicle"];

_vehicle addMPEventHandler ["MPKilled", {
    params ["_vehicle"];

    if (!isServer) exitWith {};

    [_vehicle] call BC_vietnam_fnc_explosionServer;
}];