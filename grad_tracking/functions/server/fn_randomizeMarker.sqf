params ["_pos", "_size"];

private ["_posX", "_posY", "_randomElement"];

_randomElement = (_size) - (random (_size/2));
_posX = _pos select 0;
_posY = _pos select 1;

if (random 2>1) then {
	_posX = _posX + _randomElement;
} else {
	_posX = _posX - _randomElement;
};

if (random 2>1) then {
	_posY = _posY + _randomElement;
} else {
	_posY = _posY - _randomElement;
};

[_posX, _posY]