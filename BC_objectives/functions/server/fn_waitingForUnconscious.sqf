params ["_varName"];

private ["_bool"];

for [{_i=0}, {_i<20}, {_i=_i+1}] do
{
     _bool = call compile _varName;
     if (!_bool) exitWith {};
     sleep 0.5;
};

if (_bool && _varName == "OPFOR_PRE_ELIMINATED") then {["OPFOR_ELIMINATED", true] call CBA_fnc_publicVariable};
if (_bool && _varName == "BLUFOR_PRE_ELIMINATED") then {["BLUFOR_ELIMINATED", true] call CBA_fnc_publicVariable};
