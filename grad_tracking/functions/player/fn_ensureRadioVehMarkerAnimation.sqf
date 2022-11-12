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
     
     // wait till marker is officially moved to non default position
     [{
          !isNil "mrk_radioVeh" && {(getMarkerPos "mrk_radioVeh") select 0 != 0}
     },{
          [getMarkerPos "mrk_radioVeh"] call grad_tracking_fnc_sendingParticles;
     }] call CBA_fnc_waitUntilAndExecute;
     
     diag_log format ["executing particle effect"];
};
