_object = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_object removeaction _id;
[_object,3] call BIS_fnc_dataTerminalAnimate;
sleep 2;
_object setVariable ["RadioInterference",true];
with uiNamespace do {
     disableserialization; //thank you so much tankbuster
    _object setObjectTexture [0,"player\dataterminal\frequency_mockup.ogv"]; 
    _object setObjectTexture [1,"player\dataterminal\frequency_mockup.ogv"];
    1100 cutRsc ["RscMissionScreen","PLAIN"];
    _scr = BIS_RscMissionScreen displayCtrl 1100;
    _scr ctrlSetPosition [-10,-10,0,0];
    _scr ctrlSetText "player\dataterminal\frequency_mockup.ogv"; // _scr ctrlSetText "\A3\Missions_F_EPA\video\A_in_intro.ogv";
    _scr ctrlAddEventHandler ["VideoStopped", { (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;    }]; 
    _scr ctrlCommit 0;
};

[_object] spawn {
    while {(_this select 0) getVariable ["RadioInterference",false]} do {
        (_this select 0) say3D "signal_distortion";
        sleep 5;
        (_this select 0) setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,0.2,0,0.0,co)"];
        sleep 2;
        (_this select 0) setObjectTextureGlobal [0, "#(argb,8,8,3)color(0,0,0,0.0,co)"];
    };
};

RADIO_PORTABLE_ACTIVE = true;
publicVariable "RADIO_PORTABLE_ACTIVE";

_closeaction = [[_object,["Close","player\dataterminal\CloseTerminal.sqf"]],"addAction",true] call BIS_fnc_MP;