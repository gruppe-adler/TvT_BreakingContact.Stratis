[_unit, true, [0,1.1,0.092], 180] call FUNC(setDraggable);


["setDraggable", [hedgehog, true, [0,1.1,0.092], 180]] call ace_common_fnc_targetEvent;

["SetHandcuffed", [guy1, true]] call ace_common_fnc_localEvent;


["setDraggable", [hedgehog, true, [0,1.1,0.092], 180]] call ace_common_fnc_localEvent;

hedgehog = "Hedgehog" createVehicle position player; [hedgehog, true, [0,1.1,0.092], 180] call ace_dragging_fnc_setDraggable;

[hedgehog, vehicle] call ace_cargo_fnc_loadItem;

["LoadCargo", {hedgehog call FUNC(loadItem)}] call EFUNC(common,addEventHandler);

//[localize "str_GRAD_hint_bluforSpawned"] call EFUNC(common,displayTextStructured);