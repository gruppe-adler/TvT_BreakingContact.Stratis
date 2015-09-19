#include "\z\ace\addons\main\script_component.hpp"


_hint = _this select 0;
_side = _this select 1;

if (_side == "blufor") then {
	if (side player == west) then {
	_text =  format [_hint];
	[_text] call EFUNC(common,displayTextStructured);
	};
};

if (_side == "opfor") then {
	if (side player == east) then {
	_text =  format [_hint];
	[_text] call EFUNC(common,displayTextStructured);
	};
};

if (_side == "all") then {
	_text =  format [_hint];
	[_text] call EFUNC(common,displayTextStructured);
};

//[_hint] call EFUNC(common,displayTextStructured);