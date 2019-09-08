private _playerPositionsForCurrentWorld = 	[
	["spawnPosOpf", [0,0,0]] call BC_setup_fnc_getIslandCfgEntry,
	["spawnPosBlu", [0,0,0]] call BC_setup_fnc_getIslandCfgEntry,
	["spawnPosInd", [0,0,0]] call BC_setup_fnc_getIslandCfgEntry
];


_targetPosition= _playerPositionsForCurrentWorld select 0;
"respawn_east" setMarkerPos _targetPosition;

_targetPosition= _playerPositionsForCurrentWorld select 1;
"respawn_west" setMarkerPos _targetPosition;
"respawn_civilian" setMarkerPos _targetPosition;

_targetPosition= _playerPositionsForCurrentWorld select 2;
"respawn_guerrila" setMarkerPos _targetPosition;

[_playerPositionsForCurrentWorld] spawn {
	params ["_playerPositionsForCurrentWorld"];

		{
			if (!isPlayer _x) then {
 			sleep 0.1;

			_targetPosition = switch (side _x) do {
				case (EAST): {_playerPositionsForCurrentWorld select 0};
				case (INDEPENDENT): {_playerPositionsForCurrentWorld select 2};
				default {_playerPositionsForCurrentWorld select 1};
			};

			_tmpPos = [_targetPosition,[0,10],[0,360]] call BC_setup_fnc_findRandomPos;
			_x setPos _tmpPos;
			_x switchmove "AmovPercMstpSnonWnonDnon";
			};
		} forEach allUnits;
};
