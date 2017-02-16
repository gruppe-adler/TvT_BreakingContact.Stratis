params ["_obj", "_code"];

clearItemCargoGlobal _obj;
clearWeaponCargoGlobal _obj;
clearBackpackCargoGlobal _obj;
clearMagazineCargoGlobal _obj;

[_obj] call _code;