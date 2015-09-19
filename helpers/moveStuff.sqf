
// takes location, distance, classname

_location = _this select 0;
_distance = _this select 1;
_target = _this select 2;


_spawn = [_location,_distance,typeOf _target] call findSimplePos;
playSound "beam";
titleCut ["", "BLACK OUT", 1];
BIS_DEBUG_CAM = nil;
_nul = _target setPos _spawn;
sleep 1.2;
titleCut ["", "BLACK IN", 1];