
// takes location, distance, classname

_location = _this select 0;
_distance = _this select 1;
_target = _this select 2;

_spawn = [_location,_distance,typeOf _target] call findSimplePos;
playSound "beam";
cutText ["", "BLACK OUT", 1];
sleep 1.2;
_nul = _target setPos _spawn;
openMap [false,false];
cutText ["", "BLACK IN", 1];
