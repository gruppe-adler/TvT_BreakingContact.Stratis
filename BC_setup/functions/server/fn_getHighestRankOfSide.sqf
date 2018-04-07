params ["_side"];

private _sideUnits = [];
private _return = objNull;

// get all units of side
{
    if (side _x isEqualTo _side && isPlayer _x) then {
        _sideUnits pushback _x;
    };
} forEach (playableUnits + switchableUnits);

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
