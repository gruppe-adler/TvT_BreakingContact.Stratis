_object = _this select 0;
_object setVariable ["RadioInterference",1,true];
[_object,3] call BIS_fnc_dataTerminalAnimate;
sleep 2;
with uiNamespace do {
     disableserialization; //thank you so much tankbuster
    _object setObjectTextureGlobal [0,"grad_tracking\data\frequency_mockup.ogv"];
    _object setObjectTextureGlobal [1,"grad_tracking\data\frequency_mockup.ogv"];
    1100 cutRsc ["RscMissionScreen","PLAIN"];
    _scr = BIS_RscMissionScreen displayCtrl 1100;
    _scr ctrlSetPosition [-10,-10,0,0];
    _scr ctrlSetText "grad_tracking\data\frequency_mockup.ogv"; // _scr ctrlSetText "\A3\Missions_F_EPA\video\A_in_intro.ogv";
    _scr ctrlAddEventHandler ["VideoStopped", {
        (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;
    }];
    _scr ctrlCommit 0;
    sleep 2;
    _object setObjectTextureGlobal [0,"grad_tracking\data\monitor_01.paa"];
    _object setObjectTextureGlobal [1,"grad_tracking\data\monitor_01.paa"];
};

[_object] spawn {

    _textures = [
        "grad_tracking\data\monitor_01.paa",
        "grad_tracking\data\monitor_02.paa"
    ];

    while {(_this select 0) getVariable ["RadioInterference",-1] != 0} do {
        _texture1 = selectRandom _textures;
        _texture2 = selectRandom _textures;
        if (random 100 > 50) then {
            _texture1 = "grad_tracking\data\monitor_03.paa";
            _texture2 = "grad_tracking\data\monitor_03.paa";
        };
        [(_this select 0), "signal_distortion"] remoteExec ["say3D",0,false];
        (_this select 0) setObjectTextureGlobal [0,_texture1];
        (_this select 0) setObjectTextureGlobal [1,_texture2];
        sleep 6;
        // (_this select 0) setObjectTextureGlobal [4, "#(argb,8,8,3)color(1,0.2,0,1.0,co)"];
        sleep 1;
        // (_this select 0) setObjectTextureGlobal [0, "#(argb,8,8,3)color(1,1,1,1.0,co)"];
    };
};

GRAD_TERMINAL_ACTIVE = true;
publicVariableServer "GRAD_TERMINAL_ACTIVE";
_object setVariable ["RadioInterference",2,true];