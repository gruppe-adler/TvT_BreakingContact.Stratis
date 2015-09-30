
// takes location, distance

_location = _this select 0;
_distance = _this select 1;

_spawn = [_location,_distance,_distance, player] call findSimplePos;
playSound "beam";
cutText ["", "BLACK OUT", 1];
sleep 1.2;
_nul = player setPos _spawn;
openMap [false, false];
cutText ["", "BLACK IN", 1];
