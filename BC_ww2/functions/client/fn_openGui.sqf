if (!hasInterface) exitWith {};

params ["_planeTyp", ["_showGunner", false]];

missionNamespace setVariable ["BC_ww2_planeType", _this, false];

createDialog "BC_ww2_assignPlaneCrew";

ctrlEnable [7,_showGunner];