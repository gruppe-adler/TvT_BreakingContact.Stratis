params ["_side"];

private _string = format ["BC_startVehicle_%1", _side];
private _position = missionNamespace getVariable [_string, []];

if (count _position isEqualTo 0) then {     _position = [0,0,0]; // fallback, but should never happen
};

_position