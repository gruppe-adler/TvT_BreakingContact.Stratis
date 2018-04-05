// spawn outside of map on flat terrain if possible
private _alternativeSpawnsOutsideMap = [[-2500,-500],[-500,-2500],[-2500,500]];

private _waterAroundMap = ["waterAroundMap",false] call BC_objectives_fnc_getIslandCfgEntry;
private _playerPositionsForCurrentWorld = 	[
	[(missionConfigFile >> "CfgIslands" >> worldName), "spawnPosOpf", [0,0,0]] call BIS_fnc_returnConfigEntry,
	[(missionConfigFile >> "CfgIslands" >> worldName), "spawnPosBlu", [0,0,0]] call BIS_fnc_returnConfigEntry,
	[(missionConfigFile >> "CfgIslands" >> worldName), "spawnPosInd", [0,0,0]] call BIS_fnc_returnConfigEntry
];

//overwrite with zeus-set positions
if (!isNil "BC_objectives_spawnPosOpf") then {_playerPositionsForCurrentWorld set [0,BC_objectives_spawnPosOpf]};
if (!isNil "BC_objectives_spawnPosBlu") then {_playerPositionsForCurrentWorld set [1,BC_objectives_spawnPosBlu]};
if (!isNil "BC_objectives_spawnPosInd") then {_playerPositionsForCurrentWorld set [2,BC_objectives_spawnPosInd]};


if (isServer) then {
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
};



if (!hasInterface) exitWith {};
[{!isNull player}, {
	params ["_playerPositionsForCurrentWorld"];

	_targetPosition = switch (playerSide) do {
		case (EAST): {_playerPositionsForCurrentWorld select 0};
		case (INDEPENDENT): {_playerPositionsForCurrentWorld select 2};
		default {_playerPositionsForCurrentWorld select 1};
	};

	_tmpPos = [_targetPosition,[0,10],[0,360]] call BC_setup_fnc_findRandomPos;
	player setPos [_tmpPos select 0, _tmpPos select 1, 0]; // force to ZERO height
	player switchmove "AmovPercMstpSnonWnonDnon";
}, [_playerPositionsForCurrentWorld]] call CBA_fnc_waitUntilAndExecute;