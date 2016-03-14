_pos = _this select 0;

showCivKilledHint = {
	playSound "signal_lost";
	cutRsc ["gui_intel_paper_civ_killed","PLAIN",0];	
};

createCivKilledMarker = {
	_marker1Nam = format["civKilledMarkerName_%1",(_this select 0)];
	xxx = createMarkerLocal [_marker1Nam, (_this select 0)];
	"civ_killed_marker" setMarkerShapeLocal "ICON";
	"civ_killed_marker" setMarkerTypeLocal "KIA";
	"civ_killed_marker" setMarkerColorLocal "ColorCivilian";
	"civ_killed_marker" setMarkerAlphaLocal 1;
};

[_pos] call createCivKilledMarker;
call showCivKilledHint;