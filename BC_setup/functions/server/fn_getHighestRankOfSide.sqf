params ["_side", ["_excludeUnit", objNull]];

private _sideUnits = [];
private _return = objNull;

diag_log format ["getting highest rank for %1", _side];

// get all units of side
{
    if (side _x isEqualTo _side) then {
        _sideUnits pushback _x;
    };
} forEach (playableUnits + switchableUnits);

if (!isNull _excludeUnit && (_sideUnits find _excludeUnit > -1)) then {
    _sideUnits = _sideUnits - [_excludeUnit];
};

// extract highest rank of side
{
    if (isNull _return) then {
          _return = _x;
    } else {
          if (rankId _x > rankId _return) then {
              _return = _x;
          };
    };
} forEach _sideUnits;

_return
