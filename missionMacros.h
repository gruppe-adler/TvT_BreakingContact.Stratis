#define debugLog(msg) if (DEBUG_MODE) then { [msg, "GRAD_mission_debug", [true, true, true] ] call CBA_fnc_debug; }
#define adminLog(msg) [msg, "GRAD_mission_admin", [DEBUG_MODE, true, false] ] call CBA_fnc_debug
