params ["_distance"];

_mod = 1;
if ((_distance > 50) && (_distance < 500)) then {
	_substractor = (_distance)/1000;
	// round value
	_substractor = _substractor * 100;
	_substractor = floor (_substractor);
	_substractor = _substractor / 100;

	_mod = _mod - _substractor;
};
if (_distance >= 500) then {
	_mod = 0.5;
};

[_mod,_distance]
