#include "\z\ace\addons\main\script_component.hpp"

[[west, east, civilian, independent], []] call ace_spectator_fnc_updateSpectatableSides;
[[0,1,2], []] call ace_spectator_fnc_updateCameraModes;
["You died too often. Respawns are disabled now. Free Cam enabled."] call EFUNC(common,displayTextStructured); 