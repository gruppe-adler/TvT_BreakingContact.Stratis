params ["_ctrl"];

private _display = ctrlParent _ctrl;
private _namePilot = "";
private _nameGunner = "";

_namePilot = (_display displayCtrl 42) lbText (lbCurSel(_display displayCtrl 42));
_nameGunner = (_display displayCtrl 7) lbText (lbCurSel(_display displayCtrl 7));

if (!(ctrlEnabled (_display displayCtrl 7)) || _nameGunner == _namePilot) then {
	_nameGunner = "";
};

closeDialog 0;

[_namePilot, _nameGunner] call BC_ww2_planeSpawn;