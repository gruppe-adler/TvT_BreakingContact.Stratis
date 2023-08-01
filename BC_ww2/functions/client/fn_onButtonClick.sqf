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

(missionNamespace getVariable "BC_ww2_planeType") params ["_planeTyp", "", "_removeWeapons", "_removeMagazines"];

[{
	MISSION_STARTED
},
{
	_this remoteExecCall ["BC_ww2_fnc_planeSpawn", 2, false];
},[_namePilot, _nameGunner, _planeTyp, _removeWeapons, _removeMagazines]] call CBA_fnc_waitUntilAndExecute;
