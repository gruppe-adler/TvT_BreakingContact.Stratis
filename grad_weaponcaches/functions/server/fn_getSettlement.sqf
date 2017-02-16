params ["_pos", "_radius"];

_settlements = nearestLocations [_pos, [
	"NameCity",
	"NameCityCapital",
	"NameMarine",
	"NameVillage"
], _radius];

_maxAvailable = (count _settlements) - 1;
_randomPick = floor (random _maxAvailable);
(_settlements select _randomPick)