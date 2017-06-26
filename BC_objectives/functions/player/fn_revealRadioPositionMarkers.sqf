params ["_markers"];

if ((["GRAD_INTERVALS_NEEDED", 1] call BIS_fnc_getParamValue) isEqualTo 1) exitWith { diag_log format ["hiding marker, only 1 interval needed"]; };

if (playerSide isEqualTo west) exitWith { diag_log format ["hiding radio position markers for %1", playerSide]; };

{
	_x setMarkerAlphaLocal 1;
} forEach _markers;