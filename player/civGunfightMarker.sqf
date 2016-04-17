_pos = _this select 0;
_delay = 120; // 120 default


showCivGunfightHint = {	
	playSound "signal_lost";
	cutRsc ["gui_intel_paper_civ_gunfight","PLAIN",0];
	
	player setVariable ["GunfightTimeout",true];
	sleep 7;
	player setVariable ["GunfightTimeout",false];
};

createCivGunfightMarker = {

	_marker = createMarkerLocal [format["gunfight_shape_%1",_pos],_pos];
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerColorLocal "ColorUnknown";
	_marker setMarkerSizeLocal [200,200];

	_marker2 = createMarkerLocal [format["gunfight_icon_%1",_pos],_pos];
	_marker2 setMarkerShapeLocal "ICON";
	_marker2 setMarkerTypeLocal "hd_warning";
	_marker2 setMarkerColorLocal "ColorUnknown";
	
	_markerAlpha = 0.5;

	diag_log format ["CivGunfight: Marker %1 created", _marker];

	for "_i" from 0 to 49 do
	{
		_markerAlpha = _markerAlpha - 0.01;
		_marker setMarkerAlphaLocal _markerAlpha;
		sleep 2;
	};
	deleteMarkerLocal _marker;
	deleteMarkerLocal _marker2;
};



_closestTown = nearestLocation [_pos,"NameCity"];
_closestVillage = nearestLocation [_pos,"NameVillage"];

_distanceTown = _closestTown distance _pos;
_distanceVillage = _closestVillage distance _pos;

_closestInstance = "";

if (_distanceTown < _distanceVillage) then {
	_closestInstance = text _closestTown;
	_town_pos = position _closestTown;
	_distance = floor (_town_pos distance _pos);
	_delay = _distance / 10;
	diag_log format ["distance of gunfight civ to next town %2 is %1, delay is %3 secs.",_distance,text _closestTown,_delay/2];
} else {
	_closestInstance = text _closestVillage;
	_village_pos = position _closestVillage;
	_distance = floor (_village_pos distance _pos);
	_delay = _distance / 10;
	diag_log format ["distance of gunfight civ to next village %2 is %1, delay is %3 secs.",_distance,text _closestVillage,_delay/2];
};



sleep _delay/2;



if (player getVariable ["GunfightTimeout",false]) exitWith {};

[_pos] call createCivGunfightMarker;
[] spawn showCivGunfightHint;