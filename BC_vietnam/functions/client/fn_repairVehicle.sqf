params ["_vehicle"];

[5, [_vehicle], {
    params ["_vehicle"];
    private _type = typeOf _vehicle;
    private _position = getPos _vehicle;
    private _dir = getDir _vehicle;
    deleteVehicle _vehicle;
    private _replacement = _type createVehicle [0,0,0];
    _replacement setDir _dir;
    _replacement setPos _position;
}, {
    hint "Aborted!"
}, "Repairing Wreck"] call ace_common_fnc_progressBar;