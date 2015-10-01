
// takes location, distance

_location = _this select 0;
_distance = _this select 1;


_spawn = [_location, 0, 50, 1, 0, 1, 0] call BIS_fnc_findSafePos;
playSound "beam";
cutText ["", "BLACK OUT", 1];
sleep 1.2;
_nul = player setPos _spawn;
openMap [false, false];
cutText ["", "BLACK IN", 1];
