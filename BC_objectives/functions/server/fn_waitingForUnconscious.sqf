params ["_varName"];



for [{_i=0}, {_i<20}, {_i=_i+1}] do
{
	_bool = call compile _varName;
	if (!_bool) exitWith {};
	sleep 0.5;
};

if (_bool && _varName == "OPFOR_PRE_ELIMINATED") then {OPFOR_ELIMINATED = true; publicVariable "OPFOR_ELIMINATED";};
if (_bool && _varName == "BLUFOR_PRE_ELIMINATED") then {BLUFOR_ELIMINATED = true; publicVariable "BLUFOR_ELIMINATED";};
