#include "..\..\missionMacros.h"

waitUntil {player == player};

// spawn outside of map on flat terrain if possible
_alternativeSpawnsOutsideMap = [[-2500,-500],[-500,-2500]];

_playerPositionsForCurrentWorld = ISLAND_TARGET_POSITIONS select (ISLANDS find worldName);
if !(_playerPositionsForCurrentWorld select 2) then {
	_playerPositionsForCurrentWorld = _alternativeSpawnsOutsideMap;
};

_playerPosition = _playerPositionsForCurrentWorld select 1;
if (side player == blufor) then {
	_playerPosition = _playerPositionsForCurrentWorld select 0;
};

_msg = format["moving player to %1 ...", _playerPosition];
debugLog(_msg);

//[player, _playerPosition] execVM "mission_setup\teleportUnitToEmptySpot.sqf";
