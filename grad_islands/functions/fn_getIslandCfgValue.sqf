#define PREFIX GRAD
#define COMPONENT islands
#include "\x\cba\addons\main\script_macros_mission.hpp"


params ["_entry"];
_cfg = missionConfigFile >> "cfgGradIslands" >> worldName;
if (!isClass _cfg) exitWith {diag_log format ["Config for island %1 not found.", worldName];};

if (isNumber (_cfg >> _entry)) exitWith {getNumber (_cfg >> _entry)};
if (isArray (_cfg >> _entry)) exitWith {getArray (_cfg >> _entry)};
if (isText (_cfg >> _entry)) exitWith {
    _return = getText (_cfg >> _entry);
    if (_return == "true") then {
        _return = true
    } else {
        if (_return == "false") then {_return = false};
    };
    _return
};

diag_log format ["%1 not found in config for %2.",_entry, worldName];
-1;
