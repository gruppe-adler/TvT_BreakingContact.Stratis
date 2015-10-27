
// takes location, distance

_location = _this select 0;
_distance = _this select 1;

_spawn = _location findEmptyPosition[1, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", player, _location];
playSound "beam";
cutText ["", "BLACK OUT", 0.1];
sleep 1.2;
_nul = player setPos _spawn;
openMap [false, false];
hintSilent "";
cutText ["", "BLACK IN", 1];

// make player vulnerable again
player allowDamage true;
[] execVM "helpers\enforceNoSwim.sqf";
3 call fn_sthud_usermenu_changeMode;