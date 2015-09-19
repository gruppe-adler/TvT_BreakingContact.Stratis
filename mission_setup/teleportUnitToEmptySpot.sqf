_object = _this select 0;
_position = _this select 1;
_positionlist = [];
_max_distance = 15;

_spawnpos = [_position, 10, "B_Soldier_F"] call findSimplePos;

_object setPos _spawnpos;