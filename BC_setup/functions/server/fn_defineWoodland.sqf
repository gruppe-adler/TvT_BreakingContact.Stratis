BC_IS_WOODLAND = ["isWoodland",true] call BC_setup_fnc_getIslandCfgEntry;

CONQUER_MODE = (["CONQUER_MODE", 1] call BIS_fnc_getParamValue) == 0;
publicVariable "CONQUER_MODE";