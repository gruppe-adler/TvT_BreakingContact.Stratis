#include "\z\ace\addons\main\script_component.hpp"


_hint = _this select 0;
_side = _this select 1;

if (_side == "blufor") then {
	if (side player == west) then {
	hintSilent format [_hint];
	};
};

if (_side == "opfor") then {
	if (side player == east) then {
	hintSilent format [_hint];
	};
};

if (_side == "all") then {
	hintSilent format [_hint];	
};

//[_hint] call EFUNC(common,displayTextStructured);