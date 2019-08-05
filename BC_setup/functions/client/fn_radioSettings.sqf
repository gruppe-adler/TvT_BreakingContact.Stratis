if (!hasInterface) exitWith {};

#ifdef GRAD_FACTIONS_USE_ACRE
    [] call BC_setup_fnc_ACREsettings;
#else
    [] call BC_setup_fnc_TFARsettings;
#endif
