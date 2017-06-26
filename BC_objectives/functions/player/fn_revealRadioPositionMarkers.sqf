params ["_markers"];

if ((["GRAD_INTERVALS_NEEDED", 1] call BIS_fnc_getParamValue) isEqualTo 1) exitWith { diag_log format ["hiding marker, only 1 interval needed"]; };

if (playerSide isEqualTo west) exitWith { 

	{
		_x setMarkerAlphaLocal 0;
	} forEach _markers;

	diag_log format ["hiding radio position markers for %1", playerSide]; 
};

diag_log format ["setting marker alpha %1 to 1 for %2", _markers, playerside];

{
	_x setMarkerAlphaLocal 1;
} forEach _markers;