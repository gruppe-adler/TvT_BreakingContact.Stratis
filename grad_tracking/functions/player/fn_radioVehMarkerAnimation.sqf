private ["_pulseSpeed","_pulsesize","_pulseMaxSize", "_modifier"];

playSound "beep";
if (playerSide == west) then {
     cutRsc ["gui_intel_paper_us","PLAIN",0];
} else {
     cutRsc ["gui_intel_paper_rus","PLAIN",0];
};

player setVariable ["GRAD_tracking_radioVehAnimation", true];
_pulsesize = _this select 0;
_pulseMaxSize = _this select 1;
_pulseSpeed = _this select 2;
_pulseDelayBetween = _this select 3;
_modifier = 1;

mrk_radioVeh setMarkerAlphaLocal 1;

player setVariable ["BC_trackingMarker_pulseSize", _pulsesize];
player setVariable ["BC_trackingMarker_pulseMaxSize", _pulseMaxSize];


[{
     params ["_args", "_handle"];

     private _pulsesize = player getVariable ["BC_trackingMarker_pulseSize", 0];
     private _pulseMaxSize = player getVariable ["BC_trackingMarker_pulseMaxSize", 100];
     private _modifier = player getVariable ["BC_trackingMarker_modifier", 1];

     // systemChat (str _pulsesize + "  " + str _pulseMaxSize + "  " + str _modifier);

     if (_pulsesize > _pulseMaxSize) then {
         
          _pulsesize = 0.01;
          _modifier = 0.3;
          player setVariable ["BC_trackingMarker_pulseSize", _pulsesize];
          player setVariable ["BC_trackingMarker_modifier", _modifier];

     };
     

     _pulsesize = _pulsesize + _modifier;
     _modifier = _modifier + 0.1;
     mrk_radioVeh setMarkerAlphaLocal (1 - (_pulsesize/_pulseMaxSize));
     mrk_radioVeh setMarkerSizeLocal [_pulsesize, _pulsesize];

     if (GRAD_RADIO_VEH_MARKER_HIDDEN) exitWith {
          mrk_radioVeh setMarkerAlphaLocal 0;
          [_handle] call CBA_fnc_removePerFramehandler;
          player setVariable ["GRAD_tracking_radioVehAnimation", false];
          call GRAD_tracking_fnc_hintEndTransmission;
     };

     player setVariable ["BC_trackingMarker_pulseSize", _pulsesize];
     player setVariable ["BC_trackingMarker_modifier", _modifier];

     
}, 0, []] call CBA_fnc_addPerFramehandler;