
// takes location, distance

_location = _this select 0;
_distance = _this select 1;

_spawn = [_location, 1, 20, "B_Soldier_F"] call findSimplePos;
diag_log format ["teleporting %1 to %2.", player, _location];
playSound "beam";
cutText ["", "BLACK OUT", 0.1];
sleep 1.2;
_nul = player setPos _spawn;
openMap [false, false];
hintSilent "";
cutText ["", "BLACK IN", 1];
