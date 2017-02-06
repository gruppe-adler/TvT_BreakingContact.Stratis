#include "\z\ace\addons\main\script_component.hpp"

showPointsNextWarning = 0.1;

showPointsWarning = {
	_points = _this;
	_pointsRatio = _points / POINTS_NEEDED_FOR_VICTORY;
	if (_pointsRatio >= showPointsNextWarning) then { // alle 10% die Warnung
		_string = localize "str_GRAD_transmissionTime_1" + " " + (str (round(_pointsRatio * 100))) + " " + localize "str_GRAD_transmissionTime_2";
		[_string] call EFUNC(common,displayTextStructured);
		playSound "beep";
		showPointsNextWarning = showPointsNextWarning + 0.1;
	};
};

showPointsInstant = {
	if (playerSide == east) then {
		_pointsRatio = OPFOR_POINTS / POINTS_NEEDED_FOR_VICTORY;
		_string = localize "str_GRAD_transmissionTime_1" + " " + (str (round(_pointsRatio * 100))) + " " + localize "str_GRAD_transmissionTime_2";
		[_string] call EFUNC(common,displayTextStructured);
	};
};

_OPFOR_POINTS_listener = {

	_points = _this select 1;

	_points call showPointsWarning;
};

"OPFOR_POINTS" addPublicVariableEventHandler _OPFOR_POINTS_listener;

// runs in SP to emulate addPublicVariableEventHandler (which doesnt work in SP)
if (!isMultiplayer) then {
	_OPFOR_POINTS_listener spawn {
		_cur = OPFOR_POINTS;
		while {true} do {
			waitUntil {sleep 1; OPFOR_POINTS > _cur};
			_cur = OPFOR_POINTS;
			[0, OPFOR_POINTS] call _this;
			sleep 3;
		};
	};
};
