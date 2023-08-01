params ["_name"];

private _player = objNull;
{
	if (name _x isEqualTo _name) exitWith {
		_player = _x;
	};
} forEach allPlayers; 

_player