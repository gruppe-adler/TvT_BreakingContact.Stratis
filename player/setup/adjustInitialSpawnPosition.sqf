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


_tmpPos = [_playerPosition,[0,10], random 360,0,[1,50]] call SHK_pos;

player setPos _tmpPos;

player switchmove "AmovPercMstpSnonWnonDnon";