waituntil {!isNil "TRACKING_PERSON"};

GRAD_civ_clothes = [];
GRAD_civ_headgear = [];

call GRAD_civs_fnc_clothDefinitions;

// maximum persons on map
GRAD_CIV_MAX_COUNT = 45;

GRAD_CIV_MIN_SPAWN_DISTANCE = 1500;
GRAD_CIV_MAX_SPAWN_DISTANCE = 4500;

GRAD_CIV_DEBUG = false;

// do not edit below //
GRAD_CIV_ONFOOT_COUNT = 0;
GRAD_CIV_ONFOOT_GROUPS = [];

call GRAD_civs_fnc_startMainLoop;