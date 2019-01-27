private ["_pulseSpeed","_pulsesize","_pulseMaxSize", "_modifier"];

playSound "beep";
if (playerSide == west) then {
     cutRsc ["gui_intel_paper_us","PLAIN",0];
} else {
     cutRsc ["gui_intel_paper_rus","PLAIN",0];
};

player setVariable ["GRAD_tracking_terminalAnimation", true];
_pulsesize = _this select 0;
_pulseMaxSize = _this select 1;
_pulseSpeed = _this select 2;
_pulseDelayBetween = _this select 3;
_modifier = 1;

mrk_terminal setMarkerAlphaLocal 1;

player setVariable ["BC_trackingMarker_terminalpulseSize", _pulsesize];
player setVariable ["BC_trackingMarker_terminalpulseMaxSize", _pulseMaxSize];

[{
     params ["_args", "_handle"];

     private _pulsesize = player getVariable ["BC_trackingMarker_terminalpulseSize", 0];
     private _pulseMaxSize = player getVariable ["BC_trackingMarker_terminalpulseMaxSize", 100];
     private _modifier = player getVariable ["BC_trackingMarker_terminalmodifier", 1];

     // systemChat (str _pulsesize + "  " + str _pulseMaxSize + "  " + str _modifier);

     if (_pulsesize > _pulseMaxSize) then {
         
          _pulsesize = 0.01;
          _modifier = 0.3;
          player setVariable ["BC_trackingMarker_terminalpulseSize", _pulsesize];
          player setVariable ["BC_trackingMarker_terminalmodifier", _modifier];

     };
     

     _pulsesize = _pulsesize + _modifier;
     _modifier = _modifier + 0.1;
     mrk_terminal setMarkerAlphaLocal (1 - (_pulsesize/_pulseMaxSize));
     mrk_terminal setMarkerSizeLocal [_pulsesize, _pulsesize];

     if (GRAD_TERMINAL_MARKER_HIDDEN) exitWith {
          mrk_terminal setMarkerAlphaLocal 0;
          [_handle] call CBA_fnc_removePerFramehandler;
          player setVariable ["GRAD_tracking_terminalAnimation", false];
          call GRAD_tracking_fnc_hintEndTransmission;
     };

     player setVariable ["BC_trackingMarker_terminalpulseSize", _pulsesize];
     player setVariable ["BC_trackingMarker_terminalmodifier", _modifier];

     
}, 0, []] call CBA_fnc_addPerFramehandler;