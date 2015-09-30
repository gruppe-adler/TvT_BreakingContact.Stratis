
// takes location, distance, classname

_location = _this select 0;
_min_distance = _this select 1;
_max_distance = _this select 2;
_classname = _this select 3;


_spawnpos = [_location, _min_distance, _max_distance, _classname] call findSimplePos;

_vehicle = _classname createVehicle _spawnpos;

_vehicle