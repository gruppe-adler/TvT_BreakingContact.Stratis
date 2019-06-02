private _terminal = missionNamespace getVariable ["GRAD_tracking_terminalObj", objNull];
private _radioVeh = missionNamespace getVariable ["GRAD_tracking_radioVehObj", objNull];


detach _terminal;
// safely put down
_terminal setVehiclePosition [_radioVeh getRelPos [3, 180], [], 3, "NONE"];


GRAD_TERMINAL = true; publicVariable "GRAD_TERMINAL";

[_terminal, true, [0,1.4,0], 270] remoteExec ["ace_dragging_fnc_setDraggable", 0, true];