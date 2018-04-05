params ["_unit"];

private _location = [0,0];
if (side _unit == west) then {
  _location = BLUFOR_TELEPORT_TARGET;
} else {
  _location = OPFOR_TELEPORT_TARGET;
};

_spawn = _location findEmptyPosition [2, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", _unit, _location];
_unit setPos _spawn;
