_pos = _this select 0 select 0;
_delay = 120; // 120 default


_closestTown = nearestLocation [_pos,"NameCity"];
_closestVillage = nearestLocation [_pos,"NameVillage"];

_distanceTown = _closestTown distance _pos;
_distanceVillage = _closestVillage distance _pos;

if (_distanceTown < _distanceVillage) then {     _town_pos = position _closestTown;     _distance = floor (_town_pos distance _pos);     _delay = _distance / 10;     diag_log format ["distance of killed civ to next town %2 is %1, delay is %3 secs.",_distance,text _closestTown,_delay];
} else {     _village_pos = position _closestVillage;     _distance = floor (_village_pos distance _pos);     _delay = _distance / 10;     diag_log format ["distance of killed civ to next village %2 is %1, delay is %3 secs.",_distance,text _closestVillage,_delay];
};



sleep _delay;

[_pos] spawn grad_civMarker_fnc_createCivKilledMarker;
[] spawn grad_civMarker_fnc_showCivKilledHint;
