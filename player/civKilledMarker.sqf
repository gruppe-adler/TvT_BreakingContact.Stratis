_pos = _this select 0;

showCivKilledHint = {
	playSound "signal_lost";
	cutRsc ["gui_intel_paper_civ_killed","PLAIN",0];	
};

createCivKilledMarker = {
	xxx = createMarkerLocal ["civ_killed_marker", (_this select 0)];
	"civ_killed_marker" setMarkerShapeLocal "ICON";
	"civ_killed_marker" setMarkerTypeLocal "KIA";
	"civ_killed_marker" setMarkerColorLocal "ColorCivilian";
	"civ_killed_marker" setMarkerAlphaLocal 1;


};

[_pos] call createCivKilledMarker;
call showCivKilledHint;