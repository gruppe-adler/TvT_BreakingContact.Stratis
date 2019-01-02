#include "\z\ace\addons\main\script_component.hpp"

params ["_position"];

private _return = false;


if (surfaceIsWater _position) then {
  private _hint = localize "str_GRAD_spawn_on_water";
  [_hint] call EFUNC(common,displayTextStructured);
  _return = true;
};

_return
