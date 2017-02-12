#include "\z\ace\addons\main\script_component.hpp"

GRAD_wr_removeFromWaveRespawn = {
	[[west, east, civilian, independent], []] call ace_spectator_fnc_updateSpectatableSides;
	[[0,1,2], []] call ace_spectator_fnc_updateCameraModes;
	["You died too often. Respawns are disabled now. Free Cam enabled."] call EFUNC(common,displayTextStructured); 
};


checkWater = {
	_return = false;
	if (surfaceIsWater _this) then {
		_string = localize "str_GRAD_spawn_on_water";
		[_string] call EFUNC(common,displayTextStructured);
	};
};