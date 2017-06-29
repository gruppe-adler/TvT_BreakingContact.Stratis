/* rip from diod */
private ["_buildingPositions"];

params ["_searchPosition"];

_buildings = nearestObjects [_searchPosition, ["House", "Building"], 100];
_nearestBuilding = if (count _buildings > 0) then {_buildings select 0} else {objNull};

if (!isNull _nearestBuilding) then {
	_buildingPositions = [_nearestBuilding] call BIS_fnc_buildingPositions;
};

_position = if (!isNull _nearestBuilding && {count _buildingPositions > 0}) then {
	selectRandom _buildingPositions
} else {
	[_searchPosition,[50,100],random 360] call SHK_pos
};

_position