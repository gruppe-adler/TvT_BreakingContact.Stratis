// 0 = mapsize
// 1 = spawnpos
params ["_maximum", "_position"];

_position params ["_positionX", "_positionY"];

private _resultInsideMap = true;

diag_log format ["MapsizeX: %1, MapsizeY: %2, PositionX: %3, PositionY: %4",_maximum,_maximum,_positionX,_positionY];

if (_positionX < 0 || _positionX > _maximum) then {_resultInsideMap = false;};
if (_positionY < 0 || _positionY > _maximum) then {_resultInsideMap = false;};

_resultInsideMap