_pos = _this select 0;
_delay = 120; // 120 default

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

[_pos] spawn grad_civMarker_fnc_createCivGunfightMarker;
[] spawn grad_civMarker_fnc_showCivGunfightHint;
