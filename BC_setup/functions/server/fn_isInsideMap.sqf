// 0 = mapsize
// 1 = spawnpos
params ["_maximumX", "_maximumY", "_position"];

_positionX = _position select 0;
_positionY = _position select 1;

private _resultInsideMap = true;

diag_log format ["MapsizeX: %1, MapsizeY: %2, PositionX: %3, PositionY: %4",_maximumX,_maximumY,_positionX,_positionY];

if (_positionX < 0 || _positionX > _maximumX) then {_resultInsideMap = false;};
if (_positionY < 0 || _positionY > _maximumY) then {_resultInsideMap = false;};

_resultInsideMap
