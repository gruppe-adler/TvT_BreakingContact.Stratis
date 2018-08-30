params ["_spawn_pos", "_classname", "_init", "_call", "_selector", "_side"];

_vehicle = createVehicle [_classname, _spawn_pos, [], 0, "NONE"];

[_vehicle] call _call;
sleep 0.1;

// adjust vehicle (remove lamp covers and stuff)
if (count _init > 0) then {
          [_vehicle, nil, _init] call BIS_fnc_initVehicle;
};
_vehicle setVehicleLock "UNLOCKED";

[_side, _selector] call GRAD_buymenu_fnc_prepareAfterBuyRefresh;