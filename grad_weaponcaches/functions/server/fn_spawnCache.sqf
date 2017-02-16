params ["_position", "_side", "_code"];

_type = selectRandom (missionNamespace getVariable ["grad_weaponcaches_classnames", ["Box_FIA_Ammo_F"]]);

_crate = createVehicle [_type, _position, [], 0, "NONE"];

[_crate, _code] call grad_weaponcaches_fnc_fillInventory;

[_position, 250, _side] remoteExec ["grad_weaponcaches_fnc_createCacheMarker", 0, true];

diag_log format ["successfully created cache at %1" , _position];