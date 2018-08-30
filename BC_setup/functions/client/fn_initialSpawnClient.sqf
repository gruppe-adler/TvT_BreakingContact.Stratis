private _playerPositionsForCurrentWorld = 	[     [(missionConfigFile >> "CfgIslands" >> worldName), "spawnPosOpf", [0,0,0]] call BIS_fnc_returnConfigEntry,     [(missionConfigFile >> "CfgIslands" >> worldName), "spawnPosBlu", [0,0,0]] call BIS_fnc_returnConfigEntry,     [(missionConfigFile >> "CfgIslands" >> worldName), "spawnPosInd", [0,0,0]] call BIS_fnc_returnConfigEntry
];

[{!isNull player}, {     params ["_playerPositionsForCurrentWorld"];
     _targetPosition = switch (playerSide) do {     	case (EAST): {_playerPositionsForCurrentWorld select 0};     	case (INDEPENDENT): {_playerPositionsForCurrentWorld select 2};     	default {_playerPositionsForCurrentWorld select 1};     };
     _tmpPos = [_targetPosition,[0,10],[0,360]] call BC_setup_fnc_findRandomPos;     player setPos [_tmpPos select 0, _tmpPos select 1, 0]; // force to ZERO height     player switchmove "AmovPercMstpSnonWnonDnon";
}, [_playerPositionsForCurrentWorld]] call CBA_fnc_waitUntilAndExecute;
