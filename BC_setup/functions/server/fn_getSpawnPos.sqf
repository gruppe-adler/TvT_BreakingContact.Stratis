params ["_side"];

private _position = [0,0,0];

if (_side isEqualTo west) then {     _position = getPos US_SPAWN_PAD;
} else {     _position = getPos RUS_SPAWN_PAD;
};

_position