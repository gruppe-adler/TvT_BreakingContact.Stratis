_object = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_object removeaction _id;
[_object,3] call BIS_fnc_dataTerminalAnimate;
sleep 2;
_object setVariable ["RadioInterference",true];
with uiNamespace do {
     disableserialization; //thank you so much tankbuster
    _object setObjectTextureGlobal [0,"player\dataterminal\frequency_mockup.ogv"];
    _object setObjectTextureGlobal [1,"player\dataterminal\frequency_mockup.ogv"];
    1100 cutRsc ["RscMissionScreen","PLAIN"];
    _scr = BIS_RscMissionScreen displayCtrl 1100;
    _scr ctrlSetPosition [-10,-10,0,0];
    _scr ctrlSetText "player\dataterminal\frequency_mockup.ogv"; // _scr ctrlSetText "\A3\Missions_F_EPA\video\A_in_intro.ogv";
    _scr ctrlAddEventHandler ["VideoStopped", {
        (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;
    }];
    _scr ctrlCommit 0;
    sleep 2;
    _object setObjectTextureGlobal [0,"player\dataterminal\monitor_01.paa"];
    _object setObjectTextureGlobal [1,"player\dataterminal\monitor_01.paa"];
};

[_object] spawn {

    _textures = [
    "player\dataterminal\monitor_01.paa",
    "player\dataterminal\monitor_02.paa"
    ];

    while {(_this select 0) getVariable ["RadioInterference",false]} do {
        _texture1 = _textures call BIS_fnc_selectRandom;
        _texture2 = _textures call BIS_fnc_selectRandom;
        if (random 100 > 99) then {
            _texture1 = "player\dataterminal\monitor_03.paa";
            _texture2 = "player\dataterminal\monitor_03.paa";
        };
        (_this select 0) say3D "signal_distortion";
        (_this select 0) setObjectTextureGlobal [0,_texture1];
        (_this select 0) setObjectTextureGlobal [1,_texture2];
        sleep 6;
        // (_this select 0) setObjectTextureGlobal [4, "#(argb,8,8,3)color(1,0.2,0,1.0,co)"];
        sleep 1;
        // (_this select 0) setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,1,1,1.0,co)"];
    };
};

RADIO_BOX_ACTIVE = true;
publicVariable "RADIO_BOX_ACTIVE";

_closeaction = [[_object,["Close","player\dataterminal\CloseTerminal.sqf"]],"addAction",true] call BIS_fnc_MP;
