params ["_side"];

private _string = format ["BC_startVehicle_%1", _side];
private _vehicle = missionNamespace getVariable [_string, objNull];
private _position = [0,0,0];

if (!isNull _vehicle) then {
	_position = getPos _vehicle;
};

_position