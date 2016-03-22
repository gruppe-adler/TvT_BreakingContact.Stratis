_rscvariable = _this select 0;
_pos = _this select 1;
_delay = 120; // 120 default


showCivGunfightHint = {
	_displayVariable = _this select 0;
	_nameOfCity = _this select 1;
	
	playSound "signal_lost";
	cutRsc ["gui_intel_paper_civ_gunfight","PLAIN",0];
	
	((uiNameSpace getVariable 4002) displayCtrl 4001) ctrlSetStructuredText parseText [_nameOfCity];
};



_closestTown = nearestLocation [_pos,"NameCity"];
_closestVillage = nearestLocation [_pos,"NameVillage"];

_distanceTown = _closestTown distance _pos;
_distanceVillage = _closestVillage distance _pos;

if (_distanceTown < _distanceVillage) then {
	_closestInstance = name _closestTown;
	_town_pos = position _closestTown;
	_distance = floor (_town_pos distance _pos);
	_delay = _distance / 5;
	diag_log format ["distance of gunfight civ to next town %2 is %1, delay is %3 secs.",_distance,text _closestTown,_delay];
} else {
	_closestInstance = name _closestVillage;
	_village_pos = position _closestVillage;
	_distance = floor (_village_pos distance _pos);
	_delay = _distance / 5;
	diag_log format ["distance of gunfight civ to next village %2 is %1, delay is %3 secs.",_distance,text _closestVillage,_delay];
};



sleep _delay;


[_rscvariable,_closestInstance] call showCivGunfightHint;

