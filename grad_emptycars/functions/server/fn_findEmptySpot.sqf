params ["_position", "_radius", "_count", "_side"];

private ["_objType", "_spawnPos"];

for "_i" from 0 to _count do {

     _spawnPos = [_position, [0,_radius], random 360, 0, [1,_radius]] call SHK_pos;

     _randomizedSpawnPos = [(_spawnPos select 0) + 10 - random 20, (_spawnPos select 1) + 10 - random 20, 0];

     if (isOnRoad _randomizedSpawnPos) then {
          _i = _i - 1;
          sleep 0.001;
     } else {
          [_randomizedSpawnPos] call grad_emptycars_fnc_spawnCar;
          sleep 0.001;
     };
};