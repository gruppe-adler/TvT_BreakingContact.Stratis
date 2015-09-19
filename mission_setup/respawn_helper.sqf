#include "\z\ace\addons\main\script_component.hpp"

_pos = _this select 0;

if (side player == west) then {
	if (!IS_VANILLA) then {
	[localize "str_GRAD_hint_opforSpawned"] call EFUNC(common,displayTextStructured);
	} else {
	hintSilent format [localize "str_GRAD_hint_opforSpawned"];
	};
};

if (isServer || isDedicated) then {

	[_pos] spawn { 
		_pos = _this select 0;
		while {true} do {
				sleep 0.5;
				if (!isNil "respawn_helper") exitWith { respawn_helper setPos _pos; };
						};
  	};
};

