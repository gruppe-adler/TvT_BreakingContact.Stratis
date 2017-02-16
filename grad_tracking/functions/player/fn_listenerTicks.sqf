#include "\z\ace\addons\main\script_component.hpp"

_GRAD_TICKS_DONE_listener = {

	_ticks = _this select 1;

	_ticks call GRAD_tracking_fnc_showTicksWarning;
};

"GRAD_TICKS_DONE" addPublicVariableEventHandler _GRAD_TICKS_DONE_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_GRAD_TICKS_DONE_listener spawn {
		_cur = GRAD_TICKS_DONE;
		while {true} do {
			waitUntil {sleep 1; GRAD_TICKS_DONE > _cur};
			_cur = GRAD_TICKS_DONE;
			[0, GRAD_TICKS_DONE] call _this;
			sleep 3;
		};
	};
};