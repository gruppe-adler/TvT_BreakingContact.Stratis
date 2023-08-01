params ["_plane", "_removeMagazines"];
{
	params ["_typ", "_count"];
	
	for "_i" from 1 to _count do {
		_plane removeMagazine _typ;
	};
} forEach _removeMagazines;