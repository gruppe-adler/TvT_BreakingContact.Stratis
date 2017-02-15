private ["_maxSize", "_size", "_animationSpeed", "_delayBetweenPulse"];

_maxSize = 100; 
_size = 0.01;
_animationSpeed = 0.02;
_delayBetweenPulse = GRAD_SIGNAL_DELAY;
_isRunning = player getVariable ["GRAD_tracking_terminalAnimation",false];

if (!_isRunning) then {
	
	[
		_size,
		_maxSize,
		_animationSpeed,
		_delayBetweenPulse
	] spawn GRAD_tracking_fnc_terminalMarkerAnimation;
};