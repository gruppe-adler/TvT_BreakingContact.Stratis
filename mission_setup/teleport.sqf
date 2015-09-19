#include "\z\ace\addons\main\script_component.hpp"

spawnpoint_mapclick = [];

cutText ["", "PLAIN", 0];


if (player == opfor_teamlead && !OPFOR_TELEPORTED) then {

	//[localize "str_GRAD_choose_spawn_location"] call EFUNC(common,displayTextStructured);

	openMap [true,false];

	onMapSingleClick "[_pos] call teleportGroup; onMapSingleClick ''; true";
};

if (player == blufor_teamlead && OPFOR_TELEPORTED) then {

	//[localize "str_GRAD_choose_spawn_location"] call EFUNC(common,displayTextStructured);

	openMap [true,false];

	onMapSingleClick "[_pos] call teleportGroup; onMapSingleClick ''; true";
};


// checks for water
checkWater = {
	_bool = false;
	if (surfaceIsWater spawnpoint_mapclick) then {_bool = true;};
	_bool
};

createOpforMarker = {
	_opfor_marker = createMarker ["opfor_marker", _this select 0];
	_opfor_marker setMarkerType "hd_objective";
	_opfor_marker setMarkerColor "ColorWEST";
	// with sector module, marker is only needed for getting position
	_opfor_marker setMarkerAlpha 0;	
};

opforTeleporting = {

	OPFOR_TELEPORTED = TRUE; publicVariable "OPFOR_TELEPORTED";

	[[[east,spawnpoint_mapclick],"mission_setup\teleportEffect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
	[spawnpoint_mapclick] call createOpforMarker;	
};

bluforTeleporting = {

	BLUFOR_TELEPORTED = TRUE; publicVariable "BLUFOR_TELEPORTED";

	// entfernung marker zu spawnpunkt zu klein oder groß?
	_distance = spawnpoint_mapclick distance (getMarkerPos "opfor_marker");
	if (_distance < MINIMAL_BLUFOR_SPAWN_DISTANCE) exitWith {hintSilent format [localize "str_GRAD_spawnTooClose1" + '(%1 m).' + localize "str_GRAD_spawnTooClose2" + ' %2.', floor(_distance), MINIMAL_BLUFOR_SPAWN_DISTANCE];
	player execVM "mission_setup\teleport.sqf";};
	if (_distance > MAXIMAL_BLUFOR_SPAWN_DISTANCE) exitWith {hintSilent format [localize "str_GRAD_spawnTooFar1" + '(%1 m).' + localize "str_GRAD_spawnTooFar2" + ' %2.', floor(_distance), MAXIMAL_BLUFOR_SPAWN_DISTANCE];
	player execVM "mission_setup\teleport.sqf";
	};

	// teleport und gucken, ob posi frei ist
	[[[west,spawnpoint_mapclick],"mission_setup\teleportEffect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

	[[[spawnpoint_mapclick],"mission_setup\blufor_spawn_marker.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
};

// teleport command
teleportGroup = {

	spawnpoint_mapclick = _this select 0;
	openMap [false,false];

	//hintSilent format ["Geklickt : %1",spawnpoint_mapclick];
	// checks for water
	if ([spawnpoint_mapclick] call checkWater) exitWith {
		[localize "str_GRAD_spawn_on_water"] call EFUNC(common,displayTextStructured);
		player execVM "mission_setup\teleport.sqf";
	};

	// doesnt work correctly in SP tests
	[[[spawnpoint_mapclick],"mission_setup\createMarkerBlufor.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

	if (player == opfor_teamlead && !OPFOR_TELEPORTED) then {
		[spawnpoint_mapclick] call opforTeleporting;
	};

	if (player == blufor_teamlead && OPFOR_TELEPORTED) then {
		[spawnpoint_mapclick] call bluforTeleporting;
	};
};
