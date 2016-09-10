params ["_terminal"];

_terminal addAction [
	"Open Terminal", "player\dataterminal\OpenTerminal.sqf", 
	nil,1,false,true,"","_target getVariable ['RadioInterference',-1] == 0"
];

_terminal addAction [
	"Close Terminal", "player\dataterminal\CloseTerminal.sqf",
	nil,1,false,true,"","_target getVariable ['RadioInterference',-1] == 2"
];

// condition: _terminal getVariable ("RadioInterference",false)
