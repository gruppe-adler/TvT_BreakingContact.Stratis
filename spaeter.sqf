// 
/* this file contains notes only */
//


[_unit, true, [0,1.1,0.092], 180] call FUNC(setDraggable);


["setDraggable", [hedgehog, true, [0,1.1,0.092], 180]] call ace_common_fnc_targetEvent;

["SetHandcuffed", [guy1, true]] call ace_common_fnc_localEvent;


["setDraggable", [hedgehog, true, [0,1.1,0.092], 180]] call ace_common_fnc_localEvent;

hedgehog = "Hedgehog" createVehicle position player; [hedgehog, true, [0,1.1,0.092], 180] call ace_dragging_fnc_setDraggable;

[hedgehog, vehicle] call ace_cargo_fnc_loadItem;

["LoadCargo", {hedgehog call FUNC(loadItem)}] call EFUNC(common,addEventHandler);

//[localize "str_GRAD_hint_bluforSpawned"] call EFUNC(common,displayTextStructured);

_hedgehog = "Hedgehog" createVehicle (getpos (_this select 0));
            [_hedgehog, true, [0,1.1,0.092], 180] call ace_dragging_fnc_setDraggable;
            _hedgehog setVariable ["ace_cargo_size", 1, true];
            [_hedgehog, _this select 0] call ace_cargo_fnc_loadItem;


"Land_BagFenceRound",
"Land_BagFenceLong"