
// takes location, distance, classname

_location = _this select 0;
_distance = _this select 1;
_classname = _this select 2;


_spawnpos = [_location, _distance, _classname] call findSimplePos;

_vehicle = _classname createVehicle _spawnpos;

_vehicle