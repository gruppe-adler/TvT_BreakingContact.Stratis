params ["_unit", "_shooter", "_distance"];

_dir = (_unit getRelDir _shooter) - 180; // other way please
_targetPos = (position _unit) getPos [_distance, _dir];

_targetPos