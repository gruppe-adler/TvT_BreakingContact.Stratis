_dsply = _this select 0;
_ctrl = _this select 1;

disableSerialization;
_display = findDisplay _dsply;

// hide tooltips
_display displayCtrl _ctrl ctrlSetFade 0;
_display displayCtrl _ctrl ctrlCommit 0.1;