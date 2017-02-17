_settlements = nearestLocations [[worldsize/2, worldSize/2], ["NameVillage","NameCity","NameCityCapital"], 25000];

{
	// count is radius / 4
	_dropCount = ceil ((size _x select 0)/3);
	[position _x, (size _x) select 0, _dropCount] call grad_roadtrash_fnc_spawnObjects;
	sleep 1;
} forEach _settlements;