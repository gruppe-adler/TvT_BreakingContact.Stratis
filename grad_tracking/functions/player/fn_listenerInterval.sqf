#include "\z\ace\addons\main\script_component.hpp"

_GRAD_INTERVALS_DONE_listener = {

	_interval = _this select 1;

	_interval call GRAD_tracking_fnc_showIntervalWarning;
};

"GRAD_INTERVALS_DONE" addPublicVariableEventHandler _GRAD_INTERVALS_DONE_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_GRAD_INTERVALS_DONE_listener spawn {
		_cur = GRAD_INTERVALS_DONE;
		while {true} do {
			waitUntil {sleep 1; GRAD_INTERVALS_DONE > _cur};
			_cur = GRAD_INTERVALS_DONE;
			[0, GRAD_INTERVALS_DONE] call _this;
			sleep 3;
		};
	};
};
