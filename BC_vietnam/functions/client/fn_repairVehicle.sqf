params ["_vehicle"];

[120, [_vehicle], {
    _args params ["_vehicle"];
    private _type = typeOf _vehicle;
    private _position = getPos _vehicle;
    private _dir = getDir _vehicle;
    deleteVehicle _vehicle;
    private _replacement = _type createVehicle [0,0,0];
    _replacement setDir _dir;
    _replacement setPos _position;

    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
}, {
    hint "Aborted!"
}, "Repairing Wreck"] call ace_common_fnc_progressBar;