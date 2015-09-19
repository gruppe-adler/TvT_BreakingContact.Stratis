
// CRASHPILOT
_identity = _this select 0;

// reduce range of radio to 20%
player setVariable ["tf_sendingDistanceMultiplicator", 0.2];

_currentPosition = getPos player;
_closest = [crash_sites, _currentPosition] call BIS_fnc_nearestPosition;

if (DEBUG) then {diag_log format ["Closest Marker of %2 is %1",_closest,_identity];};

CRASH_SITE = getMarkerPos _closest;
publicVariable "CRASH_SITE";

CRASH_SITE_SELECTED = true;
publicVariable "CRASH_SITE_SELECTED";

// find a random position in circle
crashSpawnPos = [getMarkerPos _closest,[10,80], random 360] call SHK_pos;

// find a spawn pos on given position


_veh1 = createVehicle ["RHS_Mi24Vt_vvs", crashSpawnPos, [], 0, "NONE"];
[_veh1,	nil,[	"exhaust_hide", 1,	"at_rack_hide", 0]] call BIS_fnc_initVehicle;

_veh1 setObjectTextureGlobal [0, "\rhsafrf\addons\rhs_a2port_air\mi35\data\camo\mi24p_001_camo2_co.paa"];
_veh1 setObjectTextureGlobal [1, "\rhsafrf\addons\rhs_a2port_air\mi35\data\camo\mi24p_002_camo2_co.paa"];
_veh1 setObjectTextureGlobal [2, "rhsafrf\addons\rhs_a2port_air\Mi17\data\camo\mi8_det_g_camo1_co.paa"];

_veh1 allowDamage false;
_veh1 setDamage 0.95;
_veh1 setFuel 0.01;
clearItemCargoGlobal _veh1;
clearWeaponCargoGlobal _veh1;
clearMagazineCargoGlobal _veh1;
clearWeaponCargoGlobal _veh1;
sleep 0.1;
_veh2 = createVehicle ["CraterLong", getPos _veh1, [], 0, "CAN_COLLIDE"];
_smoke = [_veh1, "SMOKE_BIG"] execVM "helpers\fireAndSmoke.sqf";
_smoke2 = [_veh1, "SMOKE_BIG"] execVM "helpers\fireAndSmoke.sqf";

null = [{[[west,east,independent],crashSpawnPos] execVM "helpers\createMarkerForSides.sqf";}, "BIS_fnc_spawn", true, true] spawn BIS_fnc_MP;