params ["_spawn_pos", "_classname", "_init", "_call", "_selector", "_side"];

_initTexture = _init select 0;
_initAnimationsource = _init select 1;

_vehicle = createVehicle [_classname, _spawn_pos, [], 0, "NONE"];

_road = [getPos _vehicle] call BIS_fnc_nearestRoad;
if (!isNull _road) then {     _roadConnectedTo = roadsConnectedTo _road;
 	_connectedRoad = _roadConnectedTo select 0;
 	_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
 	_vehicle setDir _direction;
};

[_vehicle] call _call;
sleep 0.1;

diag_log format ["init: %1", _init];

if (count _initTexture > 0) then {     [_vehicle, _initTexture, _initAnimationsource] call BIS_fnc_initVehicle;
} else {     [_vehicle, nil, _initAnimationsource] call BIS_fnc_initVehicle;
};
// adjust vehicle (remove lamp covers and stuff)


_vehicle setVehicleLock "UNLOCKED";

_vehicle setVariable ["GRAD_replay_track", true];

[_side, _selector] call GRAD_buymenu_fnc_prepareAfterBuyRefresh;