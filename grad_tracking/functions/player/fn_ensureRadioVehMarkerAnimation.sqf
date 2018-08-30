private ["_maxSize", "_size", "_animationSpeed", "_delayBetweenPulse"];

_maxSize = GRAD_SIGNAL_SIZE; // marker radius
_size = 0.01; // initial size
_animationSpeed = 0.02; // delay between growth steps
_delayBetweenPulse = GRAD_SIGNAL_DELAY;
_isRunning = player getVariable ["GRAD_tracking_radioVehAnimation",false];

if (!_isRunning) then {
	
	[
		_size,
		_maxSize,
		_animationSpeed,
		_delayBetweenPulse
	] spawn GRAD_tracking_fnc_radioVehMarkerAnimation;
};