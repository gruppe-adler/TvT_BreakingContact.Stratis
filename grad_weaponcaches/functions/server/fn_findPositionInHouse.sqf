/* rip from diod */

params ["_searchPosition"];

diag_log format ["searching at %1", _searchPosition];

_buildings = nearestObjects [_searchPosition, ["House"], 500];

_maxAvailable = (count _buildings) - 1;
_randomPick = floor random _maxAvailable;
_randomBuilding = if (count _buildings > 0) then {_buildings select _randomPick} else {objNull};
_buildingPositions = [_randomBuilding] call BIS_fnc_buildingPositions;
_position = if (count _buildingPositions > 0) then {selectRandom _buildingPositions} else {_searchPosition};

_position