params ["_pos"];

private ["_worldSize"];

_posX = _pos select 0;
_posY = _pos select 1;
_threshold = worldSize/2;

_leftHalf = (_posX <= _threshold);
_bottomHalf = (_posY <= _threshold);
// _xHigherY = _posX > _posY;

_resultX = 0;
_resultY = 0;

_result = [];

// top border
if ((_leftHalf && !_bottomHalf) || (!_leftHalf && !_bottomHalf)) then {
	 _resultX = _posX; _resultY = worldSize;  
};


// left border
if ((_leftHalf && !_bottomHalf) || (_leftHalf && _bottomHalf)) then { 
	_resultX = 0; _resultY = _posY; 
};

// right border
if ((!_leftHalf && !_bottomHalf) || (!_leftHalf && _bottomHalf)) then { 
	_resultX = worldSize; _resultY = _posY; 
};

// bottom border
if ((_leftHalf && _bottomHalf) || (!_leftHalf && _bottomHalf)) then { 
	_resultX = _posX; _resultY = 0;  
};

// callback
[_resultX, _resultY]