params ["_terminal"];

_terminal addAction [
	"Open Terminal", "player\dataterminal\OpenTerminal.sqf", 
	nil,1,false,true,"","_target getVariable ['RadioInterference',false]"
];

_terminal addAction [
	"Close Terminal", "player\dataterminal\CloseTerminal.sqf",
	nil,1,false,true,"","!(_target getVariable ['RadioInterference',false])"
];

// condition: _terminal getVariable ("RadioInterference",false)
