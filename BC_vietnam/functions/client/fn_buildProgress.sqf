params ["_positionHelper", "_player", "_tree"];

[5, [_positionHelper, _player, _tree], {
    _args params ["_positionHelper", "_player", "_tree"];
    [_positionHelper, _player, _tree] remoteExec ["BC_vietnam_fnc_build", 2];
}, {hint "Aborted!"}, "Building Sniper Nest"] call ace_common_fnc_progressBar;