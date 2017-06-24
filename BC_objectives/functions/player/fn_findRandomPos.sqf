/* ripped from diod @prometheus */

params ["_center", ["_radii", [0,15]], ["_angles", [0,360]], ["_vehicleType", "B_Soldier_F"]];
private ["_pos"];
_radii params ["_minRad", "_maxRad"];
_angles params ["_minAngle", "_maxAngle"];

_center = if (typeName _center == "OBJECT") then {getPos _center} else {_center};

for [{private _i=0}, {_i<30}, {_i=_i+1}] do {
    _searDist = (random (_maxRad - _minRad)) + _minRad;
    _searAngle = (random (_maxAngle - _minAngle)) + _minAngle;
    _searchPos = _center getPos [_searDist, _searAngle];
    _pos = _searchPos findEmptyPosition [0,10,_vehicleType];

    if (str _pos != "[]") exitWith {};
};

if (str _pos == "[]") then {
    _pos = _center;
};

_pos