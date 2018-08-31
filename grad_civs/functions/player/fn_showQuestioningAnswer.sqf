params ["_pos", "_answer", "_markerPositionArray"];

// dont display if too far away
if (position player distance _pos > 8) exitWith {};

// create marker for bystanders
if (count _markerPositionArray > 0) then {
		[(_markerPositionArray select 0), 250] call grad_civs_fnc_createPilotMarker;
};

cutText [format ["%1",_answer],"PLAIN"];
