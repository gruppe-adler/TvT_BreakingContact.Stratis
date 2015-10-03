_object = _this select 0;
_position = _this select 1;

_spawnpos = [_position, 5, 15, "B_Soldier_F"] call findSimplePos;

_object setPos _spawnpos;