#include "\z\ace\addons\main\script_component.hpp"

broadcastSpeed = {
	_speedtext = localize 'str_GRAD_hint_playback_speed_hint' + (_this select 0);
	[{[_speedtext] call EFUNC(common,displayTextStructured);},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};

if (serverCommandAvailable "#logout" || !isMultiplayer) then {
	checkSpeedKey = {
	   private ["_speedKey","_value"];
	    _speedKey = _this select 0;
	    _value = -2;
	    //hintSilent "checkSpeedKey";
	    switch _speedKey do
	        {
	            case 199: {_value = REPLAY_STEPS_PER_TICK -1;};
	            case 207: {_value = REPLAY_STEPS_PER_TICK +1;};
	            default {};
	        };
	      
	    [str _value + " x"] call broadcastSpeed;
	    REPLAY_STEPS_PER_TICK = _value;
	    publicVariable "REPLAY_STEPS_PER_TICK";
	    
	};

replayKeyDown = (finddisplay 46) displayaddeventhandler ["keydown","	[_this select 1] call checkSpeedKey;"];
} else {
	// do nothing at all
};