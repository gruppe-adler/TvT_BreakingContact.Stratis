params ["_center", "_items", "_spawnDistance", "_searchDistance"];

_result = [nil,nil];

_mapSizeArray = [] call BC_setup_fnc_getMapSize;
_mapSizeArray params ["_mapSize", "_mapSizeKnown"];

_iterationNothing = 0;
_iterationOutside = 0;
_iterationSlope = 0;
_iterationSecondPos = 0;
_iterationTooClose = 0;

_found = false;

_testPos1 = [0,0,0];
_testPos2 = [0,0,0];

_startTime = time;

while {!_found} do {

  _found = true;

  if (time > (_startTime + 30)) then {
    _startTime = time;
    _searchDistance = _searchDistance + 50;
    _spawnDistance = _spawnDistance - 25;
    diag_log format ["widening spawn radius by 25m (search up to: %1, distance min: %2)", _searchDistance, _spawnDistance];
  };


  // put something very big in there, just to be sure there is enough room
  _testPos1 = [_center,[_spawnDistance,_spawnDistance + 100], random 360,0,[2,_searchDistance],[_searchDistance,"rhsusf_CH53E_USMC"]] call SHK_pos;
  if (count _testPos1 < 1) then {
    _result = [nil,nil];
    _iterationNothing = _iterationNothing + 1;
     _found = false;
     } else {

       // if map size is known and spawn position is outside map, result is 1
      if (!([_mapSize, _testPos1] call BC_setup_fnc_isInsideMap) && _mapSizeKnown) then {
        _result = [nil,nil];
        _iterationOutside = _iterationOutside + 1;
         _found = false;
      } else {
        if ([_testPos1, 5] call BC_setup_fnc_get_slope > 0.4) then {_result = [nil,nil];
          _iterationSlope = _iterationSlope + 1;
          _found = false;
        } else {
          _testPos2 = [_testPos1,[20,60], random 360,0,[2,60], [_searchDistance,"rhsusf_CH53E_USMC"]] call SHK_pos;

          if (count _testPos2 < 1) then {_result = [nil,nil];
            _iterationSecondPos = _iterationSecondPos + 1;
              _found = false;
          } else {
            if (_testPos1 distance _testPos2 < 10) then {
              _result = [nil,nil];
              _iterationTooClose = _iterationTooClose + 1;
              _found = false;
            } else {
              if ([_testPos2, 5] call BC_setup_fnc_get_slope > 0.4) then {
                _result = [nil,nil];
                _iterationSlope = _iterationSlope + 1;
                _found = false;
              };
            };
          };
        };
      };
    };
  sleep 0.0001;
};

private _vehicle = createVehicle [(_items select 0), _testPos1, [], 2, "CAN_COLLIDE"];
private _cone = createVehicle [(_items select 1), _testPos2, [], 0, "CAN_COLLIDE"];

_result = [_vehicle, _cone];

diag_log format ["found spawn positions after %1 x nothing, %2 x outside map, %3 x too slopy, %4 x too close", _iterationNothing, _iterationOutside, _iterationSlope, _iterationSecondPos];

_result
