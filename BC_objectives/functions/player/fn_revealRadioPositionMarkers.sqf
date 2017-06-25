params ["_markers"];

if ((["GRAD_INTERVALS_NEEDED", 1] call BIS_fnc_getParamValue) isEqualTo 1) exitWith { diag_log format ["hiding marker, only 1 interval needed"]; };

if (!(playerSide isEqualTo east)) exitWith {};

{
	_x setMarkerAlphaLocal 1;
} forEach _markers;