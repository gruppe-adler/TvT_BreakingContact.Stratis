_pos = _this select 0;

showCivKilledHint = {
	playSound "signal_lost";
	cutRsc ["gui_intel_paper_civ_killed","PLAIN",0];	
};

createCivKilledMarker = {
	_marker = createMarkerLocal [format["%1",_pos],_pos];
	
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "KIA";
	_marker setMarkerColorLocal "ColorCivilian";

	diag_log format ["CivKills: Marker %1 created", _marker];
};

[_pos] call createCivKilledMarker;
call showCivKilledHint;