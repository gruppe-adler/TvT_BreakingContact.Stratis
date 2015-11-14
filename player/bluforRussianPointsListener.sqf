#include "\z\ace\addons\main\script_component.hpp"

bluforShowPointsNextWarning = 0.1;

bluforShowPointsWarning = {
	_points = _this;
	_pointsRatio = _points / POINTS_NEEDED_FOR_VICTORY;
	if (_pointsRatio >= bluforShowPointsNextWarning) then { // alle 10% die Warnung
		_string = localize "str_GRAD_transmissionTime_1" + (str (round(_pointsRatio * 100))) + localize "str_GRAD_transmissionTime_2";
		[_string] call EFUNC(common,displayTextStructured);
		bluforShowPointsNextWarning = bluforShowPointsNextWarning + 0.1;
	};
};

_RUSSIAN_POINTS_listener = {

	_points = _this select 1;

	_points call bluforShowPointsWarning;
};

"RUSSIAN_POINTS" addPublicVariableEventHandler _RUSSIAN_POINTS_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_RUSSIAN_POINTS_listener spawn {
		_cur = RUSSIAN_POINTS;
		while {true} do {
			waitUntil {sleep 1; RUSSIAN_POINTS > _cur};
			_cur = RUSSIAN_POINTS;
			[0, RUSSIAN_POINTS] call _this;
			sleep 3;
		};
	};
};
