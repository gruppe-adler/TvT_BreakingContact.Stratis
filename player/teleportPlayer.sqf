
// takes location, distance

_location = _this select 0;
_distance = _this select 1;

_spawn = _location findEmptyPosition[1, 20, "B_Soldier_F"];
diag_log format ["teleporting %1 to %2.", player, _location];
playSound "beam";
cutText ["", "BLACK OUT", 0.1];

_nul = player setPos _spawn;
sleep 2;
openMap [false, false];
hintSilent "";
cutText ["", "BLACK IN", 1];

// make player vulnerable again
player allowDamage true;
// 3 call fn_sthud_usermenu_changeMode;
sleep 1;
cutText ["", "PLAIN"];

["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>Breaking Contact</t>",0,0,2,2] spawn BIS_fnc_dynamicText;

addBluforSpawnpadMarker = {
	_pos = _this;
	
	_blufor_marker_start = createMarkerLocal ["blufor_marker_spawnpad", _pos];
	_blufor_marker_start setMarkerShapeLocal "ICON";
	_blufor_marker_start setMarkerTypeLocal "hd_pickup";
	_blufor_marker_start setMarkerColorLocal "ColorWEST";
};

addOpforSpawnpadMarker = {
	_pos = _this;
	
	_opfor_marker_start = createMarkerLocal ["opfor_marker_spawnpad", _pos];
	_opfor_marker_start setMarkerShapeLocal "ICON";
	_opfor_marker_start setMarkerTypeLocal "hd_pickup";
	_opfor_marker_start setMarkerColorLocal "ColorEAST";
};

if (side player == west) then {
	[getPos US_SPAWN_PAD] call addBluforSpawnpadMarker;
};

if (side player == east) then {
	[getPos RUS_SPAWN_PAD] call addOpforSpawnpadMarker;
};