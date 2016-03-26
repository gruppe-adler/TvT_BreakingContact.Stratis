_object = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_object removeaction _id;
[_object,3] call BIS_fnc_dataTerminalAnimate;
sleep 2;
with uiNamespace do {
     disableserialization; //thank you so much tankbuster
    _object setObjectTexture [0,"server\dataterminal\frequency_mockup.ogv"]; 
    _object setObjectTexture [1,"server\dataterminal\frequency_mockup.ogv"];
    1100 cutRsc ["RscMissionScreen","PLAIN"];
    _scr = BIS_RscMissionScreen displayCtrl 1100;
    _scr ctrlSetPosition [-10,-10,0,0];
    _scr ctrlSetText "server\dataterminal\frequency_mockup.ogv"; // _scr ctrlSetText "\A3\Missions_F_EPA\video\A_in_intro.ogv";
    _scr ctrlAddEventHandler ["VideoStopped", { (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;    }]; 
    _scr ctrlCommit 0;
};

sleep 1;
RADIO_PORTABLE_ACTIVE = true;
publicVariableServer "RADIO_PORTABLE_ACTIVE";

_closeaction = [[_object,["Close","server\dataterminal\CloseTerminal.sqf"]],"addAction",true] call BIS_fnc_MP;