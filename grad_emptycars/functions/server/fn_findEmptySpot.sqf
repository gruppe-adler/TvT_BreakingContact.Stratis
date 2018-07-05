params ["_position", "_radius", "_count", "_types"];

private ["_objType", "_spawnPos"];

for "_i" from 0 to _count do {

	_spawnPos = [_position, [0,_radius], random 360, 0, [1,_radius]] call SHK_pos;

  private _location = nearestLocation [_position, ""];
  private _locationPosition = locationPosition _location;

  if (_position distance2D _locationPosition > (size _location select 0) && _i > 0) then {
      _i = _i - 1;
      sleep 0.001;
  } else {
    private _randomizedSpawnPos = [(_spawnPos select 0) + 10 - random 20, (_spawnPos select 1) + 10 - random 20, 0];

    if (isOnRoad _randomizedSpawnPos && _i > 0) then {
      _i = _i - 1;
      sleep 0.001;
    } else {
      [_randomizedSpawnPos, selectRandom _types] call grad_emptycars_fnc_spawnCar;
      sleep 0.001;
    };
  };
};