#include "..\missionMacros.h"
// spawn outside of map on flat terrain if possible
_alternativeSpawnsOutsideMap = [[-2500,-500],[-500,-2500]];

_unit = _this select 0;

_playerPositionsForCurrentWorld = ISLAND_TARGET_POSITIONS select (ISLANDS find worldName);
if !(_playerPositionsForCurrentWorld select 2) then {
	_playerPositionsForCurrentWorld = _alternativeSpawnsOutsideMap;
};

_targetPosition= _playerPositionsForCurrentWorld select 1;
if (side _unit == blufor) then {
	_targetPosition= _playerPositionsForCurrentWorld select 0;
};


// _msg = format["moving player to %1 ...", _targetPosition];
// debugLog(_msg);


_tmpPos = [_targetPosition,[0,10], random 360,0,[1,50]] call SHK_pos;

_unit setPos _tmpPos;

_unit switchmove "AmovPercMstpSnonWnonDnon";