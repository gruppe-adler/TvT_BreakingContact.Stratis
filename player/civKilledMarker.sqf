_pos = _this select 0;
_delay = 120; // 120 default


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

_closesttownArray = (nearestLocations [_pos,["NameCityCapital","NameCity","NameVillage"],10000]);


if (count _closesttownArray > 0) then {
	_closesttown = _closesttownArray select 0;
	_town_pos = position _closesttown;
	_distance = floor (_town_pos distance _pos);
	_delay = _distance / 5;
};

diag_log format ["distance of killed civ to next town %2 is %1, delay is %3 secs.",_distance,text _closesttown,_delay];




sleep _delay;

[_pos] call createCivKilledMarker;
call showCivKilledHint;