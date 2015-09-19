#include "\z\ace\addons\main\script_component.hpp"

_pos = _this select 0;

if (side player != west) exitWith {
	if (!IS_VANILLA) then {
	[localize "str_GRAD_hint_bluforSpawned"] call EFUNC(common,displayTextStructured);	
	} else {
	hintSilent format [localize "str_GRAD_hint_bluforSpawned"];
	};
};

_blufor_marker_start = createMarkerLocal ["blufor_marker_start", _pos];
_blufor_marker_start setMarkerTypeLocal "hd_start";
_blufor_marker_start setMarkerColorLocal "ColorWEST";