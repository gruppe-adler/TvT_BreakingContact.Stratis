portableRadioBox = createVehicle ['Land_DataTerminal_01_F', [(getPos radio_object select 0) + 2, (getPos radio_object select 1) - 1, 0.5], [], 0, 'NONE'];
portableRadioBox attachTo [radio_object,[0.3,-2.85,0.7]];
portableRadioBox setVectorDirAndUp [[0,1,0.3],[0,0,0.7]];

[portableRadioBox] remoteExec ["GRAD_fnc_addTerminalInteraction", [0, -2] select isMultiplayer, true];

portableRadioBox setVariable ["RadioInterference",0,true];

portableRadioBox setObjectTextureGlobal [0, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
portableRadioBox setObjectTextureGlobal [1, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
portableRadioBox setObjectTextureGlobal [2, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
portableRadioBox setObjectTextureGlobal [3, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
portableRadioBox setObjectTextureGlobal [4, "#(argb,8,8,3)color(0,0,0,0.0,co)"];

radio_object setVariable ["detachableRadio", 1, true];
publicVariable "portableRadioBox";

portableRadioBox addEventHandler ["Explosion",{
    [_this select 0] execVM "player\dataterminal\explodeDelayed.sqf";
}];