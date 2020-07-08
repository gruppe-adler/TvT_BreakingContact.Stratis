private _playerPositionsForCurrentWorld = 	[
	["spawnPosOpf", [0,0,0]] call BC_setup_fnc_getIslandCfgEntry,
	["spawnPosBlu", [0,0,0]] call BC_setup_fnc_getIslandCfgEntry,
	["spawnPosInd", [0,0,0]] call BC_setup_fnc_getIslandCfgEntry
];

[{!isNull player}, {
	params ["_playerPositionsForCurrentWorld"];

	call bc_setup_fnc_streamingSpectator;

	_targetPosition = switch (playerSide) do {
		case (EAST): {_playerPositionsForCurrentWorld select 0};
		case (INDEPENDENT): {_playerPositionsForCurrentWorld select 2};
		default {_playerPositionsForCurrentWorld select 1};
	};

	_tmpPos = [_targetPosition,[0,10],[0,360]] call BC_setup_fnc_findRandomPos;
	player setPos [_tmpPos select 0, _tmpPos select 1, 0]; // force to ZERO height
	player switchmove "AmovPercMstpSnonWnonDnon";


}, [_playerPositionsForCurrentWorld]] call CBA_fnc_waitUntilAndExecute;