params ["_terminal", "_radioVeh"];

_terminal attachTo [_radioVeh,[0.3,-2.85,0.7]];
_terminal setVectorDirAndUp [[0,1,0.3],[0,0,0.7]];

[_terminal] remoteExec ["GRAD_tracking_fnc_terminalAddAction", [0, -2] select isMultiplayer, true];

_terminal setVariable ["RadioInterference",0,true];

_terminal setObjectTextureGlobal [0, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
_terminal setObjectTextureGlobal [1, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
_terminal setObjectTextureGlobal [2, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
_terminal setObjectTextureGlobal [3, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
_terminal setObjectTextureGlobal [4, "#(argb,8,8,3)color(0,0,0,0.0,co)"];

_radioVeh setVariable ["detachableRadio", 1, true];
/* publicVariable "_terminal";*/
// what did i intent to do here

_terminal hideObjectGlobal false;