params ["_terminal"];

_terminal addEventHandler ["Explosion",{
    [(_this select 0)] remoteExec ["GRAD_tracking_fnc_terminalExplodeDelayed", 2];
}];

if (hasInterface) then {
     _terminal addAction [
          "Open Terminal", {_this call GRAD_tracking_fnc_terminalOpen;},
          nil,1,false,true,"","_target getVariable ['RadioInterference',-1] == 0"
     ];

     _terminal addAction [
          "Close Terminal", {_this call GRAD_tracking_fnc_terminalClose;},
          nil,1,false,true,"","_target getVariable ['RadioInterference',-1] == 2"
     ];
};

// condition: _terminal getVariable ("RadioInterference",false)
