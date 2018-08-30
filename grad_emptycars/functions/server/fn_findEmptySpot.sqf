params ["_position", "_radius", "_count", "_types"];

private ["_objType", "_spawnPos"];

for "_i" from 0 to _count do {

  _randomLocation = selectRandom (nearestLocations [
    _position, 
    ["NameCity","NameCityCapital", "NameVillage"], 
    _radius
  ]);
     private _spawnPos = [
      locationPosition _randomLocation, 
      [0,50], 
      random 360, 
      0, 
      [1,50]
  ] call SHK_pos;

  private _location = nearestLocation [_position, ""];
  private _locationPosition = locationPosition _location;
  
  private _randomizedSpawnPos = [(_spawnPos select 0) + random 7 - random 14, (_spawnPos select 1) + random 7 - random 14, 0];

  if (isOnRoad _randomizedSpawnPos && _i > 0) then {
    _i = _i - 1;
    sleep 0.001;
    diag_log "not on road";
  } else {
    [_randomizedSpawnPos, selectRandom _types] call grad_emptycars_fnc_spawnCar;
    sleep 0.001;
  };
};