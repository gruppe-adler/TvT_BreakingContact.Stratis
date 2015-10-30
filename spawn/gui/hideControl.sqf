_dsply = _this select 0;
disableSerialization;
_display = findDisplay _dsply;

{
_display displayCtrl _x ctrlSetFade 1;
_display displayCtrl _x ctrlCommit 0.1;
} forEach (_this select 1);