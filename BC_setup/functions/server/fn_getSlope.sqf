/*
    by Fry
*/

private ["_position", "_radius", "_slopeObject", "_centerHeight", "_height", "_direction", "_count"];
_position = _this select 0;_radius = _this select 1;
_slopeObject = "Logic" createVehicleLocal _position;
_slopeObject setPos _position;
_centerHeight = getPosASL _slopeObject select 2;
_height = 0;_direction = 0;
for "_count" from 0 to 7 do {
  _slopeObject setPos [(_position select 0)+((sin _direction)*_radius),(_position select 1)+((cos _direction)*_radius),0];
  _direction = _direction + 45;
  _height = _height + abs (_centerHeight - (getPosASL _slopeObject select 2));
};
deleteVehicle _slopeObject;
_height / 8
