#include "\z\ace\addons\main\script_component.hpp"

openMap [true,false];
{deleteMarker _x} forEach allMapMarkers;
playback_speed_x1 = 1;
playback_speeds = [ [30,"30x"],
                        [20,"20x"],
                        [10,"10x"],
                        [5,"5x"],
                        [3,"3x"],
                        [1,"1x"],
                        [0,"Pause"],
                        [-1,"-1x"],
                        [-3,"-3x"],
                        [-5,"-5x"],
                        [-10,"-10x"],
                        [-20,"-20x"],
                        [-30,"-30x"]
                    ];

checkArrayLength1 = {
    _value = _this select 0;
    _array = _this select 1;

    if (_value < 0) then {_value = 0};
    if (_value > count _array - 1) then {_value = count _array - 1};

    _value
};

playback_speed_hint = {
    _kindof = _this select 0;
    
    playback_speed_x1 = playback_speed_x1 + _kindof;
    

    playback_speed_x1 = [playback_speed_x1, playback_speeds1] call checkArrayLength1;
    local_recording_playback_speed = (playback_speeds1 select playback_speed_x1) select 0;
    local_recording_playback_speed_text = (playback_speeds1 select playback_speed_x1) select 1;

    if (!IS_VANILLA) then {
    [localize 'str_GRAD_hint_playback_speed_hint' + local_recording_playback_speed_text] call EFUNC(common,displayTextStructured);
    };
};

"PV_playback_speed_hint" addPublicVariableEventHandler {(_this select 1) spawn playback_speed_hint};


checkSpeedKey = {
   private ["_speedKey","_value"];
    _speedKey = _this select 0;
    _value = -2;
    //hintSilent "checkSpeedKey";
    switch _speedKey do
        {
            case 199: {_value = -1;};
            case 207: {_value = 1;};
            default {};
        };
    If(_value > -2)then{    
    [_value] call playback_speed_hint;
    PV_playback_speed_hint = [_value];
    publicVariable "PV_playback_speed_hint";
    };
};

//replayKeyDown = (finddisplay 46) displayaddeventhandler ["keydown","	[_this select 1] call checkSpeedKey;"];