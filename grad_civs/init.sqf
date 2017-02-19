waituntil {!isNil "FACTIONS_DEFAULT"};

0 = [!FACTIONS_DEFAULT] execVM "grad_civs\definitions.sqf";

// maximum persons on map
GRAD_CIV_MAX_COUNT = 45;

GRAD_CIV_MIN_SPAWN_DISTANCE = 1500;
GRAD_CIV_MAX_SPAWN_DISTANCE = 4500;

GRAD_CIV_DEBUG = false;

// do not edit below //
GRAD_CIV_ONFOOT_COUNT = 0;
GRAD_CIV_ONFOOT_GROUPS = [];


call GRAD_civs_fnc_startMainLoop;